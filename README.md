# OVERVIEW

* __what__: hello world for Python server setup on macOS 🍎
* __why__: most guides show setup on a Linux server (which makes sense) but macoS is useful for learning and for local dev

## what we'll do

```language
                +---------------+
                |    Nginx      |
                |               |
                |               |
                +---------------+
                       X
                       X
                       X
                       X
        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        X                            X
        X                            X
        X                            X
+----------------+                   X
|    gunicorn    |                   X
|                |                   X
|                |             +----------------+
+----------------+             |    static      |
        X                      |    assets      |
        X                      |                |
+----------------+             +----------------+
|    Flask       |
|                |
|                |
+----------------+
```

## things we'll use

* packages from Homebrew: `nginx` and `httpie`
* Python 3
* Makefile for our commands (to understand what all the commands do, just run `make help`)
* Flask for the webserver (our gunicorn and Nginx config should hold true for any WSGI server -> if you try this with Django, Tornado, et al. and run into a problem, just open an issue and we'll figure it out!)

## step 1: Nginx ➡️ static assets

```language
                +---------------+
                |    Nginx      |
                |               |
                |               |
                +---------------+
                       X
                       X
                       X
                       X
                       XXXXXXXXXXXXXXX
                                     X
                                     X
                                     X
                                     X
                                     X
                                     X
                               +----------------+
                               |    static      |
                               |    assets      |
                               |                |
                               +----------------+

```

* start Nginx: `make ns`
* hit Nginx: `make nh` to view the default Nginx welcome page
* next, go update the Nginx conf (`/etc/nginx/nginx.conf`) by changeing `root` to point to our repo's static assets
```diff
```conf
location / {
-   root   html;
+   root   path/to/nginx-gunicorn-flask/assets;
-   index  index.html index.htm;
+   index  my-asset.html;
}
```
* reload Nginx so it knows about our updated config: `make nr`
* hit Nginx again to validate it's serving our bespoke HTML 😄: `make nh`

## step 2: gunicorn ➡️ Flask

```language
+----------------+                   
|    gunicorn    |                   
|                |                   
|                |             
+----------------+             
        X                      
        X                      
+----------------+             
|    Flask       |
|                |
|                |
+----------------+
```

* install the Python requirements: `make pipin`
* start Flask: `make fs`
* hit Flask: `make fh`
* start gunicorn: `make gs`
* ok, now let's validate gunicorn is passing requests to Flask: `make gh`
