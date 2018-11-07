#!/bin/bash

socat TCP4-LISTEN:5011,fork,tcpwrap=script EXEC:/hf18/challenges/priv-2/docker.sh,pty,stderr
