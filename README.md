FileShell
FileShell is an interactive Bash-based file, user, and role management tool for Linux that lets you perform common admin tasks from a single menu-driven terminal interface.​
It is useful for quickly navigating directories, organizing files, managing users and groups, and controlling role-based access and SSH login without typing long command sequences.​

Features
Directory navigation:

View the current working directory.

List files and directories with numbered indexes.

Move one level up, enter a subdirectory by index, or jump to a specific path.​

File and folder operations:

Create single or multiple files and directories, either by manually provided names or using a pattern with a count.

Rename, copy, move, and remove files or directories by selecting them via index.

Display a detailed, human-readable directory listing with sizes and directories grouped first.​

Search:

Search for files and directories recursively from the current directory using a name pattern.​

User management:

View system users.

Add users with passwords.

Remove users.

Assign users to roles (Linux groups).​

Role (group) management:

View existing roles (groups).

Create and delete roles.

View users belonging to a specific role.​

Role-based file access:

Select files/directories by index and grant access to a role by changing group ownership and permissions (e.g., 770).​

SSH access management:

Allow SSH access for a specific role by updating AllowGroups in sshd_config and restarting sshd.

Display the SSH command pattern (including server IP) for users in that role.​

Menu overview
When you run the script, the home menu shows options similar to:

1 – Change Directory

2 – Create Item (File/Directory)

3 – Remove Item

4 – Rename Item

5 – Copy Item

6 – Move Item

7 – Search Files/Directories

8 – Display Full Directory Information

9 – Manage Users

10 – Manage Roles

11 – Grant File Access to Roles

12 – Manage SSH Access

13 – Exit

Menu-driven CLI tools typically expose key actions as numbered options so users can quickly trigger operations by entering a number.​

Requirements
Operating system:

Linux distribution with Bash available.

Permissions:

Root or sudo privileges required for user, group, permission, and SSH configuration tasks (for commands like useradd, userdel, usermod, groupadd, groupdel, chown, chmod, and editing /etc/ssh/sshd_config).​

Dependencies:

Standard Unix utilities: ls, pwd, cd, sed, nl, find, cp, mv, rm, getent, hostname, systemctl (for managing sshd).​

Installation
Clone the repository:

bash
git clone https://github.com/<your-username>/fileshell.git
cd fileshell
Make the script executable:

bash
chmod +x fileshell.sh
(Recommended) Run with sudo for full functionality:

bash
sudo ./fileshell.sh
Cloning a GitHub repository, marking a Bash script as executable, and running it from the project directory are standard steps for installing CLI tools.​

Usage
Start FileShell:

bash
./fileshell.sh
Use the on-screen menu:

Navigate directories:

Choose “Change Directory” to move one level up, enter a subdirectory by index, or set an absolute path.

Manage files and directories:

Use “Create Item” to create one or more files/directories (manual or pattern-based).

Use “Remove Item”, “Rename Item”, “Copy Item”, and “Move Item” to manipulate items by index in the current directory.

Explore and inspect:

Use “Search Files/Directories” to run a recursive search from the current directory using a search term.

Use “Display Full Directory Information” to see a detailed listing with sizes and grouped directories.​

Admin tasks:

“Manage Users” to list users, add/remove users, and assign roles (groups).

“Manage Roles” to list, create, delete roles, and view users in a role.

“Grant File Access to Roles” to assign group ownership and restrictive permissions to selected files/directories.

“Manage SSH Access” to allow SSH login for a specific group and show connection instructions.​

Interactive file managers and admin scripts typically combine navigation, manipulation, and admin features into a loop that repeats until the user chooses to exit.​

Security notes
Run administrative options only when you understand the impact on system users, groups, and SSH access.

Changing AllowGroups and restarting sshd directly affects which users can log in; ensure you do not accidentally block required access.​

Use strong passwords when creating users and follow your organization’s policies for group design and file permissions.​

Roadmap / ideas
Potential future improvements:

Add log output for critical actions (user creation, deletion, permission changes).

Add dry-run mode for sensitive operations.

Add configuration file support for default roles, base directories, or permission schemes.

Add language or theme customization for the menu UI.​

License
This project is licensed under the MIT License. See the LICENSE file for details
