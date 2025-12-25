#!/bin/bash
# BlackRoad OS Codex Infinity - Setup Script
# Initializes traffic light system, Codex integration, and agent registry

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║                                                       ║"
echo "║     🌌 BlackRoad OS Codex Infinity Setup 🌌          ║"
echo "║                                                       ║"
echo "║  Traffic Light System + Codex Integration            ║"
echo "║                                                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""

# Step 1: Initialize Traffic Light System
echo -e "${CYAN}[1/5]${NC} Initializing Traffic Light System..."
if [ -f ./blackroad-traffic-light.sh ]; then
    ./blackroad-traffic-light.sh init
    echo -e "${GREEN}✓${NC} Traffic Light System initialized"
else
    echo -e "${YELLOW}⚠${NC} blackroad-traffic-light.sh not found"
fi
echo ""

# Step 2: Initialize Codex Integration
echo -e "${CYAN}[2/5]${NC} Initializing Codex Integration..."
if [ -f ./blackroad-codex-integration.sh ]; then
    ./blackroad-codex-integration.sh init
    echo -e "${GREEN}✓${NC} Codex Integration initialized"
else
    echo -e "${YELLOW}⚠${NC} blackroad-codex-integration.sh not found"
fi
echo ""

# Step 3: Index Repository
echo -e "${CYAN}[3/5]${NC} Indexing Repository..."
if [ -f ./blackroad-codex-integration.sh ]; then
    ./blackroad-codex-integration.sh index
    echo -e "${GREEN}✓${NC} Repository indexed"
else
    echo -e "${YELLOW}⚠${NC} Skipping repository indexing"
fi
echo ""

# Step 4: Register Known Agents
echo -e "${CYAN}[4/5]${NC} Registering AI Agents..."

agents=(
    "Alice:migration_architect:ecosystem_organization"
    "Aria:infrastructure_sovereign:cost_optimization"
    "Cora:coordinator:agent_orchestration"
    "Lucidia:science_reasoning:mathematical_reasoning"
    "Caddy:documentation:technical_writing"
    "CeCe:dynamic_planner:task_planning"
    "Roadie:devops:deployment_automation"
    "Holo:mirror_agent:code_review"
    "Oloh:mirror_agent:code_review"
    "Gaia:ecosystem_manager:ecosystem_monitoring"
    "Tosha:telemetry:telemetry_collection"
)

if [ -f ./blackroad-codex-integration.sh ]; then
    for agent in "${agents[@]}"; do
        IFS=':' read -r name type capability <<< "$agent"
        ./blackroad-codex-integration.sh register "$name" "$type" "$capability"
    done
    echo -e "${GREEN}✓${NC} All agents registered"
else
    echo -e "${YELLOW}⚠${NC} Skipping agent registration"
fi
echo ""

# Step 5: Set Initial Traffic Light Status
echo -e "${CYAN}[5/5]${NC} Setting Initial Status..."
if [ -f ./blackroad-traffic-light.sh ]; then
    ./blackroad-traffic-light.sh yellowlight --message "System initialized - ready for configuration"
    echo -e "${GREEN}✓${NC} Initial status set"
fi
echo ""

# Display Summary
echo -e "${MAGENTA}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✓ Setup Complete!${NC}"
echo -e "${MAGENTA}═══════════════════════════════════════════════════════${NC}"
echo ""
echo "Next steps:"
echo ""
echo "  1. Check Traffic Light status:"
echo "     ${CYAN}./blackroad-traffic-light.sh status${NC}"
echo ""
echo "  2. Check Codex status:"
echo "     ${CYAN}./blackroad-codex-integration.sh status${NC}"
echo ""
echo "  3. View agent configuration:"
echo "     ${CYAN}cat .blackroad/agent-config.yml${NC}"
echo ""
echo "  4. Run the PsiCore application:"
echo "     ${CYAN}./run.sh${NC}"
echo ""
echo -e "${MAGENTA}═══════════════════════════════════════════════════════${NC}"
echo ""
echo "For more information, see README.md"
echo ""
