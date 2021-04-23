# Dev servers
CMD_PREFIX=./docker/compose.sh
MANAGE=$(CMD_PREFIX) run backend python manage.py
TEST_SETTINGS=fortytwo.test_settings
TEST_APP=apps/

run:
	@echo Starting http://127.0.0.1:8000
	$(CMD_PREFIX) up

build:
	$(CMD_PREFIX) build

# Database
migrate:
	$(MANAGE) migrate --noinput

migrations:
	$(MANAGE) makemigrations

createcachetable:
	@echo Creating cache table
	$(MANAGE) createcachetable

initproject: migrate createcachetable

# Testing
shell:
	@echo Starting shell...
	$(MANAGE) shell

lint:
	$(CMD_PREFIX) run backend sh -c "black apps && flake8 apps"

djangotest:
	$(MANAGE) test --settings=$(TEST_SETTINGS) $(TEST_APP) --noinput

coverage:
	coverage run manage.py test --settings=$(TEST_SETTINGS) $(TEST_APP) && coverage report -i

test: lint djangotest

collectstatic:
	@echo Collecting static files
	$(MANAGE) collectstatic --noinput

eslint:
	$(CMD_PREFIX) run frontend sh -c "cd frontend && yarn lint src --fix"
