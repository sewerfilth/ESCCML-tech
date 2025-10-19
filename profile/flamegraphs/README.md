Flamegraph artifacts (raw outputs)

This folder contains the raw JSON outputs from the `wal_proto` harness for three representative configs.

Files:
- raw/wal_proto_1w_durable.json  — 1 worker, durable=true
- raw/wal_proto_4w_buffered.json — 4 workers, durable=false
- raw/wal_proto_8w_buffered.json — 8 workers, durable=false

How to generate flamegraphs locally:

macOS (recommended using Instruments / xctrace):

1. Install full Xcode (Command Line Tools alone are not sufficient for `xctrace`).
2. Build with debug symbols enabled in release profile for better symbolization:

```toml
[profile.release]
debug = true
```

3. Run the example under Instruments (Time Profiler) or use xctrace:

```bash
# example using cargo-flamegraph (requires xctrace/Xcode):
cargo flamegraph --example wal_proto --release -- --workers 4 --iterations 1000 --batch 256 --flush-interval-ms 1000

# or use xctrace directly to record a trace and then open in Instruments:
xctrace record --output wal_proto_trace --target target/release/examples/wal_proto -- --workers 4 --iterations 1000 --batch 256 --flush-interval-ms 1000
```

Linux (perf + FlameGraph):

```bash
# record
perf record -F 99 -a -g -- target/release/examples/wal_proto -- --workers 4 --iterations 1000 --batch 256 --flush-interval-ms 1000

# generate
perf script | /path/to/FlameGraph/stackcollapse-perf.pl | /path/to/FlameGraph/flamegraph.pl > wal_proto_4w_buffered.svg
```

Rust toolchain (cross-platform wrapper):

```bash
cargo install flamegraph
cargo flamegraph --example wal_proto --release -- --workers 4 --iterations 1000 --batch 256 --flush-interval-ms 1000
```

Note: I attempted `cargo flamegraph` in this environment but it failed because `xctrace` requires full Xcode on macOS. The raw harness outputs are stored under `profile/flamegraphs/raw/` if you prefer to run profiling locally and I can then help analyze the resulting SVGs.
