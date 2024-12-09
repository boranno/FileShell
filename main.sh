#!/bin/bash

# Display the current working directory
current_dir() {
    echo "====================================="
    echo "Current Directory: $(pwd)"
    echo "====================================="
}

# Show all directories/files with an index
list_items() {
    echo "Available items in $(pwd):"
    ls -1 | nl -s '. ' # Numbered list of files and directories
}

# Change the directory
change_directory() {
    while true; do
        clear
        current_dir
        echo "========== Directory Navigation =========="
        echo "1. Move Backward (One Level)"
        echo "2. Enter a Subdirectory (Index)"
        echo "3. Set a Specific Directory Path"
        echo "4. Go Back to Home Page"
        echo "=========================================="
        read -p "Choose an option: " choice

        case $choice in
            1)
                cd .. && echo "Moved backward: $(pwd)" || echo "Error: Cannot move backward."
                read -p "Press Enter to continue..."
                ;;
            2)
                list_items
                read -p "Enter the index of the subdirectory: " index
                sub_dir=$(ls -1 | sed -n "${index}p")
                cd "$sub_dir" && echo "Moved to subdirectory: $(pwd)" || echo "Error: Invalid index."
                read -p "Press Enter to continue..."
                ;;
            3)
                read -p "Enter the full directory path: " dir_path
                cd "$dir_path" && echo "Changed to directory: $(pwd)" || echo "Error: Invalid path."
                read -p "Press Enter to continue..."
                ;;
            4)
                return
                ;;
            *)
                echo "Invalid choice. Try again."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Create a directory or file
create_item() {
    while true; do
        clear
        current_dir
        echo "========== Create Item =========="
        echo "1. Create Single Directory"
        echo "2. Create Multiple Directories"
        echo "3. Create Single File"
        echo "4. Create Multiple Files"
        echo "5. Go Back to Home Page"
        echo "================================="
        read -p "Choose an option: " choice

        case $choice in
            1)
                read -p "Enter the directory name: " dir_name
                mkdir "$dir_name" && echo "Directory '$dir_name' created successfully." || echo "Error creating directory."
                read -p "Press Enter to continue..."
                ;;
            2)
                echo "1. Provide Names Manually"
                echo "2. Bulk Creation (Pattern)"
                read -p "Choose an option: " sub_choice
                case $sub_choice in
                    1)
                        read -p "Enter directory names (space-separated): " -a dir_names
                        for dir_name in "${dir_names[@]}"; do
                            mkdir "$dir_name" || echo "Error creating '$dir_name'."
                        done
                        echo "Directories created successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    2)
                        read -p "Enter the base name (e.g., 'dir_'): " base_name
                        read -p "Enter the number of directories to create: " count
                        for i in $(seq 1 $count); do
                            mkdir "${base_name}${i}" || echo "Error creating '${base_name}${i}'."
                        done
                        echo "$count directories created successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    *)
                        echo "Invalid choice."
                        read -p "Press Enter to continue..."
                        ;;
                esac
                ;;
            3)
                read -p "Enter the file name: " file_name
                touch "$file_name" && echo "File '$file_name' created successfully." || echo "Error creating file."
                read -p "Press Enter to continue..."
                ;;
            4)
                echo "1. Provide Names Manually"
                echo "2. Bulk Creation (Pattern)"
                read -p "Choose an option: " sub_choice
                case $sub_choice in
                    1)
                        read -p "Enter file names (space-separated): " -a file_names
                        for file_name in "${file_names[@]}"; do
                            touch "$file_name" || echo "Error creating '$file_name'."
                        done
                        echo "Files created successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    2)
                        read -p "Enter the base name (e.g., 'file_'): " base_name
                        read -p "Enter the number of files to create: " count
                        for i in $(seq 1 $count); do
                            touch "${base_name}${i}" || echo "Error creating '${base_name}${i}'."
                        done
                        echo "$count files created successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    *)
                        echo "Invalid choice."
                        read -p "Press Enter to continue..."
                        ;;
                esac
                ;;
            5)
                return
                ;;
            *)
                echo "Invalid choice."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Remove a file or directory by index
remove_item() {
    clear
    current_dir
    echo "========== Remove Item =========="
    list_items
    read -p "Enter the index of the item to remove: " index
    item_name=$(ls -1 | sed -n "${index}p}")
    rm -r "$item_name" && echo "Item '$item_name' removed successfully." || echo "Error removing item."
    read -p "Press Enter to continue..."
}

# Rename a file or directory by index
rename_item() {
    clear
    current_dir
    echo "========== Rename Item =========="
    list_items
    read -p "Enter the index of the item to rename: " index
    old_name=$(ls -1 | sed -n "${index}p}")
    read -p "Enter the new name: " new_name
    mv "$old_name" "$new_name" && echo "Item renamed successfully." || echo "Error renaming item."
    read -p "Press Enter to continue..."
}

# Copy a file or directory by index
copy_item() {
    clear
    current_dir
    echo "========== Copy Item =========="
    list_items
    read -p "Enter the index of the item to copy: " index
    item_name=$(ls -1 | sed -n "${index}p}")
    read -p "Enter the destination path: " dest_path
    cp -r "$item_name" "$dest_path" && echo "Item '$item_name' copied successfully to '$dest_path'." || echo "Error copying item."
    read -p "Press Enter to continue..."
}

