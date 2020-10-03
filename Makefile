#
# constants
#

SHELL=/bin/bash

PROJECT_NAME=fortytwo_test_task
BIND_TO=localhost
RUNSERVER_PORT=8000
SETTINGS=fortytwo_test_task.settings
TEST_SETTINGS=fortytwo_test_task.settings.test
TEST_APP?=apps
flake8=flake8

PYTHONPATH=$(CURDIR)

MANAGE_PREFIX= PYTHONPATH=$(PYTHONPATH) DJANGO_SETTINGS_MODULE=$(SETTINGS)
MANAGE_CMD=./manage.py
MANAGE= PYTHONPATH=$(PYTHONPATH) DJANGO_SETTINGS_MODULE=$(SETTINGS) $(MANAGE_CMD)

-include Makefile.def

#
# end of constants
#

#
# targets
#

.PHONY: run syncdb initproject dumpdata shell flake8 djangotest collectstatic clean manage migrate only_migrate init_migrate

run:
	@echo Starting $(PROJECT_NAME)...
	$(MANAGE) runserver $(BIND_TO):$(RUNSERVER_PORT)

createcachetable:
	@echo Creating cache table
	$(MANAGE) createcachetable

initproject: migrate createcachetable

shell:
	@echo Starting shell...
	$(MANAGE) shell

lint:
	jinjalint .
	./bin/check_noqa.sh
	./bin/check_layout.sh
	$(flake8) apps
	black apps

djangotest:
	TESTING=1 PYTHONWARNINGS=ignore $(MANAGE_CMD) test --settings=$(TEST_SETTINGS) $(TEST_APP)

test: lint djangotest

collectstatic: clean
	@echo Collecting static
	$(MANAGE) collectstatic --noinput
	@echo Done

clean:
	@echo Cleaning up...
	find ./ -name '__pycache__' -print|xargs -I {} rm -r {}
	find staticfiles/generated/ -type f | xargs -I {} rm {}
	@echo Done

migrate:
	$(MANAGE) migrate

migrations:
	$(MANAGE) makemigrations

eslint:
	node_modules/.bin/eslint .
