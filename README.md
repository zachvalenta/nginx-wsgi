# OVERVIEW

* __what__: hello world for Python server setup on macOS 🍎
* __why__: most guides show setup on a Linux server (which makes sense) but macoS is useful for learning and local dev

📝 I'm using Flask here but the gunicorn and Nginx config holds true for any WSGI server

## what we'll do

```
+--------+       +----------+       +-------+
| Nginx  | ----> | gunicorn | ----> | Flask |
+--------+       +----------+       +-------+
```

## install

* install Nginx: `brew install nginx`
* create a virtual environment
* install dependencies: `make pipin`

## hit Flask

* run: `make rf`
* hit: `make hf`

## hit Flask through Gunicorn

* run gunicorn: `make rg`
* hit gunicorn: `make hg`
