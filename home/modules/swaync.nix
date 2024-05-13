{ config, ... }:

let
  colors = config.colorScheme.colors;
in
{

  home.file = {
    ".config/swaync/configSchema.json" = {
      text = ''

        	{
        	  "$schema": "https://json-schema.org/draft/2020-12/schema",
        	  "title": "SwayNotificationCenter JSON schema",
        	  "type": "object",
        	  "additionalProperties": false,
        	  "properties": {
        		"$schema": {
        		  "type": "string",
        		  "description": "Pointer to the schema against which this document should be validated."
        		},
        		"positionX": {
        		  "type": "string",
        		  "description": "Horizontal position of control center and notification window",
        		  "default": "right",
        		  "enum": ["right", "left", "center"]
        		},
        		"layer": {
        		  "type": "string",
        		  "description": "Layer of notification window",
        		  "default": "overlay",
        		  "enum": ["background", "bottom", "top", "overlay"]
        		},
        		"layer-shell": {
        		  "type": "boolean",
        		  "description": "Wether or not the windows should be opened as layer-shell surfaces. Note: Requires swaync restart to apply",
        		  "default": true
        		},
        		"cssPriority": {
        		  "type": "string",
        		  "description": "Which GTK priority to use when loading the default and user CSS files. Pick \"user\" to override XDG_CONFIG_HOME/gtk-3.0/gtk.css",
        		  "default": "application",
        		  "enum": ["application", "user"]
        		},
        		"positionY": {
        		  "type": "string",
        		  "description": "Vertical position of control center and notification window",
        		  "default": "top",
        		  "enum": ["top", "center", "bottom"]
        		},
        		"control-center-positionX": {
        		  "type": "string",
        		  "description": "Optional: Horizontal position of the control center. Supersedes positionX if not set to `none`",
        		  "default": "none",
        		  "enum": ["right", "left", "center", "none"]
        		},
        		"control-center-positionY": {
        		  "type": "string",
        		  "description": "Optional: Vertical position of the control center. Supersedes positionY if not set to `none`",
        		  "default": "none",
        		  "enum": ["top", "bottom", "none"]
        		},
        		"control-center-margin-top": {
        		  "type": "integer",
        		  "description": "The margin (in pixels) at the top of the control center. 0 to disable",
        		  "default": 0
        		},
        		"control-center-margin-bottom": {
        		  "type": "integer",
        		  "description": "The margin (in pixels) at the bottom of the control center. 0 to disable",
        		  "default": 0
        		},
        		"control-center-margin-right": {
        		  "type": "integer",
        		  "description": "The margin (in pixels) at the right of the control center. 0 to disable",
        		  "default": 0
        		},
        		"control-center-margin-left": {
        		  "type": "integer",
        		  "description": "The margin (in pixels) at the left of the control center. 0 to disable",
        		  "default": 0
        		},
        		"control-center-layer": {
        		  "type": "string",
        		  "description": "Layer of control center window",
        		  "default": "none",
        		  "enum": ["background", "bottom", "top", "overlay", "none"]
        		},
        		"control-center-exclusive-zone": {
        		  "type": "boolean",
        		  "description": "Whether or not the control center should follow the compositors exclusive zones. An example would be setting it to \"false\" to cover your panel/dock.",
        		  "default": true
        		},
        		"notification-2fa-action": {
        		  "type": "boolean",
        		  "description": "If each notification should display a 'COPY \"1234\"' action",
        		  "default": true
        		},
        		"notification-inline-replies": {
        		  "type": "boolean",
        		  "description": "If notifications should display a text field to reply if the sender requests it. NOTE: Replying in popup notifications is only available if the compositor supports GTK Layer-Shell ON_DEMAND keyboard interactivity.",
        		  "default": false
        		},
        		"notification-icon-size": {
        		  "type": "integer",
        		  "description": "The notification icon size (in pixels). The app icon size is 1/3",
        		  "default": 64,
        		  "minimum": 16
        		},
        		"notification-body-image-height": {
        		  "type": "integer",
        		  "description": "The notification body image height (in pixels)",
        		  "default": 100,
        		  "minimum": 100
        		},
        		"notification-body-image-width": {
        		  "type": "integer",
        		  "description": "The notification body image width (in pixels)",
        		  "default": 200,
        		  "minimum": 200
        		},
        		"timeout": {
        		  "type": "integer",
        		  "description": "The notification timeout for notifications with normal priority",
        		  "default": 10
        		},
        		"timeout-low": {
        		  "type": "integer",
        		  "description": "The notification timeout for notifications with low priority",
        		  "default": 5
        		},
        		"timeout-critical": {
        		  "type": "integer",
        		  "description": "The notification timeout for notifications with critical priority. 0 to disable",
        		  "default": 0
        		},
        		"notification-window-width": {
        		  "type": "integer",
        		  "description": "Width of the notification in pixels",
        		  "default": 500
        		},
        		"fit-to-screen": {
        		  "type": "boolean",
        		  "description": "If the control center should expand to both edges of the screen",
        		  "default": true
        		},
        		"relative-timestamps": {
        		  "type": "boolean",
        		  "description": "Display notification timestamps relative to now e.g. \"26 minutes ago\". If false, a local iso8601-formatted absolute timestamp is displayed.",
        		  "default": true
        		},
        		"control-center-height": {
        		  "type": "integer",
        		  "description": "Height of the control center in pixels. Ignored when 'fit-to-screen' is set to 'true'",
        		  "default": 600,
        		  "minimum": 300
        		},
        		"control-center-width": {
        		  "type": "integer",
        		  "description": "Width of the control center in pixels",
        		  "default": 500,
        		  "minimum": 300
        		},
        		"keyboard-shortcuts": {
        		  "type": "boolean",
        		  "description": "If control center should use keyboard shortcuts",
        		  "default": true
        		},
        		"image-visibility": {
        		  "type": "string",
        		  "description": "The notification image visibility when no icon is available.",
        		  "default": "when-available",
        		  "enum": ["always", "when-available", "never"]
        		},
        		"transition-time": {
        		  "type": "integer",
        		  "description": "The notification animation duration. 0 to disable",
        		  "default": 200
        		},
        		"hide-on-clear": {
        		  "type": "boolean",
        		  "description": "Hides the control center after pressing \"Clear All\"",
        		  "default": false
        		},
        		"hide-on-action": {
        		  "type": "boolean",
        		  "description": "Hides the control center when clicking on notification action",
        		  "default": true
        		},
        		"script-fail-notify": {
        		  "type": "boolean",
        		  "description": "Sends a notification if a script fails to run",
        		  "default": true
        		},
        		"scripts": {
        		  "type": "object",
        		  "description": "Which scripts to check and potentially run for every notification. If the notification doesn't include one of the properties, that property will be ignored. All properties (except for exec) use regex. If all properties match the given notification, the script will be run. Only the first matching script will be run.",
        		  "minProperties": 1,
        		  "additionalProperties": false,
        		  "patternProperties": {
        			"^.{1,}$": {
        			  "type": "object",
        			  "description": "Your script object.",
        			  "required": ["exec"],
        			  "minProperties": 2,
        			  "additionalProperties": false,
        			  "properties": {
        				"exec": {
        				  "type": "string",
        				  "description": "The script to run. Can also run regular shell commands."
        				},
        				"app-name": {
        				  "type": "string",
        				  "description": "The app-name. Uses Regex."
        				},
        				"desktop-entry": {
        				  "type": "string",
        				  "description": "The desktop-entry. Uses Regex."
        				},
        				"summary": {
        				  "type": "string",
        				  "description": "The summary of the notification. Uses Regex."
        				},
        				"body": {
        				  "type": "string",
        				  "description": "The body of the notification. Uses Regex."
        				},
        				"urgency": {
        				  "type": "string",
        				  "description": "The urgency of the notification.",
        				  "default": "Normal",
        				  "enum": ["Low", "Normal", "Critical"]
        				},
        				"category": {
        				  "type": "string",
        				  "description": "Which category the notification belongs to. Uses Regex."
        				},
        				"run-on": {
        				  "type": "string",
        				  "description": "Whether to run the script on an action being activated, or when the notification is received.",
        				  "enum": ["action", "receive"],
        				  "default": "receive"
        				}
        			  }
        			}
        		  }
        		},
        		"notification-visibility": {
        		  "type": "object",
        		  "description": "Set the visibility of each incoming notification. If the notification doesn't include one of the properties, that property will be ignored. All properties (except for state) use regex. If all properties match the given notification, the notification will be follow the provided state. Only the first matching object will be used.",
        		  "minProperties": 1,
        		  "additionalProperties": false,
        		  "patternProperties": {
        			"^.{1,}$": {
        			  "type": "object",
        			  "description": "Your script object.",
        			  "required": ["state"],
        			  "minProperties": 2,
        			  "additionalProperties": false,
        			  "properties": {
        				"state": {
        				  "type": "string",
        				  "description": "The notification visibility state.",
        				  "default": "enabled",
        				  "enum": ["ignored", "muted", "enabled", "transient"]
        				},
        				"app-name": {
        				  "type": "string",
        				  "description": "The app-name. Uses Regex."
        				},
        				"desktop-entry": {
        				  "type": "string",
        				  "description": "The desktop-entry. Uses Regex."
        				},
        				"summary": {
        				  "type": "string",
        				  "description": "The summary of the notification. Uses Regex."
        				},
        				"body": {
        				  "type": "string",
        				  "description": "The body of the notification. Uses Regex."
        				},
        				"urgency": {
        				  "type": "string",
        				  "description": "The urgency of the notification.",
        				  "default": "Normal",
        				  "enum": ["Low", "Normal", "Critical"]
        				},
        				"override-urgency": {
        				  "type": "string",
        				  "description": "The new urgency of the notification (optional)",
        				  "default": "unset",
        				  "enum": ["unset", "low", "normal", "critical"]
        				},
        				"category": {
        				  "type": "string",
        				  "description": "Which category the notification belongs to. Uses Regex."
        				}
        			  }
        			}
        		  }
        		},
        		"widgets": {
        		  "type": "array",
        		  "description": "Which order and which widgets to display. If the \"notifications\" widget isn't specified, it will be placed at the bottom.",
        		  "default": ["inhibitors", "title", "dnd", "notifications"],
        		  "items": {
        			"type": "string",
        			"$comment": "Sadly can't use regex and enums at the same time. Fix in the future?",
        			"pattern": "^[a-zA-Z0-9_-]{1,}(#[a-zA-Z0-9_-]{1,}){0,1}?$"
        		  }
        		},
        		"widget-config": {
        		  "type": "object",
        		  "description": "Configure specific widget properties.",
        		  "additionalProperties": false,
        		  "$comment": "New widgets go here in \"patternProperties\" ↓",
        		  "patternProperties": {
        			"^title(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$comment": "References the widget structure from \"widgets\" below",
        			  "$ref": "#/widgets/title"
        			},
        			"^dnd(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/dnd"
        			},
        			"^label(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/label"
        			},
        			"^mpris(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/mpris"
        			},
        			"^buttons-grid(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/buttons-grid"
        			},
        			"^menubar(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/menubar"
        			},
        			"^volume(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/volume"
        			},
        			"^backlight(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$ref": "#/widgets/backlight"
        			},
        			"^inhibitors(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "$comment": "References the widget structure from \"widgets\" below",
        			  "$ref": "#/widgets/inhibitors"
        			}
        		  }
        		}
        	  },
        	  "widgets": {
        		"$comment": "New widgets go here",
        		"title": {
        		  "type": "object",
        		  "description": "Control Center Title Widget",
        		  "additionalProperties": false,
        		  "properties": {
        			"text": {
        			  "type": "string",
        			  "description": "The title of the widget",
        			  "default": "Notifications"
        			},
        			"clear-all-button": {
        			  "type": "boolean",
        			  "description": "Wether to display a \"Clear All\" button",
        			  "default": true
        			},
        			"button-text": {
        			  "type": "string",
        			  "description": "\"Clear All\" button text",
        			  "default": "Clear All"
        			}
        		  }
        		},
        		"dnd": {
        		  "type": "object",
        		  "description": "Control Center Do Not Disturb Widget",
        		  "additionalProperties": false,
        		  "properties": {
        			"text": {
        			  "type": "string",
        			  "description": "The title of the widget",
        			  "default": "Do Not Disturb"
        			}
        		  }
        		},
        		"label": {
        		  "type": "object",
        		  "description": "A generic widget that allows the user to add custom text",
        		  "additionalProperties": false,
        		  "properties": {
        			"text": {
        			  "type": "string",
        			  "description": "The text content of the widget",
        			  "default": "Label Text"
        			},
        			"max-lines": {
        			  "type": "integer",
        			  "description": "The maximum lines",
        			  "default": 5
        			}
        		  }
        		},
        		"mpris": {
        		  "type": "object",
        		  "description": "A widget that displays multiple music players",
        		  "additionalProperties": false,
        		  "properties": {
        			"image-size": {
        			  "type": "integer",
        			  "description": "The size of the album art",
        			  "default": 96
        			},
        			"image-radius": {
        			  "type": "integer",
        			  "description": "The border radius of the album art. Will be overriden by setting the border-radius in the style.css for the \".widget-mpris-album-art\" class",

        			  "default": 12
        			},
        			"blur": {
        			  "type": "bool",
        			  "description": "Appy the artwork as the MPRIS background and blur it",
        			  "default": true
        			}
        		  }
        		},
        		"buttons-grid": {
        		  "type": "object",
        		  "description": "A widget to add a grid of buttons that execute shell commands",
        		  "additionalProperties": false,
        		  "properties": {
        			"actions": {
        			  "type": "array",
        			  "description": "A list of actions containing a label and a command",
        			  "items": {
        				"type": "object",
        				"properties": {
        				  "label": {
        					"type": "string",
        					"description": "Text to be displayed in button",
        					"default": "label"
        				  },
        				  "command": {
        					"type": "string",
        					"description": "Command to be executed on click",
        					"default": ""
        				  },
        				  "type": {
        					"type": "string",
        					"description": "Type of the button; toggle buttons receive the .active css class and an env variable 'SWAYNC_TOGGLE_STATE' is set. See example in the default config.json",
        					"default": "normal",
        					"enum": ["normal", "toggle"]
        				  },
        				  "update-command": {
        					"type": "string",
        					"description": "Command to be executed on visibility change of cc to update the active state of the toggle button (should echo true or false)",
        					"default": ""
        				  },
        				  "active": {
        					  "type": "bool",
        					  "description": "Wether the toggle button is active as default or not",
        					  "default": false
        				  }
        				}
        			  }
        			}
        		  }
        		},
        		"menubar": {
        		  "type": "object",
        		  "description": "A bar that contains action-buttons and buttons to open a dropdown with action-buttons",
        		  "additionalProperties": false,
        		  "patternProperties": {
        			"^menu(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "type": "object",
        			  "description": "A button that opens a dropdown with action-buttons",
        			  "additionalProperties": false,
        			  "properties": {
        				"label": {
        				  "type": "string",
        				  "description": "Text to be displayed in button",
        				  "default": "Menu"
        				},
        				"position": {
        				  "type": "string",
        				  "description": "Horizontal position of the button in the bar",
        				  "default": "right",
        				  "enum": ["right", "left"]
        				},
        				"animation-type": {
        				  "type": "string",
        				  "default": "slide_down",
        				  "description": "Animation type for menu",
        				  "enum": ["slide_down", "slide_up", "none"]
        				},
        				"animation-duration":{
        				  "type": "integer",
        				  "default": 250,
        				  "description": "Duration of animation in milliseconds"
        				},
        				"actions": {
        				  "$ref" : "#/widgets/buttons-grid/properties/actions"
        				}
        			  }
        			},
        			"^buttons(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
        			  "type": "object",
        			  "description": "A list of action-buttons to be displayed in the topbar",
        			  "additionalProperties": false,
        			  "properties": {
        				"position": {
        				  "type": "string",
        				  "description": "Horizontal position of the button in the bar",
        				  "default": "right",
        				  "enum": ["right", "left"]
        				},
        				"actions": {
        				  "$ref" : "#/widgets/buttons-grid/properties/actions"
        				}
        			  }
        			}
        		  }
        		},
        		"volume": {
        		  "type": "object",
        		  "description": "Slider to control pulse volume",
        		  "additionalProperties": false,
        		  "properties": {
        			"label": {
        			  "type": "string",
        			  "description": "Text displayed in front of the volume slider",
        			  "default": "Volume"
        			},
        			"show-per-app": {
        			  "type": "boolean",
        			  "default": false,
        			  "description": "Show per app volume control"
        			},
        			"show-per-app-icon": {
        			  "type": "boolean",
        			  "default": true,
        			  "description": "Show application icon in per app control"
        			},
        			"show-per-app-label": {
        			  "type": "boolean",
        			  "default": false,
        			  "description": "Show application name in per app control"
        			},
        			"empty-list-label": {
        			  "type": "string",
        			  "default": "No active sink input",
        			  "description": "Text displayed when there are not active sink inputs"
        			},
        			"expand-button-label": {
        			  "type": "string",
        			  "default": "⇧",
        			  "description": "Label displayed on button to show per app volume control"
        			},
        			"collapse-button-label": {
        			  "type": "string",
        			  "default": "⇩",
        			  "description": "Label displayed on button to hide per app volume control"
        			},
        			"icon-size": {
        			  "type": "integer",
        			  "default": 24,
        			  "description": "Size of the application icon in per app volume control"
        			},
        			"animation-type": {
        			  "type": "string",
        			  "default": "slide_down",
        			  "description": "Animation type for menu",
        			  "enum": ["slide_down", "slide_up", "none"]
        			},
        			"animation-duration":{
        			  "type": "integer",
        			  "default": 250,
        			  "description": "Duration of animation in milliseconds"
        			}
        		  }
        		},
        		"backlight": {
        		  "type": "object",
        		  "description": "Slider to control monitor brightness",
        		  "additionalProperties": false,
        		  "properties": {
        			"label": {
        			  "type": "string",
        			  "description": "Text displayed in front of the backlight slider",
        			  "default": "Brightness"
        			},
        			"device": {
        			  "type": "string",
        			  "description": "Name of monitor (find possible devices using `ls /sys/class/backlight` or `ls /sys/class/leds`)",
        			  "default": "intel_backlight"
        			},
        			"subsystem": {
        			  "type": "string",
        			  "description": "Kernel subsystem for brightness control",
        			  "default": "backlight",
        			  "enum": ["backlight", "leds"]
        			},
        			"min": {
        			  "type": "integer",
        			  "default": 0,
        			  "description": "Lowest possible value for brightness"
        			}
        		  }
        		},
        		"inhibitors": {
        		  "type": "object",
        		  "description": "Control Center Inhibitors Widget",
        		  "additionalProperties": false,
        		  "properties": {
        			"text": {
        			  "type": "string",
        			  "description": "The title of the widget",
        			  "default": "Inhibitors"
        			},
        			"clear-all-button": {
        			  "type": "boolean",
        			  "description": "Wether to display a \"Clear All\" button",
        			  "default": true
        			},
        			"button-text": {
        			  "type": "string",
        			  "description": "\"Clear All\" button text",
        			  "default": "Clear All"
        			}
        		  }
        		}
        	  }
        	}
      '';
      executable = false;
    };
  };

  services.swaync = {
    enable = true;

    settings = {
      "$schema" = "~/.config/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 32;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = false;
      relative-timestamps = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
      };
      widgets = [
        "inhibitor"
        "titl"
        "dn"
        "notification"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Shit i missed...";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "DND";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };

    style = ''
      	@define-color base00 #${colors.base00};
      	@define-color base01 #${colors.base01};
      	@define-color base02 #${colors.base02};
      	@define-color base03 #${colors.base03};
      	@define-color base04 #${colors.base04};
      	@define-color base05 #${colors.base05};
      	@define-color base06 #${colors.base06};
      	@define-color base07 #${colors.base07};
      	@define-color base08 #${colors.base08};
      	@define-color base09 #${colors.base09};
      	@define-color base0A #${colors.base0A};
      	@define-color base0B #${colors.base0B};
      	@define-color base0C #${colors.base0C};
      	@define-color base0D #${colors.base0D};
      	@define-color base0E #${colors.base0E};
      	@define-color base0F #${colors.base0F};

      	@define-color cc-bg @base00;
      	@define-color noti-border-color @base0E;
      	@define-color noti-bg @base00;
      	@define-color noti-bg-opaque @base00;
      	@define-color noti-bg-darker @base00;
      	@define-color noti-bg-hover @base02;
      	@define-color noti-bg-hover-opaque @base02;
      	@define-color noti-bg-focus @base05;
      	@define-color noti-close-bg @base05;
      	@define-color noti-close-bg-hover @base05;
      	@define-color text-color @base09;
      	@define-color text-color-disabled @base02;
      	@define-color bg-selected @base00;

      	* {
      	  font-family: JetBrainsMono Nerd Font;
      	  font-size: 15px;
      	}

      	.notification-row {
      	  outline: none;
      	}

      	.notification-row:focus,
      	.notification-row:hover {
      	  background: @base01;
      	}

      	.notification-row .notification-background {
      	  /* padding: 6px 12px; */
      	  /* border: solid 1px red; */
      	}

      	.notification-row .notification-background .close-button {
      	  /* The notification Close Button */
      	  background: transparent;
      	  color: @base09;
      	  text-shadow: none;
      	  box-shadow: none;
      	  border: none;
      	}

      	.notification-row .notification-background .close-button:hover {
      	  box-shadow: none;
      	  color: @base0F;
      	  transition: color 0.15s ease-in-out;
      	  border: none;
      	}

      	.notification-row .notification-background .notification {
      	  /* The actual notification */
      	  background: @base00;
      	  border: 2px solid @base03;
      	  border-radius: 5px;
      	  padding: 2px 5px 0px 5px;
      	  transition: background 0.15s ease-in-out;
      	}

      	.notification-row .notification-background .notification.low {
      	  /* Low Priority Notification */
      	}

      	.notification-row .notification-background .notification.normal {
      	  /* Normal Priority Notification */
      	}

      	.notification-row .notification-background .notification.critical {
      	  /* Critical Priority Notification */
      	  border: 2px solid @base0F;
      	}

      	.notification-row .notification-background .notification .notification-action,
      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action {
      	  /* border: solid 1px red; */
      	  padding: 4px;
      	  margin: 0;
      	  box-shadow: none;
      	  background: transparent;
      	  border: none;
      	  color: @text-color;
      	  transition: background 0.15s ease-in-out;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-action:hover,
      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action:hover {
      	  -gtk-icon-effect: none;
      	  /* background: @noti-bg-hover; */
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action {
      	  /* The large action that also displays the notification summary and body */
      	  border-radius: 5px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action:not(:only-child) {
      	  /* When alternative actions are visible */
      	  border-bottom-left-radius: 0px;
      	  border-bottom-right-radius: 0px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content {
      	  background: transparent;
      	  border-radius: 5px;
      	  padding: 4px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .image {
      	  /* Notification Primary Image */
      	  -gtk-icon-effect: none;
      	  /* border-radius: 100px; */
      	  /* Size in px */
      	  margin: 4px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .app-icon {
      	  /* Notification app icon (only visible when the primary image is set) */
      	  -gtk-icon-effect: none;
      	  -gtk-icon-shadow: 0 1px 4px black;
      	  margin: 6px;
      	  /* border: solid 1px red; */
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .text-box
      	  .summary {
      	  /* Notification summary/title */
      	  /* font-size: 10px; */
      	  font-weight: bold;
      	  background: transparent;
      	  color: @text-color;
      	  text-shadow: none;
      	  /* border: solid 1px red; */
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .text-box
      	  .time {
      	  /* Notification time-ago */
      	  /* font-size: 16px; */
      	  font-weight: bold;
      	  background: transparent;
      	  color: @text-color;
      	  text-shadow: none;
      	  /* margin-right: 30px; */
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .text-box
      	  .body {
      	  /* Notification body */
      	  /* font-size: 5px; */
      	  font-weight: normal;
      	  background: transparent;
      	  color: @text-color;
      	  text-shadow: none;
      	  /* border: solid 1px red; */
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  progressbar {
      	  /* The optional notification progress bar */
      	  margin-top: 4px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .body-image {
      	  /* The "extra" optional bottom notification image */
      	  margin-top: 4px;
      	  /* background-color: white; */
      	  border-radius: 5px;
      	  -gtk-icon-effect: none;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .inline-reply {
      	  /* The inline reply section */
      	  margin-top: 4px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .inline-reply
      	  .inline-reply-entry {
      	  background: @noti-bg-darker;
      	  color: @text-color;
      	  caret-color: @text-color;
      	  border: 1px solid @noti-border-color;
      	  border-radius: 5px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .inline-reply
      	  .inline-reply-button {
      	  margin-left: 4px;
      	  background: @noti-bg;
      	  border: 1px solid @noti-border-color;
      	  border-radius: 5px;
      	  color: @text-color;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .inline-reply
      	  .inline-reply-button:disabled {
      	  background: initial;
      	  color: @text-color-disabled;
      	  border: 1px solid @noti-border-color;
      	  border-color: transparent;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-default-action
      	  .notification-content
      	  .inline-reply
      	  .inline-reply-button:hover {
      	  background: @noti-bg-hover;
      	}

      	.notification-row .notification-background .notification .notification-action {
      	  /* The alternative actions below the default action */
      	  border-top: 1px solid @noti-border-color;
      	  border-radius: 0px;
      	  border-right: 1px solid @noti-border-color;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-action:first-child {
      	  /* add bottom border radius to eliminate clipping */
      	  border-bottom-left-radius: 5px;
      	}

      	.notification-row
      	  .notification-background
      	  .notification
      	  .notification-action:last-child {
      	  border-bottom-right-radius: 5px;
      	  border-right: none;
      	}

      	.notification-group {
      	  /* Styling only for Grouped Notifications */
      	}

      	.notification-group.low {
      	  /* Low Priority Group */
      	}

      	.notification-group.normal {
      	  /* Low Priority Group */
      	}

      	.notification-group.critical {
      	  /* Low Priority Group */
      	}

      	.notification-group .notification-group-buttons,
      	.notification-group .notification-group-headers {
      	  margin: 0 16px;
      	  color: @text-color;
      	}

      	.notification-group .notification-group-headers {
      	  /* Notification Group Headers */
      	}

      	.notification-group .notification-group-headers .notification-group-icon {
      	  color: @text-color;
      	}

      	.notification-group .notification-group-headers .notification-group-header {
      	  color: @text-color;
      	}

      	.notification-group .notification-group-buttons {
      	  /* Notification Group Buttons */
      	}

      	.notification-group.collapsed .notification-row .notification {
      	  background-color: @noti-bg-opaque;
      	}

      	.notification-group.collapsed .notification-row:not(:last-child) {
      	  /* Top notification in stack */
      	  /* Set lower stacked notifications opacity to 0 */
      	}

      	.notification-group.collapsed
      	  .notification-row:not(:last-child)
      	  .notification-action,
      	.notification-group.collapsed
      	  .notification-row:not(:last-child)
      	  .notification-default-action {
      	  opacity: 0;
      	}

      	.notification-group.collapsed:hover
      	  .notification-row:not(:only-child)
      	  .notification {
      	  background-color: @noti-bg-hover-opaque;
      	}

      	.control-center {
      	  /* The Control Center which contains the old notifications + widgets */
      	  background: @cc-bg;
      	  color: @text-color;
      	  border-radius: 5px;
      	  border: 1px solid @base0E;
      	  margin-bottom: 5px;
      	  margin-top: 5px;
      	  margin-right: 5px;
      	}

      	.control-center .control-center-list-placeholder {
      	  /* The placeholder when there are no notifications */
      	  opacity: 0.5;
      	}

      	.control-center .control-center-list {
      	  /* List of notifications */
      	  background: transparent;
      	}

      	.control-center .control-center-list .notification {
      	  box-shadow:
      		0 0 0 1px rgba(0, 0, 0, 0.3),
      		0 1px 3px 1px rgba(0, 0, 0, 0.7),
      		0 2px 6px 2px rgba(0, 0, 0, 0.3);
      	}

      	.control-center .control-center-list .notification .notification-default-action,
      	.control-center .control-center-list .notification .notification-action {
      	  transition:
      		opacity 400ms ease-in-out,
      		background 0.15s ease-in-out;
      	}

      	.control-center
      	  .control-center-list
      	  .notification
      	  .notification-default-action:hover,
      	.control-center .control-center-list .notification .notification-action:hover {
      	  background-color: @noti-bg-hover;
      	  border-radius: 0px;
      	}

      	.blank-window {
      	  /* Window behind control center and on all other monitors */
      	  background: transparent;
      	}

      	.floating-notifications {
      	  background: transparent;
      	}

      	.floating-notifications .notification {
      	  box-shadow: none;
      	}

      	/*** Widgets ***/
      	/* Title widget */
      	.widget-title {
      	  color: @text-color;
      	  /* margin: 8px; */
      	  /* font-size: 1.5rem; */
      	}

      	.widget-title > button {
      	  font-size: initial;
      	  color: @text-color;
      	  text-shadow: none;
      	  background: @noti-bg;
      	  border: 1px solid @noti-border-color;
      	  box-shadow: none;
      	  border-radius: 5px;
      	}

      	.widget-title > button:hover {
      	  background: @noti-bg-hover;
      	}

      	/* DND widget */
      	.widget-dnd {
      	  color: @text-color;
      	  margin: 8px;
      	  /* font-size: 1.1rem; */
      	}

      	.widget-dnd > switch {
      	  font-size: initial;
      	  border-radius: 5px;
      	  background: @noti-bg;
      	  border: 1px solid @noti-border-color;
      	  box-shadow: none;
      	}

      	.widget-dnd > switch:checked {
      	  background: @bg-selected;
      	}

      	.widget-dnd > switch slider {
      	  background: @noti-bg-hover;
      	  border-radius: 5px;
      	}

      	/* Label widget */
      	.widget-label {
      	  margin: 8px;
      	}

      	.widget-label > label {
      	  /* font-size: 1.1rem; */
      	}

      	/* Mpris widget */
      	@define-color mpris-album-art-overlay rgba(0, 0, 0, 0.55);
      	@define-color mpris-button-hover rgba(0, 0, 0, 0.50);

      	.widget-mpris {
      	  /* The parent to all players */
      	}

      	.widget-mpris .widget-mpris-player {
      	  padding: 8px;
      	  padding: 16px;
      	  margin: 16px 20px;
      	  background-color: @mpris-album-art-overlay;
      	  border-radius: 5px;
      	  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
      	}

      	.widget-mpris .widget-mpris-player button:hover {
      	  /* The media player buttons (play, pause, next, etc...) */
      	  background: @noti-bg-hover;
      	}

      	.widget-mpris .widget-mpris-player .widget-mpris-album-art {
      	  border-radius: 5px;
      	  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
      	}

      	.widget-mpris .widget-mpris-player .widget-mpris-title {
      	  font-weight: bold;
      	  /* font-size: 1.25rem; */
      	}

      	.widget-mpris .widget-mpris-player .widget-mpris-subtitle {
      	  /* font-size: 1.1rem; */
      	}

      	.widget-mpris .widget-mpris-player > box > button {
      	  /* Change player control buttons */
      	}

      	.widget-mpris .widget-mpris-player > box > button:hover {
      	  background-color: @mpris-button-hover;
      	}

      	.widget-mpris > box > button {
      	  /* Change player side buttons */
      	}

      	.widget-mpris > box > button:disabled {
      	  /* Change player side buttons insensitive */
      	}

      	/* Buttons widget */
      	.widget-buttons-grid {
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	  background-color: @noti-bg;
      	}

      	.widget-buttons-grid > flowbox > flowboxchild > button {
      	  background: @noti-bg;
      	  border-radius: 5px;
      	}

      	.widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
      	  /* style given to the active toggle button */
      	}

      	/* Menubar widget */
      	.widget-menubar > box > .menu-button-bar > button {
      	  border: none;
      	  background: transparent;
      	}

      	/* .AnyName { Name defined in config after #
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	.AnyName>button {
      	  background: transparent;
      	  border: none;
      	}

      	.AnyName>button:hover {
      	  background-color: @noti-bg-hover;
      	} */
      	.topbar-buttons > button {
      	  /* Name defined in config after # */
      	  border: none;
      	  background: transparent;
      	}

      	/* Volume widget */
      	.widget-volume {
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	.widget-volume > box > button {
      	  background: transparent;
      	  border: none;
      	}

      	.per-app-volume {
      	  background-color: @noti-bg-alt;
      	  padding: 4px 8px 8px 8px;
      	  margin: 0px 8px 8px 8px;
      	  border-radius: 5px;
      	}

      	/* Backlight widget */
      	.widget-backlight {
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	/* Inhibitors widget */
      	.widget-inhibitors {
      	  margin: 8px;
      	  /* font-size: 1.5rem; */
      	}

      	.widget-inhibitors > button {
      	  font-size: initial;
      	  color: @text-color;
      	  text-shadow: none;
      	  background: @noti-bg;
      	  border: 1px solid @noti-border-color;
      	  box-shadow: none;
      	  border-radius: 5px;
      	}

      	.widget-inhibitors > button:hover {
      	  background: @noti-bg-hover;
      	}

      	/* Buttons widget */
      	.widget-buttons-grid {
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	  background-color: @noti-bg;
      	}

      	.widget-buttons-grid > flowbox > flowboxchild > button {
      	  background: @noti-bg;
      	  border-radius: 5px;
      	}

      	.widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
      	  /* style given to the active toggle button */
      	}

      	/* Menubar widget */
      	.widget-menubar > box > .menu-button-bar > button {
      	  border: none;
      	  background: transparent;
      	}

      	/* .AnyName { Name defined in config after #
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	.AnyName>button {
      	  background: transparent;
      	  border: none;
      	}

      	.AnyName>button:hover {
      	  background-color: @noti-bg-hover;
      	} */
      	.topbar-buttons > button {
      	  /* Name defined in config after # */
      	  border: none;
      	  background: transparent;
      	}

      	/* Volume widget */
      	.widget-volume {
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	.widget-volume > box > button {
      	  background: transparent;
      	  border: none;
      	}

      	.per-app-volume {
      	  background-color: @noti-bg-alt;
      	  padding: 4px 8px 8px 8px;
      	  margin: 0px 8px 8px 8px;
      	  border-radius: 5px;
      	}

      	/* Backlight widget */
      	.widget-backlight {
      	  background-color: @noti-bg;
      	  padding: 8px;
      	  margin: 8px;
      	  border-radius: 5px;
      	}

      	/* Inhibitors widget */
      	.widget-inhibitors {
      	  margin: 8px;
      	  /* font-size: 1.5rem; */
      	}

      	.widget-inhibitors > button {
      	  font-size: initial;
      	  color: @text-color;
      	  text-shadow: none;
      	  background: @noti-bg;
      	  border: 1px solid @noti-border-color;
      	  box-shadow: none;
      	  border-radius: 5px;
      	}

      	.widget-inhibitors > button:hover {
      	  background: @noti-bg-hover;
      	}
    '';
  };
}
