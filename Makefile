# Dev servers
MANAGE=python manage.py
TEST_SETTINGS=fortytwo.test_settings
TEST_APP=apps/

run:
	@echo Starting backend server...
	$(MANAGE) runserver 0.0.0.0:8080

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
	./scripts/check_noqa.sh
	./scripts/check_layout.sh
	flake8 apps
	black apps

djangotest:
	$(MANAGE) test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 --noinput

coverage:
	python coverage run $(MANAGE_CMD) test --settings=$(TEST_SETTINGS) $(TEST_APP) -v 2 && coverage html

report:
	${BROWSER} htmlcov/index.html

test: lint djangotest

collectstatic:
	@echo Collecting static files
	$(MANAGE) collectstatic --noinput

eslint:
	cd frontend && yarn lint src --fix

serve:
	@echo Starting frontend server...
	cd frontend && yarn serve

build:
	@echo Building static files
	cd frontend && yarn && yarn build
