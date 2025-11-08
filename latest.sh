#!/bin/bash
echo "[Codex Update] Restarting Flask Codex Infinity..."

# Stop any existing Python server on port 5000
fuser -k 5000/tcp 2>/dev/null

# Start Flask again (in background)
nohup python3 app.py > codex.log 2>&1 &

echo "[Codex Update] Codex restarted. Check codex.log for output."
