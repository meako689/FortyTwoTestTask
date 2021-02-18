# Dev servers
EXEC=./docker/exec.sh
MANAGE=$(EXEC) backend python manage.py
TEST_SETTINGS=fortytwo.test_settings
TEST_APP=apps/

debug:
	$(EXEC) backend touch test.file

run:
	@echo Starting http://127.0.0.1:8000
	./docker/compose.sh up

build:
	./docker/componse.sh build

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
	$(EXEC) backend ./scripts/lint.sh

djangotest:
	$(MANAGE) test --settings=$(TEST_SETTINGS) $(TEST_APP) --noinput

coverage:
	coverage run manage.py test --settings=$(TEST_SETTINGS) $(TEST_APP) && coverage report -i

test: lint djangotest

collectstatic:
	@echo Collecting static files
	$(MANAGE) collectstatic --noinput

eslint:
	$(EXEC) frontend sh -c "cd frontend && yarn lint src --fix"
