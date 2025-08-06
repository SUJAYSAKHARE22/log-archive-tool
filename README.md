# Log Archive & Unarchive Tool (Bash CLI)

A simple Bash-based command-line tool to **archive** and **unarchive** log files.  
The tool compresses logs into `.tar.gz` format with timestamped filenames, stores them in a dedicated folder, and keeps a record of archive creation times.

---

## Features
- **Archive** logs from a specified directory into a `.tar.gz` file.
- **Unarchive** existing `.tar.gz` log archives to a target directory.
- **Timestamped filenames** for uniqueness and easy tracking.
- **Automatic log of archive history** (`archive_log.txt`).
- **Pure Bash** — no extra dependencies.

---

## Requirements
- Bash shell (Linux or WSL on Windows)
- `tar` utility (pre-installed on most Linux distros)

---

## Installation
1. Clone this repository:
   git clone https://github.com/<your-username>/<repo-name>.git
2. Go into the project folder:
   cd <repo-name>
3. (Optional) Make the script executable:
   chmod +x log-archive.sh
Usage
1. Run with bash

If you don't make it executable:

bash log-archive.sh archive /path/to/logs

bash log-archive.sh unarchive /path/to/archive.tar.gz /path/to/destination

2. Run as an executable (optional)

chmod +x log-archive.sh
./log-archive.sh archive /path/to/logs
./log-archive.sh unarchive /path/to/archive.tar.gz /path/to/destination

Commands
Archive logs

bash log-archive.sh archive /path/to/logs

Example:

bash log-archive.sh archive /var/log

Output:

    Archive stored in ~/log_archives/

    Log entry added to ~/log_archives/archive_log.txt

Example archive filename:

logs_archive_20250806_150210.tar.gz

Unarchive logs

bash log-archive.sh unarchive /path/to/archive.tar.gz /path/to/destination

Example:

bash log-archive.sh unarchive ~/log_archives/logs_archive_20250806_150210.tar.gz ./restored_logs

This will extract the logs to ./restored_logs.
Example Workflow

# 1. Archive logs
bash log-archive.sh archive /var/log

# 2. List archives
ls ~/log_archives/

# 3. Unarchive
bash log-archive.sh unarchive ~/log_archives/logs_archive_20250806_150210.tar.gz ./restored_logs

Archive Log File

Every time you create an archive, a record is added to:

~/log_archives/archive_log.txt

Example:

2025-08-06 15:02:10 - Created archive: logs_archive_20250806_150210.tar.gz

Notes

    Archives are stored in the ~/log_archives directory by default.

    Ensure you have permission to read logs in the directory you specify.

    Works on Linux and WSL on Windows.
