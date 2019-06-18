# Some simple testing tasks (sorry, UNIX only).

APP_NAME=flask_seed
PYTHON=venv/bin/python
PIP=venv/bin/pip
NOSE=venv/bin/nosetests
FLAKE=venv/bin/flake8
FLAGS=--with-coverage --cover-inclusive --cover-erase --cover-package=$(APP_NAME) --cover-min-percentage=80


env:
	python3 -m venv venv

dev: env
	$(PIP) install -e .[dev]

update: dev

install: env
	$(PIP) install -e .

run:
	FLASK_APP=$(APP_NAME) $(PYTHON) -m flask run

flake:
	$(FLAKE) $(APP_NAME) tests

test: flake
	$(NOSE) -s $(FLAGS)

vtest:
	$(NOSE) -s -v $(FLAGS)

testloop:
	while sleep 1; do $(NOSE) -s $(FLAGS); done

cov cover coverage:
	$(NOSE) -s --with-cover --cover-html --cover-html-dir ./coverage $(FLAGS)
	echo "open file://`pwd`/coverage/index.html"

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -f `find . -type f -name '@*' `
	rm -f `find . -type f -name '#*#' `
	rm -f `find . -type f -name '*.orig' `
	rm -f `find . -type f -name '*.rej' `
	rm -f .coverage
	rm -rf coverage
	rm -rf build

.PHONY: all env run test cov
