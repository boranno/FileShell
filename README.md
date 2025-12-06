# FileShell 🐚

A comprehensive bash-based file and system management tool with user and role management capabilities.

## 📋 Features

### File & Directory Management
- Navigate through directories with ease
- Create single or multiple files/directories
- Remove files and directories by index
- Rename items with a simple interface
- Copy files and directories to specified locations
- Move items between directories
- Search for files and directories by name

### User & Role Management
- **Manage Users**: Add, remove, and view system users
- **Manage Roles**: Create and manage user groups
- **Assign Roles**: Add users to specific groups
- **Grant File Access**: Control file/directory permissions by role
- **SSH Access Control**: Manage SSH access based on user roles

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/boranno/FileShell.git
cd FileShell
```

2. Make the script executable:
```bash
chmod +x FileShell.sh
```

3. Run with sudo (required for user/role management features):
```bash
sudo ./FileShell.sh
```

## 💻 Usage

### Main Menu Options

| Option | Description |
|--------|-------------|
| 1 | Change Directory |
| 2 | Create Item (File/Directory) |
| 3 | Remove Item |
| 4 | Rename Item |
| 5 | Copy Item |
| 6 | Move Item |
| 7 | Search Files/Directories |
| 8 | Display Full Directory Information |
| 9 | Manage Users |
| 10 | Manage Roles |
| 11 | Grant File Access to Roles |
| 12 | Manage SSH Access |
| 13 | Exit |

### Quick Examples

**Create Multiple Directories:**
```
Choose option 2 → Create Multiple Directories → Bulk Creation
Base name: project_
Count: 5
Creates: project_1, project_2, project_3, project_4, project_5
```

**Grant File Access to a Role:**
```
Choose option 11 → Select files by index → Specify role
Automatically sets group ownership and permissions (770)
```

**Enable SSH Access for a Role:**
```
Choose option 12 → Enter group name
Modifies /etc/ssh/sshd_config and restarts SSH service
```

## ⚙️ Requirements

- Linux-based operating system
- Bash shell
- Root/sudo privileges (for user and SSH management features)
- SSH server installed (for SSH management features)

## 🔒 Security Notes

- This script requires root privileges for user/role management
- SSH configuration changes affect system security
- Review permissions before granting file access to roles
- Always backup `/etc/ssh/sshd_config` before modifications

## 📝 Features in Detail

### Directory Navigation
- Move backward one level
- Enter subdirectories by index
- Jump to any specific path
- Current directory always displayed

### Bulk Operations
- Create multiple files/directories at once
- Pattern-based creation (e.g., file_1, file_2, file_3...)
- Manual name specification

### Permission Management
- Set group ownership on files and directories
- Automatic permission configuration (770)
- Role-based access control

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## ⚠️ Disclaimer

This tool makes system-level changes. Use with caution and always:
- Test in a safe environment first
- Backup important data
- Review changes before applying them
- Understand the implications of user and SSH management

## 👨‍💻 Author

Your Name - [Boranno Golder](https://github.com/boranno)

## 🙏 Acknowledgments

- Built with Bash
- Designed for Linux system administrators
- Inspired by the need for simplified file and user management