#!/bin/bash

socat TCP4-LISTEN:5010,fork,tcpwrap=script EXEC:/hf18/challenges/priv-1/docker.sh,pty,stderr
