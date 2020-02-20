#!/bin/bash

systemctl stop example
rm -rf /etc/systemd/system/example.service
systemctl daemon-reload
systemctl reset-failed example