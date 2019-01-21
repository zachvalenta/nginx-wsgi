help:
	@echo
	@echo "flask-serve:     Flask - start server"
	@echo "flask-hit:  		Flask - hit server"
	@echo
	@echo "guni-serve:		Gunicorn - start server"
	@echo "guni-hit:      	Gunicorn - hit server"
	@echo
	@echo "ng-serve:      	Nginx - start server"
	@echo "ng-hit:      	Nginx - hit server"
	@echo "ng-hit-static:   Nginx - hit static assets"
	@echo "ng-up:      		Nginx - reload configuration"
	@echo "ng-quit:      	Nginx - quit"
	@echo
	@echo "pipin:   		install dependencies"
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
