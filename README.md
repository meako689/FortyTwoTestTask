42-test template
===========================

A Django 3+ project template

### System requirements
* global: yarn, node (tested on v15), python>=3.7 (tested on 3.9) *OR* docker

### Code/deployment requirements
* management commands should be proxied to single word make commands, e.g make test
* app should be deployed on a server of your choice (heroku, pythonanywhere, aws, etc.)

### Initial setup
You can develop app in docker container or directly on host, check `.env.example`
Most usable commands are proxied in the `Makefile`
