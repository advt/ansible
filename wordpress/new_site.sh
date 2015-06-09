#!/bin/sh

hash pwgen 2>/dev/null || (echo "\033[1;31mPlease install pwgen!\033[0m]" && echo "apt-get install pwgen" && exit 1)

VAR_FILE="group_vars/all"
VAR_EXAMPLE_FILE="group_vars/all.example"


echo "[+] Copy template..."
cp "${VAR_EXAMPLE_FILE}" "${VAR_FILE}"

echo "Please, enter the new WordPress installation's Server Name: "
read server_name

wp=$(echo "${server_name}" |tr -d '[.,-_]')
password=$(pwgen 12)

echo "[+] Setting server_name..."
sed -i "s/.*server_hostname.*/server_hostname: ${server_name}/g" "${VAR_FILE}"

echo "[+] Setting wp_db_user..."
sed -i "s/.*wp_db_user.*/wp_db_user: ${wp}/g" "${VAR_FILE}"

echo "[+] Setting wp_db_name..."
sed -i "s/.*wp_db_name.*/wp_db_name: ${wp}/g" "${VAR_FILE}"

echo "[+] Setting wp_db_password..."
sed -i "s/.*wp_db_password.*/wp_db_password: ${password}/g" "${VAR_FILE}"

echo "[+] Done!!"

echo "[+] Infos :"
echo "server_hostname: ${server_name}"
echo "wp_db_name: ${wp}"
echo "wp_db_user: ${wp}"
echo "wp_db_password: ${password}" 
