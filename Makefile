help:
	@echo
	@echo "hf:      hit Flask server"
	@echo "hg:      git Gunicorn server"
	@echo "pipin:   install dependencies"
	@echo "rf:      run Flask"
	@echo "rg:      run Gunicorn"
	@echo

hf:
	http http://127.0.0.1:5000

hg:
	http http://127.0.0.1:8000

pipin:
	pip install -r requirements.txt

rf:
	python3 myproject.py

rg:
	gunicorn --bind 0.0.0.0:8000 wsgi
