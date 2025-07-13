#!/bin/bash

# Agent Tree Package Test Script
# Tests npm package functionality for all agents

set -e  # Exit on any error

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🧪 Testing Agent Tree Package Functionality"
echo "============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track test results
TESTS_PASSED=0
TESTS_FAILED=0

# Function to run a test
run_test() {
    local test_name="$1"
    local agent="$2"
    
    echo -e "\n${YELLOW}Testing: $test_name${NC}"
    
    # Create temporary directory
    local temp_dir=$(mktemp -d)
    echo "  📁 Created temp dir: $temp_dir"
    
    cd "$temp_dir"
    
    # Test the installation (using local package during development)
    echo "  📦 Installing agent: $agent"
    
    # Use current working directory for local testing
    # In production, this would be: echo "y" | npx agent-tree@latest "$agent"
    echo "y" | node "$SCRIPT_DIR/dist/index.js" "$agent" || {
        echo -e "  ${RED}❌ Installation failed${NC}"
        cd - > /dev/null
        rm -rf "$temp_dir"
        ((TESTS_FAILED++))
        return 1
    }
    
    # Verify basic structure
    echo "  🔍 Verifying installation..."
    
    # Check agent command file
    if [[ ! -f ".claude/commands/$agent.md" ]]; then
        echo -e "  ${RED}❌ Missing .claude/commands/$agent.md${NC}"
        cd - > /dev/null
        rm -rf "$temp_dir"
        ((TESTS_FAILED++))
        return 1
    fi
    
    # Check agent-tree directory
    if [[ ! -d "agent-tree" ]]; then
        echo -e "  ${RED}❌ Missing agent-tree directory${NC}"
        cd - > /dev/null
        rm -rf "$temp_dir"
        ((TESTS_FAILED++))
        return 1
    fi
    
    # Check core config files
    if [[ ! -f "agent-tree/agent-tree-config.md" ]]; then
        echo -e "  ${RED}❌ Missing agent-tree-config.md${NC}"
        cd - > /dev/null
        rm -rf "$temp_dir"
        ((TESTS_FAILED++))
        return 1
    fi
    
    # Agent-specific dependency checks
    case "$agent" in
        "servitor")
            # Check tasks
            [[ -f "agent-tree/tasks/status.md" ]] || { echo -e "  ${RED}❌ Missing status.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -f "agent-tree/tasks/list-work.md" ]] || { echo -e "  ${RED}❌ Missing list-work.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # Check workflows
            [[ -f "agent-tree/workflows/scan.md" ]] || { echo -e "  ${RED}❌ Missing scan.md workflow${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -f "agent-tree/workflows/swarm.md" ]] || { echo -e "  ${RED}❌ Missing swarm.md workflow${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # Check scripts
            [[ -f "agent-tree/scripts/agent-assignment.py" ]] || { echo -e "  ${RED}❌ Missing agent-assignment.py script${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -x "agent-tree/scripts/agent-assignment.py" ]] || { echo -e "  ${RED}❌ agent-assignment.py not executable${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            ;;
        "prospector")
            # Check tasks
            [[ -f "agent-tree/tasks/find-leads.md" ]] || { echo -e "  ${RED}❌ Missing find-leads.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -f "agent-tree/tasks/linkedin-profile.md" ]] || { echo -e "  ${RED}❌ Missing linkedin-profile.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # Check workflows
            [[ -f "agent-tree/workflows/go-prospectin.md" ]] || { echo -e "  ${RED}❌ Missing go-prospectin.md workflow${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # Check scripts (prospector has the most scripts)
            [[ -f "agent-tree/scripts/agent-assignment.py" ]] || { echo -e "  ${RED}❌ Missing agent-assignment.py script${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -f "agent-tree/scripts/linkedin-profile.sh" ]] || { echo -e "  ${RED}❌ Missing linkedin-profile.sh script${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -x "agent-tree/scripts/linkedin-profile.sh" ]] || { echo -e "  ${RED}❌ linkedin-profile.sh not executable${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            ;;
        "pm")
            # PM has no scripts, good test case
            [[ -f "agent-tree/tasks/create-prd.md" ]] || { echo -e "  ${RED}❌ Missing create-prd.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            [[ -f "agent-tree/tasks/qa-list.md" ]] || { echo -e "  ${RED}❌ Missing qa-list.md task${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # PM should not have scripts directory if no scripts
            # (but it might exist from core files, so we won't test this)
            ;;
        "auto-jury")
            # Check workflows
            [[ -f "agent-tree/workflows/ask-jury.md" ]] || { echo -e "  ${RED}❌ Missing ask-jury.md workflow${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            # Check scripts
            [[ -f "agent-tree/scripts/agent-assignment.py" ]] || { echo -e "  ${RED}❌ Missing agent-assignment.py script${NC}"; cd - > /dev/null; rm -rf "$temp_dir"; ((TESTS_FAILED++)); return 1; }
            ;;
    esac
    
    echo -e "  ${GREEN}✅ All checks passed${NC}"
    
    # Cleanup
    cd - > /dev/null
    rm -rf "$temp_dir"
    
    ((TESTS_PASSED++))
    return 0
}

# Test invalid agent
echo -e "\n${YELLOW}Testing: Invalid agent handling${NC}"
temp_dir=$(mktemp -d)
cd "$temp_dir"

# Test should fail gracefully
if echo "y" | node "$SCRIPT_DIR/dist/index.js" "invalid-agent" 2>/dev/null; then
    echo -e "  ${RED}❌ Should have failed for invalid agent${NC}"
    ((TESTS_FAILED++))
else
    echo -e "  ${GREEN}✅ Correctly rejected invalid agent${NC}"
    ((TESTS_PASSED++))
fi

cd - > /dev/null
rm -rf "$temp_dir"

# Build the package first
echo -e "\n${YELLOW}Building package...${NC}"
npm run build

# Test each agent
agents=("servitor" "convex-bot" "pm" "lil-fixit" "prospector" "auto-jury")

for agent in "${agents[@]}"; do
    run_test "Agent installation: $agent" "$agent"
done

# Results
echo -e "\n============================================="
echo -e "🏁 Test Results:"
echo -e "  ${GREEN}✅ Passed: $TESTS_PASSED${NC}"
echo -e "  ${RED}❌ Failed: $TESTS_FAILED${NC}"

if [[ $TESTS_FAILED -eq 0 ]]; then
    echo -e "\n${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "\n${RED}💥 Some tests failed!${NC}"
    exit 1
fi