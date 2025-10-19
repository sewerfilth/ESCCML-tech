Aggregator microbench results

- Binary: examples/aggregator_bench (release, feature `aggregator`)
- Command: `cargo run -p storage-engine --example aggregator_bench --features aggregator --release`
- Result: Total ops: 200000 in 4.552749833s => 43929.49 ops/s
- Notes: Bounded crossbeam channel depth 1024, drain window 256. This harness is a simple best-effort microbench and not a full integration workload; use `programs/ledgerd/examples/wal_proto.rs` for full runtime comparisons.
