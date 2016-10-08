# Docker-Ruby-CGI
Docker Image for a Ruby CGI Project

## Docker pull command
```bash
docker pull hiro511/ruby-cgi
```

## Start a Ruby CGI project simply
```bash
docker run -d -p 80:80 --name my-running-app -v my-project:/usr/local/apache2/htdocs hiro511/ruby-cgi
```


## Create a `Dockerfile` in your Ruby CGI project

```dockerfile
FROM hiro511/ruby-cgi

COPY ./public-html/ /usr/local/apache2/htdocs/

```
Then, run the commands to build and run the Docker image:

```bash
docker build -t my-ruby-cgi .
docker run -d -p 80:80 --name my-running-app my-ruby-cgi

```

## Without a `Dockerfile`
If you don't want to include a `Dockerfile` in your project, It is sufficient to do the folloing:

```bash
docker run -itd -p 80:80 --name my-running-app -v "$PWD":/usr/local/apache2/htdocs/ hiro511/ruby-cgi:latest

```
