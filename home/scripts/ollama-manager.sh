#!/usr/bin/env node

// Import required modules
import { Command } from "commander";
import chalk from "chalk";
import { createSpinner } from "nanospinner";
import axios from "axios";
import fs from "fs";
import path from "path";
import { execSync } from "child_process";
import readline from "readline";
import prompts from "prompts";

// Constants for color definitions
const RED = chalk.red;
const GREEN = chalk.green;
const YELLOW = chalk.yellow;
const BLUE = chalk.blue;
const CYAN = chalk.cyan;
const BOLD = chalk.bold;
const NC = chalk.reset;

// Default settings
let VERBOSE = false;
let QUIET = false;
const CONFIG_FILE = path.join(
  process.env.HOME || process.env.USERPROFILE,
  ".ollama_script_config",
);

// Function to load configuration file
const loadConfig = () => {
  if (fs.existsSync(CONFIG_FILE)) {
    const config = fs.readFileSync(CONFIG_FILE, "utf8");
    const configObj = JSON.parse(config);
    VERBOSE = configObj.VERBOSE !== undefined ? configObj.VERBOSE : VERBOSE;
    QUIET = configObj.QUIET !== undefined ? configObj.QUIET : QUIET;
  }
};

// Function to log messages
const log = (message) => {
  if (!QUIET) {
    console.log(message);
  }
};

// Function to log verbose messages
const verboseLog = (message) => {
  if (VERBOSE) {
    console.log(message);
  }
};

// Function to get the list of models
const getModels = (cmd) => {
  try {
    let output = "";
    if (cmd === "list") {
      output = execSync("ollama list").toString();
    } else if (cmd === "ps") {
      output = execSync("ollama ps").toString();
    } else {
      console.log(RED("Invalid command to get models."));
      process.exit(1);
    }
    const lines = output.trim().split("\n").slice(1);
    const models = lines.map((line) => line.split(/\s+/)[0]);
    return models;
  } catch (error) {
    console.log(RED("Error retrieving models."));
    process.exit(1);
  }
};

// Function to select a model
const selectModel = async (models, promptMessage) => {
  const response = await prompts({
    type: "select",
    name: "model",
    message: CYAN(promptMessage),
    choices: models.map((model) => ({ title: model, value: model })),
  });

  if (!response.model) {
    console.log(YELLOW("No model selected."));
    process.exit(1);
  }
  return response.model;
};

// Function to confirm action
const confirmAction = async (message) => {
  const response = await prompts({
    type: "confirm",
    name: "confirm",
    message: YELLOW(message),
    initial: false,
  });

  if (!response.confirm) {
    console.log(YELLOW("Action canceled by user."));
    process.exit(0);
  }
};

