42-test template
===========================

A Django 1.6+ project template

Use fortytwo_test_task.settings when deploying with getbarista

### Recomendations
* apps in apps/ folder
* use per-app templates folders
* use per-app static folders
* use south for migrations
* use settings.local for different environments
* common templates live in templates/
* common static lives in assets/
* management commands should be proxied to single word make commands, e.g make test

