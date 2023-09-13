# Directories
SRC_DIRS := src/ test/

# Tasks
black:
	@echo "==> Formatting code..."
	poetry run black $(SRC_DIRS)

check_black:
	@echo "==> Checking format..."
	poetry run black --check --diff $(SRC_DIRS)

isort:
	@echo "==> Running isort..."
	poetry run isort $(SRC_DIRS)

check_isort:
	@echo "==> Checking isort..."
	poetry run isort --check --diff $(SRC_DIRS)

pylint:
	@echo "==> Running pylint..."
	poetry run pylint $(SRC_DIRS)

tests:
	@echo "==> Running tests..."
	poetry run pytest

clean_caches:
	@echo "==> Cleaning caches..."
	rm -rf .mypy_cache .pytest_cache
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.pyc" -exec rm -f {} +


run_local_checks: black isort pylint tests

.PHONY: black check_black isort check_isort pylint tests clean_caches
