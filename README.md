# OVERVIEW

* __what__: hello world for Python server setup on macOS 🍎
* __why__: most guides show setup on a Linux server (which makes sense) but macoS is useful for learning and for local dev

📝 I'm using Flask here but the gunicorn and Nginx config holds true for any WSGI server

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

## first step: Nginx ➡️ static assets

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
+   root   path/to/nginx-gunicorn-flask;
-   index  index.html index.htm;
+   index  my-asset.html;
}
```
* tell Nginx about updated config: `nginx -s reload`
* validate Nginx serving our static assets: hit `localhost:8080` to view our, ahem, bespoke html 😄

