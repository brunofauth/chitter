PACKAGE_NAME=iterchain

.PHONY: install dist publish docs lint lint-html tests

install:
	poetry install

dist:
	make docs
	poetry build --format=sdist

publish:
	make dist
	poetry run twine upload --repository pypi --skip-existing --verbose dist/*

docs:
	cd docs && make html

lint:
	poetry run pylint $(PACKAGE_NAME)

test:
	poetry run pytest
	make lint
