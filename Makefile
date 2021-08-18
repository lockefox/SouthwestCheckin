all: init test black lint
init:
	pip install -r requirements.txt

test:
	pytest --cov=southwest/ --cov=checkin

lint:
	pycodestyle */*.py --show-source --ignore=E501

docker:
	docker build -t pyro2927/southwestcheckin .

release:
	docker push pyro2927/southwestcheckin

BLACK_ARGS = 
black:
	black ${BLACK_ARGS} southwest/ tests/

.PHONY: all
