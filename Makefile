default: run

install:
	poetry install --no-root

run:
	poetry run python -m repro.main
