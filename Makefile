help:
	@echo
	@echo "fs:      Flask - start"
	@echo "fh:      Flask - hit server"
	@echo
	@echo "gr:      Gunicorn - start"
	@echo "gh:      Gunicorn - hit server"
	@echo
	@echo "ns:      Nginx - start"
	@echo "nh:      Nginx - hit server"
	@echo "nr:      Nginx - reload configuration"
	@echo "nq:      Nginx - quit"
	@echo
	@echo "pipin:   install dependencies"
	@echo

fs:
	python3 myproject.py

fh:
	http http://127.0.0.1:5000

gs:
	gunicorn --bind 0.0.0.0:8000 wsgi

gh:
	http http://127.0.0.1:8000

ns:
	nginx

nh:
	http http://127.0.0.1:8080

nr:
	nginx -s reload

nq:
	nginx -s quit

pipin:
	pip install -r requirements.txt
