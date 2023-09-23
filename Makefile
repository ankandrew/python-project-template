# Directories
SRC_DIRS := src/ test/

# Tasks
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

.PHONY: linter
linter:
	@echo "==> Running pylint..."
	@poetry run pylint $(SRC_DIRS)

.PHONY: tests
tests:
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


run_local_checks: format linter tests
