help:
	@echo "rf:  run Flask"
	@echo "hf:  hit Flask server"
	@echo "rg:  run Gunicorn"
	@echo "hg:  git Gunicorn server"

rf:
	python3 myproject.py

hf:
	qiu -po 5000

rg:
	gunicorn --bind 0.0.0.0:8000 wsgi

hg:
	qiu -po 8000
