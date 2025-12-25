# 🧠 BlackRoad Codex Integration Documentation

## Overview

BlackRoad Codex is a universal code intelligence and AI agent coordination system. It provides code indexing, semantic search, telemetry, and multi-agent orchestration for the BlackRoad OS ecosystem.

## Features

### 1. Code Indexing
- Universal indexing across all file types
- Fast file counting and categorization
- Language-specific statistics
- Repository structure mapping

### 2. Semantic Search
- Intelligent code search capabilities
- Cross-repository search
- Pattern detection
- Symbol resolution

### 3. Agent Coordination
- Multi-AI agent orchestration
- Task distribution and planning
- Agent capability matching
- Workload balancing

### 4. Telemetry & Analytics
- Real-time event tracking
- Performance monitoring
- Agent activity logs
- Deployment metrics

### 5. Traffic Light Integration
- Deployment gate coordination
- Automated status management
- Cross-system synchronization

## Quick Start

### Initialize Codex

```bash
./blackroad-codex-integration.sh init
```

This creates:
- `.blackroad/codex/` directory structure
- `config.json` configuration file
- `index/` for code indices
- `telemetry/` for event logs
- `cache/` for temporary data

### Index Repository

```bash
./blackroad-codex-integration.sh index
```

Scans and indexes:
- All source code files
- Documentation files
- Configuration files
- Creates searchable index

### Register Agent

```bash
./blackroad-codex-integration.sh register <NAME> <TYPE> <CAPABILITIES>
```

Example:
```bash
./blackroad-codex-integration.sh register Alice migration_architect ecosystem_management
```

### Check Status

```bash
./blackroad-codex-integration.sh status
```

## Agent System

### Available Agents

#### Alice 🌌 - Migration Architect
- **Type:** `migration_architect`
- **Capabilities:** Ecosystem organization, large-scale migrations, repository management
- **Hash:** `PS-SHA-∞-alice-f7a3c2b9`

#### Aria 🎵 - Infrastructure Queen
- **Type:** `infrastructure_sovereign`
- **Capabilities:** Infrastructure sovereignty, cost optimization, deployment strategies
- **Hash:** `1ba4761e3dcddbe01d2618c02065fdaa807e8c7824999d702a7a13034fd68533`

#### Cora 💫 - Core Coordinator
- **Type:** `coordinator`
- **Capabilities:** Agent orchestration, task coordination, workflow management

#### Lucidia 🔬 - Science & Math
- **Type:** `science_reasoning`
- **Capabilities:** Mathematical reasoning, formal verification, symbolic logic

#### Caddy 📝 - Documentation
- **Type:** `documentation`
- **Capabilities:** Documentation generation, technical writing, README creation

#### CeCe 🎯 - Dynamic Planner
- **Type:** `dynamic_planner`
- **Capabilities:** Task planning, job orchestration, self-healing, GitHub issue management

#### Roadie 🛣️ - DevOps
- **Type:** `devops`
- **Capabilities:** Deployment automation, CI/CD management, infrastructure as code

#### Holo/Oloh 🪞 - Mirror Agents
- **Type:** `mirror_agent`
- **Capabilities:** Code review, reflection, pattern detection

#### Gaia 🌍 - Ecosystem Manager
- **Type:** `ecosystem_manager`
- **Capabilities:** Ecosystem monitoring, health checks, coordination

#### Tosha 📊 - Telemetry & Analytics
- **Type:** `telemetry`
- **Capabilities:** Telemetry collection, analytics, monitoring, reporting

### Agent Configuration

Agents are configured in `.blackroad/agent-config.yml`:

```yaml
agents:
  - name: AgentName
    type: agent_type
    capabilities:
      - capability1
      - capability2
    status: active
```

### Coordination Rules

Define how agents work together:

```yaml
coordination:
  planning:
    lead: CeCe
    participants: [Cora, Lucidia]
  
  development:
    lead: Alice
    participants: [Roadie, Caddy]
```

## Telemetry System

### Sending Events

```bash
./blackroad-codex-integration.sh telemetry <EVENT_TYPE> <EVENT_DATA>
```

Example:
```bash
./blackroad-codex-integration.sh telemetry "deployment_started" "production-v1.2.3"
```

### Event Types

- `deployment_started` - Deployment initiated
- `deployment_completed` - Deployment finished
- `agent_activity` - Agent performed action
- `traffic_light_changed` - Status change
- `code_indexed` - Repository indexed
- `test_run` - Tests executed

### Telemetry Files

Events are logged to:
```
.blackroad/codex/telemetry/YYYYMMDD.log
```

Format:
```
[2025-12-25T07:30:00Z] event_type: event_data
```

## API Integration

### Python Example

```python
import json
import subprocess

def codex_init():
    subprocess.run(['./blackroad-codex-integration.sh', 'init'])

def codex_index():
    subprocess.run(['./blackroad-codex-integration.sh', 'index'])

def codex_telemetry(event_type, event_data):
    subprocess.run([
        './blackroad-codex-integration.sh',
        'telemetry',
        event_type,
        event_data
    ])

# Usage
codex_init()
codex_index()
codex_telemetry('custom_event', 'event_data')
```

