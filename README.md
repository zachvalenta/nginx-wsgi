# OVERVIEW

Most guides show how to set up servers on a Linux box (which makes sense) but macOS also works if you don't have a Linux box handy.

I've also posted this on [Stack Overflow](https://stackoverflow.com/a/54298517) in very condensed form.

# WHAT WE'LL DO

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

# THINGS WE'LL USE

* packages from Homebrew: `nginx` and `httpie`
* Python 3
* Makefile for our commands (to understand what all the commands do, just run `make help`)
* Flask for the webserver (our gunicorn and Nginx config should hold true for any WSGI server -> if you try this with Django, Pyramid, et al. and run into a problem, just open an issue and we'll figure it out!)

# STEP 1: NGINX ➡️ STATIC ASSETS

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

* download Nginx using Homebrew: `brew install nginx`
* start Nginx: `make ng-serve`
* hit Nginx: `make ng-hit` to hit our Nginx server, which will return its default welcome page

```sh
$ make ng-hit

http http://127.0.0.1:8080
HTTP/1.1 200 OK
# other output
<h1>Welcome to nginx!</h1>
```

* next, go update the Nginx configuration file (`/etc/nginx/nginx.conf`) to point at our repo's static assets

```diff
- location / {
+ location /static {
-   root   html;
+   root   path/to/your/nginx-wsgi;
-   index  index.html index.htm;
+   index  my-asset.html;
}
```

* reload Nginx so it knows about our updated config: `make ng-up`
* hit Nginx at the `static` route to validate it's serving our bespoke HTML 😄: `make ng-hit-static`

```sh
$ make ng-hit-static

http http://127.0.0.1:8080/static/
HTTP/1.1 200 OK
# other output
<h1>Nginx is serving my-asset.html!</h1>
```

# STEP 2: GUNICORN ➡️ FLASK

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

* [make a virtual environment and activate it](https://realpython.com/python-virtual-environments-a-primer/), then install the dependencies: `make pipin`
* start Flask: `make flask-serve`
* hit Flask on port 5000: `make flask-hit`

```sh
$ make flask-hit

http http://127.0.0.1:5000
<h1>Flask running!</h1>
```

* start gunicorn: `make guni-serve`
* hit gunicorn on port 8000 to validate that it passes the request to Flask on port 5000: `make guni-hit`

```diff
$ make guni-hit

http http://127.0.0.1:8000
<h1>Flask running!</h1>
```

# STEP 3: NGINX ➡️ GUNICORN

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
        XXXXXXXXXXXXXXXXX
        X                            
        X                            
        X                            
+----------------+                   
|    gunicorn    |                   
|                |                   
|                |             
+----------------+             
```

* update the Nginx conf again, this time to pass requests to gunicorn

```diff
+ location / {
+     proxy_pass http://127.0.0.1:8000;
+ }
```

* reload Nginx so it knows about our updated config: `make ng-up`
* hit Nginx: `make ng-hit` -> this time, instead of the default Nginx page, we'll see that the request passes from Nginx to gunicorn and finally to Flask

```sh
$ make ng-hit

http http://127.0.0.1:8080
HTTP/1.1 200 OK
# other output
<h1>Flask running!</h1>
```

---

Now, everything is wired together:

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

This guide is just to get you up-and-running. For more explanation, here are some articles that helped me from three guys named [Cheng](http://cheng.logdown.com/posts/2015/01/29/deploy-django-nginx-gunicorn-on-mac-osx-part-2), [Honza](http://honza.ca/2011/05/deploying-django-with-nginx-and-gunicorn), and [Patrick]( https://www.patricksoftwareblog.com/how-to-configure-nginx-for-a-flask-web-application/)
