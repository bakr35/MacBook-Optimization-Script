#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/modules/macbook_2014_intel_i5_profile.sh"

function show_menu() {
    clear
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  MacBook Pro 2014 Optimization Menu (bakr35)          ║"
    echo "║  Intel Core i5 • 8GB RAM • 256GB SSD • Big Sur        ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    echo -e "${YELLOW}Choose an option:${NC}"
    echo ""
    echo "  1️⃣  Run FULL Optimization (Recommended)"
    echo "  2️⃣  Cache Cleanup Only"
    echo "  3️⃣  RAM Optimization Only"
    echo "  4️⃣  SSD Optimization Only"
    echo "  5️⃣  Disable Heavy Services"
    echo "  6️⃣  View System Diagnostics"
    echo "  7️⃣  Exit"
    echo ""
}

function handle_choice() {
    read -p "Enter your choice (1-7): " choice
    
    case $choice in
        1) run_full_optimization ;;
        2) cleanup_caches ;;
        3) optimize_ram ;;
        4) optimize_ssd ;;
        5) disable_heavy_services ;;
        6) system_diagnostics ;;
        7) echo -e "${GREEN}Goodbye! 👋${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid choice${NC}" ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
    show_menu
    handle_choice
}

show_menu
handle_choice
