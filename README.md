# Weenect python-docker

This repositary provides the base python docker image for Weenect development environment.

You can find :

* a python 2.7 image : `weenect/python:2.7`
* a python stackless 2.7 image : `weenect/python:stackless2.7`

## Usage

The images are all build with the same structure.

Each image provides a folder tree for the project :

* /opt/dev : base project folder
* /opt/dev/conf : folder to put the configuration of the project
* /opt/dev/src : folder to put the sources of the project (use a volume when running a container)
* /opt/dev/venv : the virtual env (declared as a volume to cache all project dependency)

And a bash script as an entry point. This script does the following action :

* Enable the virtualenv
* Run the `python setup.py develop` command inside the `/opt/dev/src` folder
* Replace all `$VARIABLE` using environment variables in the `/opt/dev/conf/config_original.cfg` file and create a new file `/opt/dev/conf/config.cfg` (usefull when linking containers)
* Execute the file `/opt/dev/conf/packages` if it exists (for example to post install additional dependencies)
* Run the args of the entrypoint as a command (CMD of the extending Dockerfile)

## Example

A simple example of a Dockerfile extending one of these images :

```
FROM weenect/python:2.7

COPY myconfigfile.cfg /opt/dev/conf/config_original.cfg

EXPOSE 8080

CMD ["/opt/dev/venv/bin/my-project-command", "serve", "/opt/dev/conf/config.cfg"]
```
