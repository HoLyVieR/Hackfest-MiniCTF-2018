#!/bin/bash

docker run --rm -it "hf18-priv-2:latest" timeout -k 1 -s 9 600 su - challenge -c bash

