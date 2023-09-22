# Directories
SRC_DIRS := src/ test/

# Tasks
format:
	@echo "==> Formatting code..."
	poetry run black $(SRC_DIRS)

check_format:
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


run_local_checks: format isort pylint tests

.PHONY: format check_format isort check_isort pylint tests clean_caches
