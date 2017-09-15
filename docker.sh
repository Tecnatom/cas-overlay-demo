#!/bin/sh

mvnw clean package
cd cas-overlay-server
docker build -t cas-overlay-server .
docker run --name server -p 127.0.0.1:8080:8080 -i -d cas-overlay-server
cd ../cas-overlay-management/
docker build -t cas-overlay-management .
docker run --name management -p 127.0.0.1:8081:8081 -i -d cas-overlay-management