# Search for files or directories
search_items() {
    clear
    current_dir
    echo "========== Search =========="
    read -p "Enter the name to search for: " search_term
    echo "Search results:"
    find . -name "*$search_term*"
    read -p "Press Enter to continue..."
}

# Display full directory information
directory_info() {
    clear
    current_dir
    echo "========== Directory Information =========="
    ls -lh --group-directories-first
    echo "==========================================="
    read -p "Press Enter to continue..."
}

# Manage users (Placeholder)

# Show all directories/files with an index
list_items() {
    echo "Available items in $(pwd):"
    ls -1 | nl -s '. ' # Numbered list of files and directories
}

# Manage Users (Create, Delete, Assign Roles)
manage_users() {
    while true; do
        clear
        echo "========== Manage Users =========="
        echo "1. View Users"
        echo "2. Add User"
        echo "3. Remove User"
        echo "4. Assign Role to User"
        echo "5. Go Back to Home Page"
        echo "================================="
        read -p "Choose an option: " choice

        case $choice in
            1)
                echo "Displaying list of users..."
                getent passwd # List all users
                read -p "Press Enter to continue..."
                ;;
            2)
                read -p "Enter the new username: " username
                read -sp "Enter the password for $username: " password
                useradd "$username" && echo "$username:$password" | chpasswd
                echo "User $username added successfully."
                read -p "Press Enter to continue..."
                ;;
            3)
                read -p "Enter the username to remove: " username
                userdel -r "$username" && echo "User $username removed successfully." || echo "Error removing user."
                read -p "Press Enter to continue..."
                ;;
            4)
                read -p "Enter the username to assign a role: " username
                read -p "Enter the role (group) to assign to $username: " role
                usermod -aG "$role" "$username" && echo "Role $role assigned to $username." || echo "Error assigning role."
                read -p "Press Enter to continue..."
                ;;
            5)
                return
                ;;
            *)
                echo "Invalid choice."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Manage Roles (Create, Delete, View Users in Role)
manage_roles() {
    while true; do
        clear
        echo "========== Manage Roles =========="
        echo "1. View Roles"
        echo "2. Add Role"
        echo "3. Remove Role"
        echo "4. View Users in a Role"
        echo "5. Go Back to Home Page"
        echo "================================="
        read -p "Choose an option: " choice

        case $choice in
            1)
                echo "Displaying list of roles..."
                getent group # List all groups
                read -p "Press Enter to continue..."
                ;;
            2)
                read -p "Enter the new role (group) name: " role
                groupadd "$role" && echo "Role $role created successfully." || echo "Error creating role."
                read -p "Press Enter to continue..."
                ;;
            3)
                read -p "Enter the role (group) to remove: " role
                groupdel "$role" && echo "Role $role removed successfully." || echo "Error removing role."
                read -p "Press Enter to continue..."
                ;;
            4)
                read -p "Enter the role (group) to view users: " role
                echo "Users in $role:"
                getent group "$role" # Display users in a role
                read -p "Press Enter to continue..."
                ;;
            5)
                return
                ;;
            *)
                echo "Invalid choice."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Grant file access to roles (based on directories)
grant_file_access() {
    clear
    echo "========== Grant File Access =========="
    read -p "Enter the directory to assign to a role: " dir
    read -p "Enter the role (group) to assign access: " role
    chown :$role "$dir" # Set the group ownership
    chmod 770 "$dir"     # Give read/write/execute access to the group
    echo "Access to $dir granted to $role."
    read -p "Press Enter to continue..."
}

# Manage SSH Access for Users (control access through roles)
manage_ssh_access() {
    clear
    echo "========== Manage SSH Access =========="
    echo "This step will control access to the server for users based on their roles."
    read -p "Enter the role (group) to allow SSH access: " role
    echo "Allowing SSH access for group $role..."
    
    # Edit sshd_config to allow SSH access based on group
    echo "AllowGroups $role" >> /etc/ssh/sshd_config
    systemctl restart sshd
    echo "SSH access for role $role is now enabled."
    read -p "Press Enter to continue..."
}

# Home page menu
home_page() {
    clear
    current_dir
    echo "====================================="
    echo "        Welcome to File Manager      "
    echo "====================================="
    echo "1. Change Directory"
    echo "2. Create Item (File/Directory)"
    echo "3. Remove Item"
    echo "4. Rename Item"
    echo "5. Copy Item"
    echo "6. Search Files/Directories"
    echo "7. Display Full Directory Information"
    echo "8. Manage Users"
    echo "9. Manage Roles"
    echo "10. Grant File Access to Roles"
    echo "11. Manage SSH Access"
    echo "12. Exit"
    echo "====================================="
}

# Main loop
while true; do
    home_page
    read -p "Choose an option: " choice
    case $choice in
        1) change_directory ;;
        2) create_item ;;
        3) remove_item ;;
        4) rename_item ;;
        5) copy_item ;;
        6) search_items ;;
        7) directory_info ;;
        8) manage_users ;;       # Option to manage users
        9) manage_roles ;;       # Option to manage roles
        10) grant_file_access ;; # Option to grant file access based on roles
        11) manage_ssh_access ;; # Option to manage SSH access
        12) echo "Goodbye!" && exit ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done

