# 实验环境

| 项目 | 实验环境 | 原始记录或核对方式 |
|---|---|---|
| 操作系统 | macOS 26.5.2，构建号 25F84 | `sw_vers`；运行目录中的 `sw_vers.stdout` |
| CPU 架构 | ARM64（`arm64`） | `uname -m`；`manifest.json` |
| GNU GCC | Homebrew GCC 16.2.0，`/opt/homebrew/bin/gcc-16` | `gcc/version.stdout` |
| GCC 目标 | `aarch64-apple-darwin25` | `gcc/target.stdout` |
| Apple Clang | 21.0.0（`clang-2100.1.1.101`），`/usr/bin/clang` | `clang/version.stdout` |
| Clang 目标 | `arm64-apple-darwin25.5.0` | `clang/target.stdout` |

计时期间未固定 CPU 核心、频率、温度或系统负载。这些限制及实验设计边界见 [DESIGN.md](DESIGN.md)。
