#!/bin/bash
log_file="login_data.txt"
enter_data() {
        echo "Enter login data for users (Type 'exit' to stop):"
        while true; do
                read -p "Enter username (or 'exit' to quit):" username
                if [ "$username" = "exit" ]; then
                        break
                fi
                echo "$(date): $username logged in" >> "$log_file"
                echo "Data recorded."
        done
}
count_login() {
        read -p "Enter the username to count logins : " username
        login_count=$(grep -c "$username" "$log_file")
        echo "$username has logged in $login_count times."
}
while true; do
        echo ""
        echo "Choose an option"
        echo "1. Enter login data"
        echo "2. Count user logins"
        echo "3. Exit"
        read -p "Enter choice (1-3): " choice
        case $choice in
                1)
                        enter_data
                        ;;
                2)
                        count_login
                        ;;
                3)
                        echo "Goodbye"
                        break
                        ;;
                *)
                        echo "Invalid choice. Please select 1, 2, or 3."
        esac
done
