<!-- mentee - Dzmitry Karneyenka -->

# Basics

## For Windows user

- to open PowerShell as Admin you can use the following command:
  `Start-Process powershell -Verb runAs`
- Use "Powershell" for changing [execution policy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6) to run the lab.ps1 [script](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6);
- Before that, You should disable restrictions of execution policy by using the following script in your "Powershell":
  `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser`

### Do not forget to grant [docker] permissions to access to a shared disk (e.g C)

# Dockerfile Instructions

- .dockerignore
- FROM - Sets the Base Image for subsequent instructions.
- RUN - execute any commands in a new layer on top of the current image and commit the results.
- CMD - provide defaults for an executing container.
- EXPOSE - informs Docker that the container listens on the specified network ports at runtime. NOTE: does not actually make ports accessible.
- ENV - sets environment variable.
- ADD - copies new files, directories or remote file to the container. Invalidates caches.
- COPY - copies new files or directories to the container.
- ENTRYPOINT - configures a container that will run as an executable.
- VOLUME - creates a mount point for externally mounted volumes or other containers.
- USER - sets the user name for following RUN / CMD / ENTRYPOINT commands.
- WORKDIR - sets the working directory.
- ARG - defines a build-time variable.
- ONBUILD - adds a trigger instruction when the image is used as the base for another build.
- STOPSIGNAL - sets the system call signal that will be sent to the container to exit.
- LABEL - apply key/value metadata to your images, containers, or daemons.

# Base commands

## Lifecycle

- docker images - shows all images;
- docker import - creates an image from a tarball;
- docker build - creates image from Dockerfile;
- docker commit - creates image from a container, pausing it temporarily if it is running;
- docker rmi - removes an image;
- docker load - loads an image from a tar archive as STDIN, including images and tags;
- docker save - saves an image to a tar archive stream to STDOUT with all parent layers, tags & versions;

## Info

- docker logs - shows logs of the container;
- docker history - shows history of image;
- docker tag - tags an image to a name (local or registry).

# Images

## Docker Image Naming Convention

REGISTRY[:PORT]/USER/REPO[:TAG]

## Docker inspect notes

- option --size (shorthand:-s) is ignored for images. Use -f={{.Size}} instead of --size

## Interactive mode with terminal bash

- docker run -i -t ubuntu /bin/bash === docker run -it ubuntu /bin/bash
- [httpd server config](https://www.phusionpassenger.com/library/install/apache/working_with_the_apache_config_file.html) may located in different places.
- docker run [OPTIONS] IMAGE [COMMAND][arg...] -
- docker ps -q = docker container ls -q - output onli IDs of containers (running| (-a|--all) all)
- docker images -q = docker image ls -q - output onli IDs of containers (running| (-a|--all) all)
- docker stop \$(docker ps -q -a) - stops all containers
- docker (image|container) prune - will remove no used (images|containers)
- docker run -d --restart on-failure:7 --name restarter_2 busybox sleep -3
- tool command [options] imagename cmd
- docker ps --format "table {{.Names}}\t{{.Image}}\t{{.ID}}\t{{.Ports}}" - pretty output
- docker container rm $(docker stop $(docker container ls -aq | grep 359)) - stop and delete the

## Tips and tricks

- WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile (ADD=COPY+extract-archives)
- --restart (no|on-failure:TimesNumber|always|unless-stopped)
- <https://stackoverflow.com/questions/41100333/difference-between-docker-run-user-and-group-add-parameters>
- docker tag <old_name> <new_name> && docker rmi <old_name> - use for rename already exist image;

### Non structured data

  <!-- --group-add: Add additional groups to run as -->
<!-- By default, the docker container process runs with the supplementary groups looked up for the specified user. If one wants to add more to that list of groups, then one can use this flag:

$ docker run --rm --group-add audio --group-add nogroup --group-add 777 busybox id
uid=0(root) gid=0(root) groups=10(wheel),29(audio),99(nogroup),777

WORKDIR
The default working directory for running binaries within a container is the root directory (/), but the developer can set a different default with the Dockerfile WORKDIR command. The operator can override this with:

-w="": Working directory inside the container

USER
root (id = 0) is the default user within a container. The image developer can create additional users. Those users are accessible by name. When passing a numeric ID, the user does not have to exist in the container.

The developer can set a default user to run the first process with the Dockerfile USER instruction. When starting a container, the operator can override the USER instruction by passing the -u option.

-u="", --user="": Sets the username or UID used and optionally the groupname or GID for the specified command.

The followings examples are all valid:-->
<!-- --user=[ user | user:group | uid | uid:gid | user:gid | uid:group ] -->

 <!-- ps -e -o comm,euid,fuid,ruid,suid,egid,fgid,gid,rgid,sgid,supgid | grep -E '^COMMAND|etcd' -->

### NGINX proxy configuration /etc/nginx/conf.d/default.conf

`upstream name { server tomcat:8080; server (tcp/ip|http://adress):8080; } server { listen 80; server_name localhost; location / { proxy_pass http://name/; } }`

### Useful links

- [Исповедь docker хейтера](https://habr.com/ru/post/467607/)
- [The difference between COPY and ADD (use with archives)](https://nickjanetakis.com/blog/docker-tip-2-the-difference-between-copy-and-add-in-a-dockerile)
- [Docker best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#add-or-copy)
- [Docker: Advanced multi-stage build patterns](https://medium.com/@tonistiigi/advanced-multi-stage-build-patterns-6f741b852fae)
- [Docker-compose. Как дождаться готовности контейнера](https://habr.com/ru/post/454552/)
- [Полное практическое руководство по Docker: с нуля до кластера на AWS](https://habr.com/ru/post/310460/#net)
