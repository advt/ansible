## WordPress + Nginx + PHP-FPM Deployment

- Requires Ansible 1.2 or newer
- Expects Debian hosts

The playbooks will install standard tools on a server and configure 
MySQL, WordPress, Nginx and PHP-FPM. When the run
is complete, you can hit access server to begin the WordPress configuration.

## Use
Copy groups_var/all.example to groups_var/all
Customize groups_var/all

Run with something like:
```
ansible-playbook -i hosts.example site.yml
```

## Credits
Based on the good practice from Ansible team
