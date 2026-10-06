#!/bin/bash
# Install and configure Apache Web Server
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from EC2 Instance: $(hostname -f)</h1>" > /var/www/html/index.html
