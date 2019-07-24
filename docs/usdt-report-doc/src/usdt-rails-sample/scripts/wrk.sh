#!/bin/bash

CONNS=500
THREADS=500
DURATION=60

wrk -c${CONNS} -t${THREADS} -d${DURATION}s -s ./multi-request-json.lua http://127.0.0.1:3000
