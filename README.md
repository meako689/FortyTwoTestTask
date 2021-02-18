42-test template
===========================

A Django 3+ project template

Use fortytwo_test_task.settings when deploying with getbarista.com

### Requirements
* SPA
* global: `yarn`, `node`, `python>=3.7`, `pre-commit`
* api in apps/ folder
* ui in frontend/ folder
* use local.py for different local settings
* management commands should be proxied to single word make commands, e.g make test
* artifacts are built locally (`make build`) and pushed
