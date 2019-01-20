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

📝 I'm using Flask here but the gunicorn and Nginx config should hold true for any WSGI server -> if you try this with Django, Tornado, et al. and run into problems open an issue and we'll figure it out!

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

* install Nginx: `brew install nginx`
* start Nginx: `nginx`
* validate Nginx running: hit `localhost:8080` to view the default Nginx welcome page
* clone the repo
* update Nginx conf (`/etc/nginx/nginx.conf`): change `root` to point to repo's static assets
```diff
```conf
location / {
-   root   html;
+   root   path/to/nginx-gunicorn-flask/assets;
-   index  index.html index.htm;
+   index  my-asset.html;
}
```
* tell Nginx about updated config: `nginx -s reload`
* validate Nginx serving our static assets: hit `localhost:8080` to view the, ahem, bespoke html 😄

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

* go into the repo and install the requirements: `make pipin` --> 📝 see more commands via `make help`
* run Flask: `make rf`
* validate Flask running: hit `localhost:5000`
* run gunicorn: `make rg`
* validate gunicorn passing requests to Flask: hit `localhost:8000`