// Function to run a model
const runModel = async (modelName) => {
  const models = getModels("list");
  if (models.length === 0) {
    console.log(YELLOW("No models installed."));
    process.exit(1);
  }

  let selectedModel = modelName;
  if (modelName) {
    if (!models.includes(modelName)) {
      console.log(RED(Model '${modelName}' is not installed.));
      process.exit(1);
    }
  } else {
    selectedModel = await selectModel(models, "Please select a model to run:");
  }

  // Check if required commands are available
  try {
    execSync("curl --version", { stdio: "ignore" });
  } catch (error) {
    console.log(RED("Error: curl is not installed. Please install curl."));
    process.exit(1);
  }

  log(GREEN(Starting chat with model '${selectedModel}'...));
  console.log(YELLOW("Type 'exit' to end the chat."));

  // Create readline interface
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    prompt: BLUE("You: "),
  });

  rl.prompt();

  rl.on("line", async (userInput) => {
    if (userInput.trim().toLowerCase() === "exit") {
      console.log(YELLOW("Exiting chat."));
      rl.close();
      process.exit(0);
    }

    // Send request to Ollama API
    const payload = {
      model: selectedModel,
      prompt: userInput,
    };

    process.stdout.write(GREEN("Model: "));

    // Initialize code block state
    let inCodeBlock = false;
    let codeBlockBuffer = "";
    const codeBlockColor = chalk.gray;
    let buffer = "";

    try {
      const response = await axios.post(
        "http://localhost:11434/api/generate",
        payload,
        {
          responseType: "stream",
          headers: { "Content-Type": "application/json" },
        },
      );

      response.data.on("data", (chunk) => {
        const lines = chunk.toString().split("\n").filter(Boolean);
        for (const line of lines) {
          const parsedLine = JSON.parse(line);
          const responseText = parsedLine.response;
          const doneFlag = parsedLine.done;
          const errorMessage = parsedLine.error;

          if (errorMessage) {
            console.log(\n${RED("Error from model:")} ${errorMessage});
            response.data.destroy();
            break;
          }

          if (responseText) {
            // Process the responseText character by character
            for (let i = 0; i < responseText.length; i++) {
              const char = responseText.charAt(i);
              buffer += char;

              // Check for triple backticks
              if (buffer.endsWith("

")) {
                // Toggle code block state
                inCodeBlock = !inCodeBlock;
                buffer = buffer.slice(0, -3);

                // If entering code block, reset codeBlockBuffer
                if (inCodeBlock) {
                  // Print any text before the code block
                  if (buffer.trim()) {
                    process.stdout.write(buffer.trimEnd());
                  }
                  buffer = "";
                  codeBlockBuffer = "";
                } else {
                  // Exiting code block, output the entire code block at once
                  console.log(
                    "\n" + codeBlockColor(codeBlockBuffer.trimEnd()) + "\n",
                  );
                  codeBlockBuffer = "";
                }
                continue;
              }

              if (inCodeBlock) {
                // Collect code block content
                codeBlockBuffer += char;
              } else {
                // Handle newlines to prevent extra spaces
                if (char === "\n") {
                  process.stdout.write(buffer.trimEnd());
                  buffer = "";
                  process.stdout.write("\n");
                }
              }
            }
          }

          if (doneFlag) {
            // Output any remaining text
            if (buffer.trim()) {
              process.stdout.write(buffer.trimEnd());
              buffer = "";
            }
            if (inCodeBlock && codeBlockBuffer.trim()) {
              // Output the code block if not already output
              console.log(
                "\n" + codeBlockColor(codeBlockBuffer.trimEnd()) + "\n",
              );
              codeBlockBuffer = "";
            }

            // Ensure we reset the code block state
            if (inCodeBlock) {
              inCodeBlock = false;
            }

            response.data.destroy();
            // Start next prompt after model's response
            process.stdout.write("\n");
            rl.prompt();
            break;
          }
        }
      });

      response.data.on("error", (err) => {
        console.log(RED("Error in response data."));
        if (VERBOSE) console.error(err);
        rl.close();
        process.exit(1);
      });
    } catch (error) {
      console.log(RED("Error communicating with the Ollama API."));
      if (VERBOSE) {
        console.error(error);
      }
      rl.close();
      process.exit(1);
    }
  });
};

// Function to remove a model
const removeModel = async (modelName) => {
  const models = getModels("list");
  if (models.length === 0) {
    console.log(YELLOW("No models installed."));
    process.exit(1);
  }

  let selectedModel = modelName;
  if (modelName) {
    if (!models.includes(modelName)) {
      console.log(RED(`Model '${modelName}' is not installed.`));
      process.exit(1);
    }
  } else {
    selectedModel = await selectModel(
      models,
      "Please select a model to remove:",
    );
  }

  await confirmAction(
    `Are you sure you want to remove model '${selectedModel}'?`,
  );
  log(GREEN(`Removing model '${selectedModel}'...`));

  try {
    execSync(`ollama rm ${selectedModel}`, { stdio: "inherit" });
  } catch (error) {
    console.log(RED("Error removing model."));
    process.exit(1);
  }
};

