help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "*flask-serve*: start server"
	@echo "*flask-hit*: hit server"
	@echo
	@echo "🦄 GUNICORN"
	@echo
	@echo "*guni-serve*: start server"
	@echo "*guni-hit*: hit server"
	@echo
	@echo "❎ NGINX"
	@echo
	@echo "*ng-serve*: start server"
	@echo "*ng-hit*: hit server"
	@echo "*ng-hit-static*: hit static assets"
	@echo "*ng-up*: reload configuration"
	@echo "*ng-quit*: quit"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "*pipin*: install dependencies from requirements.txt"
	@echo

flask-serve:
	python3 myproject.py

flask-hit:
	http http://127.0.0.1:5000

guni-serve:
	gunicorn --bind 0.0.0.0:8000 wsgi

guni-hit:
	http http://127.0.0.1:8000

ng-serve:
	nginx

ng-hit:
	http http://127.0.0.1:8080

ng-hit-static:
	http http://127.0.0.1:8080/static/

ng-up:
	nginx -s reload

ng-quit:
	nginx -s quit

pipin:
	pip install -r requirements.txt
