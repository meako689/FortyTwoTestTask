#
# constants
#

SHELL=/bin/bash

BIND_TO=0.0.0.0
RUNSERVER_PORT=8000
SETTINGS=fortytwo.settings
TEST_SETTINGS=fortytwo.test_settings
FLAKE8_APP?=apps/
TEST_APP?=apps/
flake8=flake8

PYTHONPATH=$(CURDIR)

MANAGE_PREFIX= PYTHONPATH=$(PYTHONPATH) DJANGO_SETTINGS_MODULE=$(SETTINGS)
MANAGE_CMD=./manage.py
MANAGE= PYTHONPATH=$(PYTHONPATH) DJANGO_SETTINGS_MODULE=$(SETTINGS) $(MANAGE_CMD)
A?=


-include Makefile.def

#
# end of constants
#

#
# targets
#

.PHONY: run syncdb initproject dumpdata shell flake8 djangotest collectstatic clean manage migrate migrations

# Dev servers
run:
	@echo Starting backend server...
	$(MANAGE) runserver $(BIND_TO):$(RUNSERVER_PORT)

serve:
	@echo Starting frontend server...
	cd frontend && yarn serve

# Database
migrate:
	$(MANAGE) migrate --noinput

migrations:
	$(MANAGE) makemigrations

createcachetable:
	@echo Creating cache table
	$(MANAGE) createcachetable

initproject: migrate createcachetable

# Dev tools
shell:
	@echo Starting shell...
	$(MANAGE) shell

lint:
	./bin/check_noqa.sh
	./bin/check_layout.sh
	jinjalint templates
	$(flake8) apps
	black apps

djangotest:
	TESTING=1 PYTHONWARNINGS=ignore $(MANAGE_CMD) test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 --noinput

coverage:
	TESTING=1 PYTHONWARNINGS=ignore $(MANAGE_PREFIX) coverage run \
	    $(MANAGE_CMD) test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 && coverage html

report:
	${BROWSER} htmlcov/index.html

clean:
	@echo Cleaning up...
	find ./ -name '__pycache__' -print|xargs -I {} rm -r {}

test: lint djangotest

# Static files
build:
	@echo Building static files
	cd frontend && yarn && yarn build

collectstatic:
	@echo Collecting static files
	$(MANAGE) collectstatic --noinput

eslint:
	cd frontend && yarn lint src --fix
