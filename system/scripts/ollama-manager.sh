#!/usr/bin/env bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Default settings
USE_FZF=false
VERBOSE=false
QUIET=false
CONFIG_FILE="$HOME/.ollama_script_config"

# Function to display usage information
usage() {
    echo -e "${BOLD}Usage:${NC} $0 [command] [options]"
    echo
    echo -e "${BOLD}Commands:${NC}"
    echo -e "  ${GREEN}run${NC}       Run a model"
    echo -e "  ${GREEN}rm${NC}        Remove a model"
    echo -e "  ${GREEN}stop${NC}      Stop a running model"
    echo -e "  ${GREEN}create${NC}    Create a model from a Modelfile"
    echo -e "  ${GREEN}show${NC}      Show information for a model"
    echo -e "  ${GREEN}pull${NC}      Pull a model from a registry"
    echo -e "  ${GREEN}push${NC}      Push a model to a registry"
    echo -e "  ${GREEN}help${NC}      Display this help message"
    echo
    echo -e "${BOLD}Options:${NC}"
    echo -e "  ${CYAN}-m, --model MODEL_NAME${NC}   Specify the model name"
    echo -e "  ${CYAN}--fzf${NC}                    Use fzf for selection"
    echo -e "  ${CYAN}-v, --verbose${NC}           Enable verbose output"
    echo -e "  ${CYAN}-q, --quiet${NC}             Suppress non-error messages"
    echo -e "  ${CYAN}-h, --help${NC}              Display this help message"
    exit 1
}

# Function to load configuration file
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    fi
}

# Function to log messages
log() {
    if [ "$QUIET" = false ]; then
        echo -e "$1"
    fi
}

# Function to log verbose messages
verbose_log() {
    if [ "$VERBOSE" = true ]; then
        echo -e "$1"
    fi
}

# Function to get the list of models
get_models() {
    local cmd="$1"
    if [ "$cmd" = "list" ]; then
        models=$(ollama list | tail -n +2 | awk '{print $1}')
    elif [ "$cmd" = "ps" ]; then
        models=$(ollama ps | tail -n +2 | awk '{print $1}')
    else
        echo -e "${RED}Invalid command to get models.${NC}"
        exit 1
    fi
}

