# Directories
SRC_DIRS := project_name/ test/  # FIXME

# Tasks
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  help             : Show this help message"
	@echo "  format           : Format code using Ruff format"
	@echo "  check_format     : Check code formatting with Ruff format"
	@echo "  ruff             : Run Ruff linter"
	@echo "  mypy             : Run MyPy static type checker"
	@echo "  lint             : Run Ruff linter and Mypy for static code analysis"
	@echo "  test             : Run tests using pytest"
	@echo "  clean            : Clean up caches and build artifacts"
	@echo "  checks           : Run format, lint, and test"

.PHONY: format
format:
	@echo "==> Sorting imports..."
	@# Currently, the Ruff formatter does not sort imports, see https://docs.astral.sh/ruff/formatter/#sorting-imports
	@poetry run ruff check --select I --fix $(SRC_DIRS)
	@echo "=====> Formatting code..."
	@poetry run ruff format $(SRC_DIRS)

.PHONY: check_format
check_format:
	@echo "=====> Checking format..."
	@poetry run ruff format --check --diff $(SRC_DIRS)
	@echo "=====> Checking imports are sorted..."
	@poetry run ruff check --select I --exit-non-zero-on-fix $(SRC_DIRS)

.PHONY: ruff
ruff:
	@echo "=====> Running Ruff..."
	@poetry run ruff check $(SRC_PATHS)

.PHONY: mypy
mypy:
	@echo "=====> Running Mypy..."
	@poetry run mypy $(SRC_PATHS)

.PHONY: lint
lint: ruff mypy

.PHONY: test
test:
	@echo "=====> Running tests..."
	@poetry run pytest

.PHONY: clean
clean:
	@echo "=====> Cleaning caches..."
	@poetry run ruff clean
	@rm -rf .cache .pytest_cache .mypy_cache build dist *.egg-info

checks: format lint test
