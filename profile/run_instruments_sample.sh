#!/usr/bin/env bash
# Lightweight wrapper to run the runtime_metrics binary in background and sample it on macOS
set -euo pipefail

EXE=target/release/examples/runtime_metrics
if [ ! -x "$EXE" ]; then
  echo "Building release example..."
  cargo build --release --example runtime_metrics
fi

# args to the example - adjust as needed
ARGS=(--iterations 20 --batch-epochs 256 --parallel-workers 4 --wal-max-ops 4096 --wal-max-bytes 524288 --wal-flush-interval-ms 1000 --flush-every-ms 1000)

"$EXE" "${ARGS[@]}" &
PID=$!
echo "Started runtime_metrics pid=$PID"

# sample for 30 seconds at 100ms interval
sample "$PID" 30 -file profile/runtime_metrics_4w_sample.txt

echo "Sample saved to profile/runtime_metrics_4w_sample.txt"