# Function to select a model
select_model() {
    local models="$1"
    local prompt="$2"

    if [ "$USE_FZF" = true ]; then
        # Check if fzf is installed
        if ! command -v fzf &> /dev/null; then
            echo -e "${RED}Error:${NC} fzf is not installed. Please install fzf or run without --fzf."
            exit 1
        fi

        # Use fzf for model selection
        selected_model=$(echo "$models" | fzf --prompt="$prompt ")
        if [ -z "$selected_model" ]; then
            echo -e "${YELLOW}No model selected.${NC}"
            exit 1
        fi
    else
        # Read models into an array
        IFS=$'\n' read -r -a model_array <<< "$models"

        # Check if array is empty
        if [ ${#model_array[@]} -eq 0 ]; then
            echo -e "${YELLOW}No models available for selection.${NC}"
            exit 1
        fi

        # Display the models for selection
        echo -e "${CYAN}$prompt${NC}"
        select selected_model in "${model_array[@]}"; do
            if [ -n "$selected_model" ]; then
                break
            else
                echo -e "${YELLOW}Invalid selection. Please try again.${NC}"
            fi
        done
    fi
}

# Function to confirm action
confirm_action() {
    local message="$1"
    echo -ne "${YELLOW}$message [y/N]: ${NC}"
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            return 0
            ;;
        *)
            echo -e "${YELLOW}Action canceled by user.${NC}"
            exit 0
            ;;
    esac
}

# Function to run a model
run_model() {
    get_models "list"
    if [ -z "$models" ]; then
        echo -e "${YELLOW}No models installed.${NC}"
        exit 1
    fi

    if [[ -n "$MODEL_NAME" ]]; then
        if echo "$models" | grep -qx "$MODEL_NAME"; then
            selected_model="$MODEL_NAME"
        else
            echo -e "${RED}Model '$MODEL_NAME' is not installed.${NC}"
            exit 1
        fi
    else
        select_model "$models" "Please select a model to run:"
    fi

    log "${GREEN}Starting model '$selected_model'...${NC}"
    ollama run "$selected_model"
}

# Function to remove a model
remove_model() {
    get_models "list"
    if [ -z "$models" ]; then
        echo -e "${YELLOW}No models installed.${NC}"
        exit 1
    fi

    if [[ -n "$MODEL_NAME" ]]; then
        if echo "$models" | grep -qx "$MODEL_NAME"; then
            selected_model="$MODEL_NAME"
        else
            echo -e "${RED}Model '$MODEL_NAME' is not installed.${NC}"
            exit 1
        fi
    else
        select_model "$models" "Please select a model to remove:"
    fi

    confirm_action "Are you sure you want to remove model '$selected_model'?"
    log "${GREEN}Removing model '$selected_model'...${NC}"
    ollama rm "$selected_model"
}

# Function to stop a running model
stop_model() {
    get_models "ps"
    if [ -z "$models" ]; then
        echo -e "${YELLOW}No models are currently running.${NC}"
        exit 1
    fi

    if [[ -n "$MODEL_NAME" ]]; then
        if echo "$models" | grep -qx "$MODEL_NAME"; then
            selected_model="$MODEL_NAME"
        else
            echo -e "${RED}Model '$MODEL_NAME' is not running.${NC}"
            exit 1
        fi
    else
        select_model "$models" "Please select a model to stop:"
    fi

    confirm_action "Are you sure you want to stop model '$selected_model'?"
    log "${GREEN}Stopping model '$selected_model'...${NC}"
    ollama stop "$selected_model"
}

# Function to show model information
show_model() {
    if [[ -n "$MODEL_NAME" ]]; then
        selected_model="$MODEL_NAME"
    else
        get_models "list"
        if [ -z "$models" ]; then
            echo -e "${YELLOW}No models installed.${NC}"
            exit 1
        fi
        select_model "$models" "Please select a model to show information:"
    fi

    log "${GREEN}Showing information for model '$selected_model'...${NC}"
    ollama show "$selected_model"
}

# Function to pull a model
pull_model() {
    if [[ -n "$MODEL_NAME" ]]; then
        selected_model="$MODEL_NAME"
    else
        echo -e "${RED}Error:${NC} Model name is required for pull."
        exit 1
    fi

    log "${GREEN}Pulling model '$selected_model'...${NC}"
    ollama pull "$selected_model"
}

# Function to push a model
push_model() {
    if [[ -n "$MODEL_NAME" ]]; then
        selected_model="$MODEL_NAME"
    else
        echo -e "${RED}Error:${NC} Model name is required for push."
        exit 1
    fi

    log "${GREEN}Pushing model '$selected_model'...${NC}"
    ollama push "$selected_model"
}

# Function to create a model
create_model() {
    if [[ -n "$MODEL_NAME" ]]; then
        selected_model="$MODEL_NAME"
    else
        echo -e "${RED}Error:${NC} Model name is required for create."
        exit 1
    fi

    log "${GREEN}Creating model '$selected_model'...${NC}"
    ollama create "$selected_model"
}

# Main script logic

# Load configuration
load_config

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

# Extract the command
COMMAND="$1"
shift

# Parse options
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -m|--model)
            if [[ -n "$2" ]]; then
                MODEL_NAME="$2"
                shift 2
            else
                echo -e "${RED}Error:${NC} --model requires a non-empty option argument."
                usage
            fi
            ;;
        --fzf)
            USE_FZF=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -q|--quiet)
            QUIET=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo -e "${RED}Unknown option:${NC} $1"
            usage
            ;;
    esac
done

# Dispatch to command functions
case "$COMMAND" in
    run)
        run_model
        ;;
    rm)
        remove_model
        ;;
    stop)
        stop_model
        ;;
    show)
        show_model
        ;;
    pull)
        pull_model
        ;;
    push)
        push_model
        ;;
    create)
        create_model
        ;;
    help|-h|--help)
        usage
        ;;
    *)
        echo -e "${RED}Unknown command:${NC} $COMMAND"
        usage
        ;;
esac
