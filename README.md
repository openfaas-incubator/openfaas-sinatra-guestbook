Sinatra Guestbook for OpenFaaS
====================================

This example demonstrates how to build a guestbook with Sinatra that can be deployed to OpenFaaS.

## Components:

* ebs for templating views - [guestbook/views/Dockerfile](guestbook/views/Dockerfile)
* Bootstrap for UI styling
* Ruby 2.4 for runtime - [guestbook/Dockerfile](guestbook/Dockerfile)

## Pre-reqs:

* OpenFaaS & CLI via https://docs.openfaas.com
* MySQL

## Usage:

Run `cp sql.example.yml sql.example` then edit the values in the file, before running:

```
faas-cli up
```
