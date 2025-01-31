#!/bin/bash

docker build . -t host_wnaseeve -f host_wnaseeve.dockerfile
docker build . -t router_wnaseeve -f router_wnaseeve.dockerfile
