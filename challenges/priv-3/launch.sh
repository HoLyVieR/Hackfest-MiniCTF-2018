#!/bin/bash

socat TCP4-LISTEN:5012,fork,tcpwrap=script EXEC:/hf18/challenges/priv-3/docker.sh,pty,stderr
