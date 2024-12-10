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
    item_name=$(ls -1 | sed -n "${index}p")
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
    old_name=$(ls -1 | sed -n "${index}p")
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
    item_name=$(ls -1 | sed -n "${index}p")
    read -p "Enter the destination path: " dest_path
    cp -r "$item_name" "$dest_path" && echo "Item '$item_name' copied successfully to '$dest_path'." || echo "Error copying item."
    read -p "Press Enter to continue..."
}
move_item() {
    clear
    current_dir
    echo "========== Move Item =========="
    list_items
    read -p "Enter the index of the item to move: " index
    item_name=$(ls -1 | sed -n "${index}p")
    read -p "Enter the destination path: " dest_path

    if [[ -d "$item_name" || -f "$item_name" ]]; then
        mv "$item_name" "$dest_path" && echo "Item '$item_name' moved successfully to '$dest_path'." || echo "Error moving item."
    else
        echo "Error: Item does not exist or is not accessible."
    fi

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
    while true; do
        clear
        current_dir
        echo "========== Grant File Access =========="
        
        # List all files/directories in the current directory with an index
        echo "Available items in $(pwd):"
        ls -1 | nl -s '. '
        
        # Prompt user to select files/directories by index
        echo
        read -p "Enter the indexes of files/directories to assign (comma-separated): " indexes
        read -p "Enter the role (group) to assign access: " role
        
        # Convert indexes to filenames
        IFS=',' read -ra indices <<< "$indexes"
        for index in "${indices[@]}"; do
            item=$(ls -1 | sed -n "${index}p")
            
            # Grant access to each selected item
            if [[ -d "$item" || -f "$item" ]]; then
                chown :$role "$item" && chmod 770 "$item"
                echo "Access to '$item' granted to role '$role'."
            else
                echo "Error: '$item' does not exist or is not accessible."
            fi
        done
        
        # Ask if user wants to assign more files/directories
        read -p "Do you want to assign more files/directories? (y/n): " choice
        if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
            break
        fi
    done
    
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
    if grep -q "^AllowGroups" /etc/ssh/sshd_config; then
        sed -i "/^AllowGroups/s/$/ $role/" /etc/ssh/sshd_config
    else
        echo "AllowGroups $role" >> /etc/ssh/sshd_config
    fi

    systemctl restart sshd
    echo "SSH access for role '$role' is now enabled."

    # Retrieve server IP address
    server_ip=$(hostname -I | awk '{print $1}') # Get the first IP address from the list

    # Provide SSH command instructions to role users
    echo
    echo "========== Instructions for Role Users =========="
    echo "Users in the '$role' role can access this server using the following command:"
    echo
    echo "ssh <username>@$server_ip"
    echo
    echo "Replace <username> with your assigned username."
    echo "Ensure that your system has SSH client installed and you have the proper private key or password to authenticate."
    echo "================================================="
    echo

    read -p "Press Enter to continue..."
}


home_page() {
    clear
    current_dir
    echo "====================================="
    echo "        Welcome to FileShell         "
    echo "====================================="
    echo "1. Change Directory"
    echo "2. Create Item (File/Directory)"
    echo "3. Remove Item"
    echo "4. Rename Item"
    echo "5. Copy Item"
    echo "6. Move Item"                  # New option for Move
    echo "7. Search Files/Directories"
    echo "8. Display Full Directory Information"
    echo "9. Manage Users"
    echo "10. Manage Roles"
    echo "11. Grant File Access to Roles"
    echo "12. Manage SSH Access"
    echo "13. Exit"
    echo "====================================="
}

# Main loop (Updated to call move_item)
while true; do
    home_page
    read -p "Choose an option: " choice
    case $choice in
        1) change_directory ;;
        2) create_item ;;
        3) remove_item ;;
        4) rename_item ;;
        5) copy_item ;;
        6) move_item ;;             # Call move_item function
        7) search_items ;;
        8) directory_info ;;
        9) manage_users ;;
        10) manage_roles ;;
        11) grant_file_access ;;
        12) manage_ssh_access ;;
        13) echo "Goodbye!" && exit ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done
