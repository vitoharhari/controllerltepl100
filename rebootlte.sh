#!/bin/bash

{ echo "reboot"; sleep 2; } | telnet 169.254.0.1
exit 
