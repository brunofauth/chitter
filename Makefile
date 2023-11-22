PACKAGE_NAME=chitter

.PHONY: install build publish docs lint test edit

install:
	poetry install

build:
	make docs
	poetry build --format=sdist

publish:
	make dist
	poetry run twine upload --repository pypi --skip-existing --verbose dist/*

docs:
	cd docs && make html

lint:
	poetry run pylint -E $(PACKAGE_NAME)

test:
	poetry run pytest
	make lint

edit:
	fish -c 'poetry run vim -p (find $(PACKAGE_NAME) -type f -name \*.py)'

# bootstrap-docs:
# 	mkdir docs
# 	poetry run sphinx-apidoc -o docs chitter
