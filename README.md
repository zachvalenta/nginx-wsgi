# OVERVIEW

the most 😃 of hello worlds for Flask server setup

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
