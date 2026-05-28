#!/bin/bash

# Bearder Installer
# Beautiful CLI Edition

# --- Configuration ---
SCRIPT_VERSION="1.0.0"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# --- Helper Functions ---
print_logo() {
    echo ""
    echo -e "${CYAN}"
    cat << "EOF"
    ____                      _           
   |  _ \                    | |          
   | |_) | ___  __ _ _ __  __| | ___ _ __ 
   |  _ < / _ \/ _` | '__|/ _` |/ _ \ '__|
   | |_) |  __/ (_| | |  | (_| |  __/ |   
   |____/ \___|\__,_|_|   \__,_|\___|_|   
                                               
                          Installer Setup                 
EOF
    echo -e "${NC}"
}

print_section() {
    echo ""
    echo -e "  ${WHITE}>> $1${NC}"
    echo -e "  ${GRAY}--------------------------------------------------${NC}"
}

print_step() {
    local current=$1
    local total=$2
    local message=$3
    local status=$4
    
    local icon color
    case $status in
        running) icon="[*]"; color=$CYAN ;;
        success) icon="[+]"; color=$GREEN ;;
        warning) icon="[!]"; color=$YELLOW ;;
        error)   icon="[x]"; color=$RED ;;
        *)       icon="[ ]"; color=$WHITE ;;
    esac
    
    echo -e "     ${color}${icon}${NC} ${GRAY}($current/$total)${NC} ${WHITE}$message${NC}"
}

print_substep() {
    local message=$1
    local type=$2
    
    local color
    case $type in
        success) color=$GREEN ;;
        warning) color=$YELLOW ;;
        info)    color=$CYAN ;;
        error)   color=$RED ;;
        *)       color=$GRAY ;;
    esac
    
    echo -e "             ${color}$message${NC}"
}

print_success() {
    echo ""
    echo -e "${GREEN}"
    cat << EOF
    +--------------------------------------------------+
    |                                                  |
    |      Bearder has been installed successfully!    |
    |                                                  |
    +--------------------------------------------------+
EOF
    echo -e "${NC}"
}

print_footer() {
    local version=$1
    echo ""
    echo -e "  ${GRAY}Installer Version: $version${NC}"
    echo -e "  ${GRAY}GitHub: github.com/ANGRYCONE/bearder7${NC}"
    echo ""
}

# --- Main Script ---
clear
print_logo

echo -e "                    ${GREEN}[ INSTALLING ]${NC}"
echo ""

# Step 1: Install Homebrew
print_section "ENVIRONMENT SETUP"
print_step 1 3 "Checking Homebrew Installation..." "running"

if ! command -v brew &> /dev/null; then
    print_substep "Homebrew not found. Installing silently (this may take a while)..." "info"
    # NONINTERACTIVE=1 is required so the Homebrew script doesn't pause waiting for the user to press ENTER
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null 2>&1
    
    # Setup Homebrew in PATH for the current session depending on OS/Architecture
    if [ -x "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x "/usr/local/bin/brew" ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    print_substep "Homebrew is already installed" "success"
fi
print_substep "Homebrew is ready" "success"

# Step 2: Install Dependencies
print_section "DEPENDENCIES"
print_step 2 3 "Installing ffmpeg & yt-dlp..." "running"

print_substep "Fetching dependencies..." "info"
brew install ffmpeg yt-dlp > /dev/null 2>&1
if [ $? -eq 0 ]; then
    print_substep "Dependencies installed successfully" "success"
else
    print_substep "Warning: Dependencies may have had issues during installation" "warning"
fi

# Step 3: Setup Custom Tap and Install
print_section "BEARDER INSTALLATION"
print_step 3 3 "Setting up tap & installing Bearder..." "running"

print_substep "Tapping ANGRYCONE/bearder7..." "info"
brew tap ANGRYCONE/bearder7 > /dev/null 2>&1

print_substep "Installing Bearder..." "info"
brew install bearder > /dev/null 2>&1

if [ $? -eq 0 ]; then
    print_substep "Bearder installed successfully" "success"
else
    print_substep "Failed to install Bearder" "error"
    exit 1
fi

# Done!
print_success
print_footer "$SCRIPT_VERSION"
