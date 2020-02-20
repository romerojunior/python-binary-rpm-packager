#!/bin/bash

cat << EOF >> /etc/systemd/system/example.service
[Unit]
Description=Example service description

[Install]
WantedBy=default.target

[Service]
Environment=PYTHONUNBUFFERED=1
Environment=TMPDIR=/var/tmp
ExecStart=/opt/example/example
SyslogIdentifier=example
Restart=on-failure
EOF