// Function to stop a running model
const stopModel = async (modelName) => {
  const models = getModels("ps");
  if (models.length === 0) {
    console.log(YELLOW("No models are currently running."));
    process.exit(1);
  }

  let selectedModel = modelName;
  if (modelName) {
    if (!models.includes(modelName)) {
      console.log(RED(`Model '${modelName}' is not running.`));
      process.exit(1);
    }
  } else {
    selectedModel = await selectModel(models, "Please select a model to stop:");
  }

  await confirmAction(
    `Are you sure you want to stop model '${selectedModel}'?`,
  );
  log(GREEN(`Stopping model '${selectedModel}'...`));

  try {
    execSync(`ollama stop ${selectedModel}`, { stdio: "inherit" });
  } catch (error) {
    console.log(RED("Error stopping model."));
    process.exit(1);
  }
};

// Function to show model information
const showModel = async (modelName) => {
  let selectedModel = modelName;
  if (!selectedModel) {
    const models = getModels("list");
    if (models.length === 0) {
      console.log(YELLOW("No models installed."));
      process.exit(1);
    }
    selectedModel = await selectModel(
      models,
      "Please select a model to show information:",
    );
  }

  log(GREEN(`Showing information for model '${selectedModel}'...`));
  try {
    execSync(`ollama show ${selectedModel}`, { stdio: "inherit" });
  } catch (error) {
    console.log(RED("Error showing model information."));
    process.exit(1);
  }
};

// Function to pull a model
const pullModel = async (modelName) => {
  if (!modelName) {
    console.log(RED("Error: Model name is required for pull."));
    process.exit(1);
  }

  log(GREEN(`Pulling model '${modelName}'...`));
  const spinner = createSpinner("Pulling model...").start();

  try {
    execSync(`ollama pull ${modelName}`, { stdio: "inherit" });
    spinner.success({ text: "Model pulled successfully." });
  } catch (error) {
    spinner.error({ text: "Error pulling model." });
    process.exit(1);
  }
};

// Function to push a model
const pushModel = async (modelName) => {
  if (!modelName) {
    console.log(RED("Error: Model name is required for push."));
    process.exit(1);
  }

  log(GREEN(`Pushing model '${modelName}'...`));
  const spinner = createSpinner("Pushing model...").start();

  try {
    execSync(`ollama push ${modelName}`, { stdio: "inherit" });
    spinner.success({ text: "Model pushed successfully." });
  } catch (error) {
    spinner.error({ text: "Error pushing model." });
    process.exit(1);
  }
};

// Function to create a model
const createModel = async (modelName) => {
  if (!modelName) {
    console.log(RED("Error: Model name is required for create."));
    process.exit(1);
  }

  log(GREEN(`Creating model '${modelName}'...`));
  try {
    execSync(`ollama create ${modelName}`, { stdio: "inherit" });
  } catch (error) {
    console.log(RED("Error creating model."));
    process.exit(1);
  }
};

// Main script logic

// Load configuration
loadConfig();

// Initialize commander
const program = new Command();

program
  .name("ollama-manager")
  .description("CLI tool to manage Ollama models")
  .version("1.0.0");

// Global options
program
  .option("-m, --model <model>", "Specify the model name")
  .option("-v, --verbose", "Enable verbose output")
  .option("-q, --quiet", "Suppress non-error messages");

// Run command
program
  .command("run")
  .description("Run a model")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await runModel(modelName);
  });

// Remove command
program
  .command("rm")
  .description("Remove a model")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await removeModel(modelName);
  });

// Stop command
program
  .command("stop")
  .description("Stop a running model")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await stopModel(modelName);
  });

// Show command
program
  .command("show")
  .description("Show information for a model")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await showModel(modelName);
  });

// Pull command
program
  .command("pull")
  .description("Pull a model from a registry")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await pullModel(modelName);
  });

// Push command
program
  .command("push")
  .description("Push a model to a registry")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await pushModel(modelName);
  });

// Create command
program
  .command("create")
  .description("Create a model from a Modelfile")
  .action(async () => {
    const modelName = program.opts().model;
    VERBOSE = program.opts().verbose || false;
    QUIET = program.opts().quiet || false;
    await createModel(modelName);
  });

// Parse and execute commands
program.parse(process.argv);
