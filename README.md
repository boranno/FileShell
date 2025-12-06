FileShell

An interactive, menu-driven Bash tool for file, user, and role (group) management on Linux — perform common admin tasks from a single terminal interface without typing long command sequences.

FileShell is useful for quickly navigating directories, organizing files, managing users and groups, and controlling role-based access and SSH login — all from a simple numbered menu.

Table of contents

Features

Requirements

Installation

Usage

Menu overview

Examples

Security notes & warnings

Roadmap

Contributing

License

Features

Directory navigation

View current working directory.

List files and directories with numbered indexes.

Move up one level, enter a subdirectory by index, or jump to an absolute path.

File & folder operations

Create single or multiple files/directories (manual names or pattern + count).

Rename, copy, move, and remove items by index.

Detailed, human-readable directory listing (sizes; directories shown first).

Search

Recursive search for files and directories from the current directory using name patterns.

User management

List system users.

Add users with password entry.

Remove users.

Assign users to roles (Linux groups).

Role (group) management

List groups.

Create / delete groups.

Show group members.

Role-based file access

Select files/directories by index and grant access to a role by changing group ownership and permission (example: 770).

SSH access management

Allow SSH access for a role by editing AllowGroups in /etc/ssh/sshd_config and restarting sshd (requires root).

Display example SSH connection string (includes server IP/hostname).

Requirements

Operating system

Any Linux distribution with Bash (e.g., Debian/Ubuntu, Fedora, CentOS, Arch).

Permissions

Root or sudo required for user/group/permission/SSHD changes (useradd, userdel, usermod, groupadd, groupdel, chown, chmod, editing /etc/ssh/sshd_config, restarting sshd).

Dependencies

Standard Unix utilities: ls, pwd, cd, sed, nl, find, cp, mv, rm, getent, hostname, systemctl (for sshd) — all commonly available on modern Linux systems.

Installation

Clone the repository and make the script executable:

git clone https://github.com/<your-username>/fileshell.git
cd fileshell
chmod +x fileshell.sh


Recommended: Run with sudo for full functionality:

sudo ./fileshell.sh

Usage

Start FileShell from the project directory:

./fileshell.sh


When launched, FileShell displays a numbered menu. Enter the number for the action you want, follow prompts, and press Enter. The main menu loop repeats until you choose Exit.

Menu overview

Typical home menu:

1  – Change Directory
2  – Create Item (File/Directory)
3  – Remove Item
4  – Rename Item
5  – Copy Item
6  – Move Item
7  – Search Files/Directories
8  – Display Full Directory Information
9  – Manage Users
10 – Manage Roles
11 – Grant File Access to Roles
12 – Manage SSH Access
13 – Exit


Menu-driven CLI tools expose actions as numbered options so users can trigger operations quickly by entering the number.

Examples
1) Change directory

Choose option 1.

You will be prompted to:

Enter .. to go up one level,

Enter an index to go into a listed subdirectory,

Or give an absolute path (e.g., /var/www).

2) Create multiple files with a pattern

Option 2 → choose File → select “pattern” mode → enter base name and count:

Enter base name: note
Enter count: 3
Created: note1, note2, note3

3) Assign role-based access to a directory

Option 11 → pick a directory by index → type the role (group) name → FileShell will:

chgrp -R role /path/to/item

chmod -R 770 /path/to/item
(This grants full access to owner + group, none for others.)

4) Allow SSH only for a role

Option 12 → choose role name (group).

FileShell will append or update AllowGroups role1 role2 in /etc/ssh/sshd_config and attempt to restart sshd:

# Example output:
Updated /etc/ssh/sshd_config: AllowGroups admin developers
Restarting sshd...
sshd restarted successfully
SSH connection example for role members:
ssh username@server.example.com


Important: FileShell will backup /etc/ssh/sshd_config before changes (e.g., /etc/ssh/sshd_config.bak.fileshell).

Commands & behaviour (short)

List with indexes — items are shown with numeric indexes so subsequent operations accept index input rather than long paths.

Search — uses find with user-provided pattern; supports wildcard patterns.

User add — runs useradd, optionally passwd to set password (interactively).

Group operations — groupadd, groupdel, getent group.

SSH — edits AllowGroups setting and restarts sshd via systemctl restart sshd (or service ssh restart fallback).

Security notes & warnings

Run admin options only when you understand the impact. Deleting users, groups, or altering sshd may lock out accounts or break services.

FileShell edits /etc/ssh/sshd_config and restarts sshd. Always verify the file before a restart; FileShell attempts to back up the file automatically.

Use strong passwords when creating users. Prefer --create-home and set UMASK/permissions according to policy.

Permission examples like 770 are restrictive — ensure this fits your use-case. Misconfigured group ownership or permissions can prevent system services or users from accessing needed files.

Always test in a safe environment (VM/container) if unsure.

Troubleshooting

sshd failed to restart after editing /etc/ssh/sshd_config: Restore the backup:

sudo cp /etc/ssh/sshd_config.bak.fileshell /etc/ssh/sshd_config
sudo systemctl restart sshd


useradd errors: Ensure script is run as root or with sudo.

Missing utilities: Install typical coreutils (apt, dnf, or pacman as appropriate).

Roadmap / Ideas

Possible future improvements:

Add logging for critical actions (user creation/deletion, permission changes).

Add a dry-run mode for sensitive operations.

Add configuration file support (default roles, base dirs, permission schemes).

Add language/theme customization for the menu UI.

Add unit tests and CI checks to validate sshd config edits before restarting.

Contributing

Contributions welcome. Please open issues for bugs or feature requests and submit pull requests for improvements. Keep changes small and document behavior. If you add features that require new external tools, update the README requirements.

Suggested workflow:

Fork the repo

Create feature branch

Test changes locally (preferably in a VM)

Submit PR with a clear description and tested scenarios

License

This project is licensed under the MIT License. See LICENSE for details.

Author / Contact

Created by <your-username> — replace with your GitHub handle in the repo and README.