### Node.js Example

```javascript
const { exec } = require('child_process');

function codexCommand(cmd, args = []) {
  return new Promise((resolve, reject) => {
    exec(`./blackroad-codex-integration.sh ${cmd} ${args.join(' ')}`,
      (error, stdout, stderr) => {
        if (error) reject(error);
        else resolve(stdout);
      }
    );
  });
}

// Usage
await codexCommand('init');
await codexCommand('index');
await codexCommand('telemetry', ['event_type', 'event_data']);
```

## Configuration

### config.json Structure

```json
{
  "version": "1.0.0",
  "repository": "repository-name",
  "initialized": "2025-12-25T07:30:00Z",
  "features": {
    "code_indexing": true,
    "semantic_search": true,
    "agent_coordination": true,
    "telemetry": true,
    "traffic_light": true
  },
  "agents": {
    "registered": [],
    "active": []
  }
}
```

### Enabling/Disabling Features

Edit `.blackroad/codex/config.json`:

```json
{
  "features": {
    "code_indexing": true,     // Enable code indexing
    "semantic_search": false,  // Disable semantic search
    "agent_coordination": true,
    "telemetry": true,
    "traffic_light": true
  }
}
```

## Traffic Light Integration

Codex automatically integrates with the Traffic Light System:

```bash
# Codex tracks traffic light changes
./blackroad-traffic-light.sh greenlight --message "Deployment approved"
# ^ Automatically logged in Codex telemetry

# Check coordination based on traffic light status
./blackroad-codex-integration.sh status
```

## Advanced Usage

### Custom Agent Types

Add custom agents by editing `.blackroad/agent-config.yml`:

```yaml
agents:
  - name: MyCustomAgent
    type: custom_type
    capabilities:
      - custom_capability_1
      - custom_capability_2
    status: active
    metadata:
      custom_field: value
```

### Batch Operations

```bash
#!/bin/bash
# Batch index multiple repositories

for repo in repo1 repo2 repo3; do
  cd $repo
  ./blackroad-codex-integration.sh index
  cd ..
done
```

### Integration with CI/CD

```yaml
# .github/workflows/codex-integration.yml
name: Codex Integration

on: [push]

jobs:
  codex:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Initialize Codex
        run: ./blackroad-codex-integration.sh init
      - name: Index Repository
        run: ./blackroad-codex-integration.sh index
      - name: Send Telemetry
        run: ./blackroad-codex-integration.sh telemetry "ci_run" "${{ github.sha }}"
```

## Best Practices

### 1. Initialize Once
- Run init only when setting up a new repository
- Avoid re-running unnecessarily

### 2. Regular Indexing
- Index after significant code changes
- Automate indexing in CI/CD pipeline

### 3. Agent Registration
- Register agents at initialization
- Keep agent registry up to date

### 4. Telemetry Events
- Send meaningful events
- Use consistent event naming
- Include relevant context data

### 5. Configuration Management
- Version control `.blackroad/agent-config.yml`
- Document custom configurations
- Keep sensitive data out of configs

## Troubleshooting

### Codex Not Initialized

```bash
# Check if codex directory exists
ls -la .blackroad/codex/

# Reinitialize
./blackroad-codex-integration.sh init
```

### Index Issues

```bash
# Rebuild index
rm -rf .blackroad/codex/index/
./blackroad-codex-integration.sh index
```

### Agent Registration Failures

```bash
# Verify agent config syntax
cat .blackroad/agent-config.yml

# Check for YAML errors
python3 -c "import yaml; yaml.safe_load(open('.blackroad/agent-config.yml'))"
```

### Telemetry Not Logging

```bash
# Check telemetry directory
ls -la .blackroad/codex/telemetry/

# Verify write permissions
chmod -R u+w .blackroad/codex/telemetry/
```

## Performance Optimization

### Large Repositories

For repositories with 10,000+ files:

1. Use selective indexing
2. Exclude build artifacts
3. Cache index results
4. Use incremental indexing

### Memory Usage

```bash
# Monitor memory during indexing
/usr/bin/time -v ./blackroad-codex-integration.sh index
```

## Security Considerations

### Sensitive Data

- Don't log sensitive data in telemetry
- Exclude secrets from indexing
- Use `.gitignore` for cache directories

### Access Control

```bash
# Restrict access to codex data
chmod 700 .blackroad/codex/
```

## Ecosystem Integration

### With Other BlackRoad Systems

- **blackroad-multi-ai-system**: Shared agent registry
- **blackroad-agents**: API integration
- **blackroad-cli**: Command-line tools
- **blackroad-tools**: Utility functions

### External Tools

- GitHub Actions integration
- GitLab CI/CD support
- Jenkins pipeline support
- Docker containerization

## Support & Resources

- **Documentation**: [BlackRoad-OS GitHub](https://github.com/BlackRoad-OS)
- **Issues**: Open issues in repository
- **Agents**: Tag relevant agents (@Alice, @Aria, etc.)
- **Community**: BlackRoad OS Discord/Slack

---

**Part of the BlackRoad OS Ecosystem**
