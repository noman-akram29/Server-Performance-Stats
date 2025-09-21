# Server-Performance-Stats
A simple Bash script to monitor system resources like CPU usage, memory, disk, and top processes.

## 📋 Features

- CPU usage (via `mpstat`)
- Memory usage with percentage
- Disk usage with percentage
- Top 5 processes by CPU
- Top 5 processes by Memory

## 🚀 Requirements

- Bash
- `mpstat` (from `sysstat` package)
- `awk`, `ps`, `df`, `free`, `column` — usually pre-installed

## 🛠️ How to Run

```bash
chmod +x monitor.sh
./monitor.sh


