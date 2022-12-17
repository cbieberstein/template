CODE_LOCATIONS=src
COVERAGE_LIMIT=100

# Create .env file if it does not already exist
ifeq (,$(wildcard .env))
  $(shell touch .env)
endif

OK_MSG = \x1b[32m ✔\x1b[0m
SHELL=bash

default: test

test: format lint mypy unittest
	@echo -e "All tests complete $(OK_MSG)"

format: .venv
	@echo -n "==> Checking that code is autoformatted with black..."
	@.venv/bin/black  --quiet --exclude '(.venv)' .
	@echo -e "$(OK_MSG)"

lint: .venv
	@echo -n "==> Running flake8..."
	@.venv/bin/flake8 --show-source --statistics $(CODE_LOCATIONS) --exclude=.venv
	@echo -e "$(OK_MSG)"

mypy: .venv
	@echo -n "==> Type checking..."
	@.venv/bin/mypy --no-error-summary $(CODE_LOCATIONS)
	@echo -e "$(OK_MSG)"

unittest: .venv
	@echo "==> Running tests..."
	@PYTHONPATH=. .venv/bin/pytest $(CODE_LOCATIONS) --cov-report term-missing:skip-covered --cov $(CODE_LOCATIONS) --no-cov-on-fail --cov-fail-under=$(COVERAGE_LIMIT) -W ignore::DeprecationWarning -vv


.venv: requirements.txt test-requirements.txt
	@echo "==> Creating virtualenv..."
	test -d .venv || python3 -m venv .venv
	# build wheels when developing locally
	test -z "$$CI" && .venv/bin/pip install -U pip wheel || true
	.venv/bin/pip install -r test-requirements.txt
	touch .venv

clean:
	rm -rf .venv
	rm -rf __pycache__
	rm -rf .mypy_cacne
	rm -rf .pytest_cache
