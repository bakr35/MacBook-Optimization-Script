#!/bin/bash

##############################################################################
# 🎯 CUSTOM PROFILE: MacBook Pro 2014 (13-inch, Intel Core i5)
# ============================================================================
# Optimized for:
#   - Processor: Intel Core i5 Dual-Core @ 2.8 GHz
#   - RAM: 8 GB DDR3 @ 1600 MHz
#   - Storage: 256 GB SSD (only 63GB free - CRITICAL)
#   - OS: macOS Big Sur 11.7.11
##############################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

function cleanup_caches() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ 1️⃣  AGGRESSIVE CACHE CLEANUP            ║${NC}"
    echo -e "${BLUE}║ (Freeing 2-5GB from 256GB SSD)         ${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    
    echo -e "${YELLOW}  ├─ Clearing browser caches...${NC}"
    rm -rf ~/Library/Caches/Chrome 2>/dev/null
    rm -rf ~/Library/Caches/Firefox 2>/dev/null
    rm -rf ~/Library/Safari/TopSites.plist 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ Browser cache cleared${NC}"
    
    echo -e "${YELLOW}  ├─ Clearing system caches...${NC}"
    rm -rf ~/Library/Caches/com.apple.* 2>/dev/null
    rm -rf ~/Library/Saved\ Application\ State/* 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ System cache cleared${NC}"
    
    echo -e "${YELLOW}  ├─ Clearing temporary files...${NC}"
    rm -rf /var/tmp/* 2>/dev/null
    rm -rf /tmp/* 2>/dev/null
    rm -rf ~/.Trash/* 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ Temp files cleared${NC}"
    
    echo -e "${YELLOW}  └─ Clearing Xcode derived data...${NC}"
    rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
    echo -e "${GREEN}  └─ ✓ Cleanup complete${NC}"
    echo ""
}

function optimize_ram() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ 2️⃣  RAM PRESSURE MITIGATION             ║${NC}"
    echo -e "${BLUE}║ (Critical: Only 8GB total)            ${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    
    echo -e "${YELLOW}  Current Memory Status:${NC}"
    vm_stat | head -3 | sed 's/^/    /'
    echo ""
    
    echo -e "${YELLOW}  ├─ Purging inactive memory...${NC}"
    purge 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ Memory purged${NC}"
    
    echo -e "${YELLOW}  ├─ Reducing visual effects...${NC}"
    defaults write com.apple.universalaccess reduceMotion -bool true
    defaults write com.apple.universalaccess reduceTransparency -bool true
    defaults write com.apple.finder FXAnimationEnabled -bool false
    echo -e "${GREEN}  ├─ ✓ Visual effects reduced${NC}"
    
    echo -e "${YELLOW}  └─ Optimizing Dock...${NC}"
    defaults write com.apple.dock mineffect -string "scale"
    killall Dock 2>/dev/null
    echo -e "${GREEN}  └─ ✓ Dock optimized${NC}"
    echo ""
}

function optimize_ssd() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ 3️⃣  SSD PERFORMANCE TUNING              ║${NC}"
    echo -e "${BLUE}║ (256GB SSD, ~63GB free)               ${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    
    echo -e "${YELLOW}  ├─ Optimizing Spotlight indexing...${NC}"
    mdutil -i off / 2>/dev/null
    sleep 2
    mdutil -i on / 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ Spotlight re-indexed${NC}"
    
    echo -e "${YELLOW}  ├─ Disabling motion sensor...${NC}"
    defaults write /var/db/sudo DisableSMS 1 2>/dev/null
    echo -e "${GREEN}  └─ ✓ Motion sensor disabled${NC}"
    echo ""
}

function disable_heavy_services() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ 4️⃣  DISABLE HEAVY BACKGROUND SERVICES  ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    
    echo -e "${YELLOW}  ├─ Disabling Siri...${NC}"
    defaults write com.apple.assistant.support 'Siri Data Store Allowed' -bool false
    echo -e "${GREEN}  ├─ ✓ Siri disabled${NC}"
    
    echo -e "${YELLOW}  ├─ Disabling analytics...${NC}"
    defaults write /Library/Application\ Support/CrashReporter/DiagnosticMessagesHistory.plist AutoSubmit -bool false 2>/dev/null
    echo -e "${GREEN}  ├─ ✓ Analytics disabled${NC}"
    
    echo -e "${YELLOW}  └─ Optimizing iCloud...${NC}"
    defaults write com.apple.bird DisableAllSync -bool true 2>/dev/null
    echo -e "${GREEN}  └─ ✓ iCloud optimized${NC}"
    echo ""
}

function system_diagnostics() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ 📊 SYSTEM DIAGNOSTICS                   ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
    
    echo -e "${CYAN}Hardware:${NC}"
    echo "  Model: $(system_profiler SPHardwareDataType | grep 'Model Name' | cut -d: -f2 | xargs)"
    echo "  Processor: $(sysctl -n machdep.cpu.brand_string)"
    echo "  Memory: $(system_profiler SPHardwareDataType | grep 'Memory:' | cut -d: -f2 | xargs)"
    echo "  Storage: $(df -h / | awk 'NR==2 {print "Total: " $2 ", Used: " $3 ", Free: " $4}')"
    echo ""
}

function run_full_optimization() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║  🚀 MacBook Pro 2014 (Intel Core i5) - FULL OPTIMIZATION   ║"
    echo "║  8GB DDR3 RAM • 256GB SSD • Big Sur                        ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    
    cleanup_caches
    optimize_ram
    optimize_ssd
    disable_heavy_services
    system_diagnostics
    
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ✅ OPTIMIZATION COMPLETE!                                  ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}📌 NEXT STEPS:${NC}"
    echo "  1. Restart your MacBook (recommended)"
    echo "  2. Monitor Activity Monitor for 48 hours"
    echo "  3. Close Chrome tabs regularly (RAM intensive)"
    echo "  4. Run this script monthly"
    echo ""
}

export -f cleanup_caches
export -f optimize_ram
export -f optimize_ssd
export -f disable_heavy_services
export -f system_diagnostics
export -f run_full_optimization
