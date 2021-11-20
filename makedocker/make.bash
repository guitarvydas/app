#!/bin/bash
docker rmi -f app
docker build -t app .
