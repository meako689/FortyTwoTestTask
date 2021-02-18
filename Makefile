# Dev servers
RUN=./docker/compose.sh
MANAGE=$(RUN) exec backend python manage.py
TEST_SETTINGS=fortytwo.test_settings
TEST_APP=apps/

debug:
	$(RUN) exec backend touch test.file

run:
	@echo Starting http://127.0.0.1:8000
	$(RUN) up

build:
	$(RUN) build

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
	$(RUN) exec ./scripts/lint.sh

djangotest:
	$(MANAGE) test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 --noinput

coverage:
	$(RUN) exec backend python coverage run manage.py test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 && coverage html

report:
	${BROWSER} htmlcov/index.html

test: lint djangotest

collectstatic:
	@echo Collecting static files
	$(MANAGE) collectstatic --noinput

eslint:
	$(RUN) exec frontend sh -c "cd frontend && yarn lint src --fix"
