Bench reference for quick comparisons

Files included:
- stabilize_summary.json  : summary (mean/median/stdev/min/max) for the 20-run stabilize sweep (jemalloc writev+pool)
- cross_compare_summary.json : per-binary summaries across workers=[1,8], batch=[1024,2048], 5 repeats
- median_sample.txt : small placeholder pointing to the full sample

Full artifacts (keep in original folders):
- Full sample text: profile/instrumented/optimized/stabilize_arm_jemalloc/wal_proto_jemalloc_median_sample.txt
- Per-run JSONs: profile/instrumented/optimized/stabilize_arm_jemalloc/*.json and profile/instrumented/optimized/cross_compare/*/*.json

Suggested usage:
- Use the JSON summaries for quick dashboards or to attach to PRs.
- For detailed hotspot work, open the full sample in the stabilize directory and inspect the aggregator/allocator hotspots.

Created by the bench automation script. Copy this folder to a remote storage location if you need to share a minimal bench snapshot.
