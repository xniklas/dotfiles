#!/bin/bash

# utils.sh
# This script provides utility functions for system operations.
#
# IMPORTANT: This script ASSUMES that 'logging.sh' has already been sourced
# by the main script calling these utilities. It does NOT source logging.sh
# itself to ensure all logs go to a single file.

# Function: install_package_pacman
# Description: Installs a package using pacman.
# Arguments:
#   $1: The name of the package to install.
install_package_pacman() {
  local package_name="$1"
  if [[ -z "$package_name" ]]; then
    log_error "install_package_pacman: No package name provided."
    return 1
  fi

  log_info "Attempting to install Pacman package: ${package_name}"
  sudo pacman -S --noconfirm --needed "$package_name"
  if [[ $? -eq 0 ]]; then
    log_success "Successfully installed Pacman package: ${package_name}"
    return 0
  else
    log_error "Failed to install Pacman package: ${package_name}"
    return 1
  fi
}

# Function: install_package
# Description: Installs a package using yay (for AUR packages).
# Arguments:
#   $1: The name of the package to install.
install_package() {
  local package_name="$1"
  if [[ -z "$package_name" ]]; then
    log_error "install_package: No package name provided."
    return 1
  fi

  if ! command_exists "yay"; then
    log_error "install_package: 'yay' not found. Please install it to use this function."
    return 1
  fi

  log_info "Attempting to install AUR package via yay: ${package_name}"
  # yay typically prompts for sudo password for pacman dependencies
  yay -S --noconfirm --needed "$package_name"
  if [[ $? -eq 0 ]]; then
    log_success "Successfully installed AUR package: ${package_name}"
    return 0
  else
    log_error "Failed to install AUR package: ${package_name}"
    return 1
  fi
}

# Function: check_network
# Description: Checks if the system is connected to the internet.
# Returns:
#   0 if connected, 1 if not connected.
check_network() {
  log_status "Checking network connectivity..."
  # Ping a reliable public DNS server (Google DNS)
  if ping -c 3 archlinux.org &>/dev/null; then
    log_info "Network: Connected to the internet."
    return 0
  else
    log_warn "Network: Not connected to the internet."
    return 1
  fi
}

# Function: check_sudo
# Description: Checks if the script is being run with root (sudo) privileges.
# Returns:
#   1 if running as root, 0 otherwise.
check_sudo() {
  log_status "Checking for root privileges..."
  if [[ "$(id -u)" -eq 0 ]]; then
    log_warn "Running with root privileges (sudo)."
    return 1
  else
    log_success "Not running with root privileges."
    return 0
  fi
}

# Function: command_exists
# Description: Checks if a given command is available on the system.
# Arguments:
#   $1: The name of the command to check.
# Returns:
#   0 if the command exists, 1 otherwise.
command_exists() {
  local cmd="$1"
  if command -v "$cmd" &>/dev/null; then
    log_debug "Command exists: ${cmd}"
    return 0
  else
    log_debug "Command NOT found: ${cmd}"
    return 1
  fi
}
