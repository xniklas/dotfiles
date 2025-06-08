#!/bin/bash

# --- Configuration ---
LOG_FILE_NAME="system.log"
DEBUG_MODE=true # Set to true to enable debug messages

# --- ANSI Color Codes (for TTY output) ---
# Check if stdout is a TTY to enable colors
if [[ -t 1 ]]; then
  NC='\e[0m'       # No Color
  RED='\e[31m'     # Red
  GREEN='\e[32m'   # Green
  YELLOW='\e[33m'  # Yellow
  BLUE='\e[34m'    # Blue
  MAGENTA='\e[35m' # Magenta
  CYAN='\e[36m'    # Cyan
  BOLD='\e[1m'     # Bold text
else
  # If not a TTY, disable colors
  NC=''
  RED=''
  GREEN=''
  YELLOW=''
  BLUE=''
  MAGENTA=''
  CYAN=''
  BOLD=''
fi

# --- Global Variables ---
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")" # Directory where this script (or the sourced script) resides
LOG_FILE="${SCRIPT_DIR}/${LOG_FILE_NAME}"

# --- Helper Functions ---

# Function to get the current timestamp
_get_timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Core logging function
# Arguments:
#   $1: Log Level (e.g., "INFO", "WARN")
#   $2: Color for TTY output (e.g., $GREEN)
#   $3: Prefix for TTY output (e.g., " - ")
#   $4: Message
_log_message() {
  local level="$1"
  local color="$2"
  local prefix="$3"
  local message="$4"
  local timestamp="$(_get_timestamp)"

  # Format for Console (with colors)
  printf "${BOLD}${CYAN}[ %s ]${NC} ${color}%s%s${NC}  %s\n" \
    "$(basename "$0")" "$prefix" "${level}:" "${message}"

  # Format for File (no colors, plain text)
  printf "[%s] [%s] %s\n" "$timestamp" "$level" "$message" >>"$LOG_FILE"
}

# --- Public Logging Functions ---

log_info() {
  _log_message "INFO" "${GREEN}" " - " "$@"
}

log_warn() {
  _log_message "WARN" "${YELLOW}" " ! " "$@"
}

log_error() {
  _log_message "ERROR" "${RED}" " X " "$@"
}

log_debug() {
  if "$DEBUG_MODE"; then
    _log_message "DEBUG" "${BLUE}" " > " "$@"
  fi
}

log_success() {
  _log_message "SUCCESS" "${GREEN}" " + " "$@"
}

log_status() {
  _log_message "STATUS" "${MAGENTA}" " * " "$@"
}

# --- Initialization ---

# Create or clear the log file and add a header
_init_logger() {
  # Ensure the log directory exists (if not the same as script dir)
  mkdir -p "$(dirname "$LOG_FILE")"

  # Clear the log file or add a separator for new runs
  if [[ -f "$LOG_FILE" ]]; then
    printf "\n--- New Script Run Started: %s ---\n" "$(_get_timestamp)" >>"$LOG_FILE"
  else
    printf "--- Script Log Started: %s ---\n" "$(_get_timestamp)" >"$LOG_FILE"
  fi
  log_info "Logging initialized. Output will be saved to: ${LOG_FILE}"
  log_debug "Debug mode is ${DEBUG_MODE}."
}

# Trap for exit status (optional, but good for robust logging)
_trap_exit() {
  local exit_status=$?
  if [[ "$exit_status" -eq 0 ]]; then
    log_success "Script finished successfully! (Exit Status: 0)"
  else
    log_error "Script exited with an error! (Exit Status: $exit_status)"
  fi
}
trap _trap_exit EXIT

# The _init_logger function is called when this script is sourced.
# If this file is run directly, it also demonstrates logging.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  _init_logger
  log_info "This is logging.sh running directly for demonstration."
  log_warn "This is a warning from logging.sh"
  log_error "This is an error from logging.sh"
fi
