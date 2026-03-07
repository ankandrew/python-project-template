<!-- TOC -->
  * [Development](#development)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
<!-- TOC -->

# Python Project Template

![example workflow](https://github.com/ankandrew/python-project-template/actions/workflows/ci.yaml/badge.svg)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Pylint](https://img.shields.io/badge/linting-pylint-yellowgreen)](https://github.com/pylint-dev/pylint)
[![Checked with mypy](http://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)

A modern Python project template with `uv`, Ruff, Pylint, mypy, pytest, and GitHub Actions preconfigured.

## Development

A quick setup for local development using [uv](https://github.com/astral-sh/uv).

### Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/installation/)

### Installation

```bash
# Install Python if needed
uv python install 3.10

# Install the project and development dependencies
make install

# Run checks
make lint
make test
```

Replace the remaining `TODO` placeholders with project-specific values before publishing.
