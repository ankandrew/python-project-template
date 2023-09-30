# Directories
SRC_DIRS := src/ test/  # FIXME

# Tasks
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  format           : Format code using Black and isort"
	@echo "  check_format     : Check code formatting with Black and isort"
	@echo "  lint             : Run pylint and Mypy for static code analysis"
	@echo "  test             : Run tests using pytest"
	@echo "  clean            : Clean up caches and build artifacts"
	@echo "  run_local_checks : Run format, lint, and test"
	@echo "  help             : Show this help message"

.PHONY: format
format:
	@echo "==> Formatting code..."
	@poetry run black $(SRC_DIRS)
	@echo "==> Sorting imports..."
	@poetry run isort $(SRC_DIRS)

.PHONY: check_format
check_format:
	@echo "==> Checking format..."
	@poetry run black --check --diff $(SRC_DIRS)
	@echo "==> Checking isort..."
	@poetry run isort --check --diff $(SRC_DIRS)

.PHONY: lint
lint:
	@echo "==> Running pylint..."
	@poetry run pylint $(SRC_DIRS)
	@echo "==> Running Mypy..."
	@poetry run mypy $(SRC_DIRS)

.PHONY: test
test:
	@echo "==> Running tests..."
	@poetry run pytest

.PHONY: clean
clean:
	@echo "==> Cleaning caches..."
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info

run_local_checks: format lint test
