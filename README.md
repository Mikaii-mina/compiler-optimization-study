# Compiler Optimization Study

本项目用 8 个 C 程序比较 GNU GCC 与 Apple Clang 在 `-O0`、`-O2`、`-O3` 下的优化报告、ARM64 汇编和内核计时。

环境见 [environment.md](environment.md)，研究目标、实验设计、采集流程和复现规范见 [DESIGN.md](DESIGN.md)。

## 项目结构

```text
compiler-optimization-study/
├── benchmarks/                 # 8 个独立 C Benchmark
├── scripts/                    # 配置、实验入口、计时驱动、验证和整理脚本
├── runs/<run-id>/
│   ├── raw/                     # 原始报告、汇编、执行输出、逐样本数据、日志、源码快照
│   └── processed/               # 汇总 CSV、逐样本 CSV 和分析状态
├── validation/timer/<id>/       # 独立的计时器探针与冒烟运行记录
├── environment.md               # 实际系统和编译器信息
└── DESIGN.md                    # 实验设计与复现规范
```

脚本的调用关系和执行顺序见 [scripts/README.md](scripts/README.md)。
