# 实验脚本说明

在项目根目录运行以下命令。脚本使用固定的 GCC、Clang 绝对路径，要求 macOS ARM64；实际编译器版本和运行环境见项目根目录的 [environment.md](../environment.md)。实验方法与判定口径见 [DESIGN.md](../DESIGN.md)。

## 1. Scripts 总览

| Script | 主要职责 | 输入 | 输出 |
|---|---|---|---|
| `experiment_config.py` | 提供 Benchmark 列表、编译器路径、优化级别和输入规模 |  | 配置 |
| `validate_benchmarks.sh` | 独立检查 8 个 C 程序的小规模边界输入 | `benchmarks/*.c` | 终端中的逐程序通过信息 |
| `run_experiment.py` | 创建一次完整运行，编译 48 种配置、采集报告和汇编、检查正确性并计时 | `benchmarks/*.c`、本目录的配置和计时驱动、`--rounds`、`--samples`、`--seed` | 新的 `runs/<run-id>/raw/` 和 `runs/<run-id>/processed/` |
| `timing_harness.c` | 初始化输入、校准与预热、批量调用目标 `kernel` 并输出计时样本 | `BENCHMARK_ID`、已编译的 `kernel.o`、运行参数 `n` 和 `samples` | 标准输出的 `sample,iterations,total_ns,ns_per_call` CSV；标准错误的 `sink` 值 |
| `analyze_results.py` | 校验一轮运行，并从原始记录生成结构化结果 | `<run-id>`、该运行的 manifest、源码快照、状态、汇编、报告和计时 CSV | 同一处理目录中的 `summary.csv`、`timing_samples.csv`、`analysis_status.json` |

## 2. 执行顺序

1. **边界检查（独立步骤）：** `bash scripts/validate_benchmarks.sh`。通过后再进行正式采集；此脚本的临时文件会删除，不会自动写入 run-id。
2. **创建一次运行：** `python3 scripts/run_experiment.py --rounds 3 --samples 15 --seed 20261126`。脚本先检查环境与编译器，再创建唯一 run-id、保存源码快照和 manifest。
3. **编译与正确性：** 主脚本依配置顺序生成完整汇编、带报告的可执行文件、内核对象与计时程序，并在常规/计时规模下运行正确性检查，保存原始 stdout、stderr、命令与状态。
4. **分轮计时：** 主脚本按记录在 manifest 中的随机顺序执行各轮。计时驱动完成校准、预热与样本输出；主脚本按配置保存每轮 CSV 和 stderr。
5. **自动整理：** 主脚本调用 `analyze_results.py`，校验原始记录、确认汇编文件存在并计算其 SHA-256，生成 `summary.csv`、`timing_samples.csv` 和 `analysis_status.json`。此时无需额外填写文件即可得到完整采集结果。
6. **按需重新整理：** `python3 scripts/analyze_results.py <run-id>`。该命令再次校验原始数据并更新三个派生文件，不重新编译或计时。

一次运行的原始文件始终按 run-id 保留。重新执行主脚本会创建另一个 run-id；再次执行分析脚本只重新生成该 run-id 的派生结果，不重新编译或计时。
