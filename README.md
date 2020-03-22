# Neuro-Lab

A containerized environment for running biophysical cell
simulations on.

Includes the following dependencies:
  * ANACONDA (via miniconda: https://docs.conda.io/en/latest/miniconda.html)
  * a conda environment ("lab") with standard data analysis packages installed (see environment.yml)

## Background information

This project depends on docker for containerization (https://docs.docker.com/).

And docker-compose for orchestration https://docs.docker.com/compose/

You need to have docker on your machine before you try
anything else in this project:

https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc

## Getting Started for USAGE

If you want to use the neuro-lab container to run experiments
on, you don't need to build it.  You just need to fetch
it from docker hub.

https://hub.docker.com/repository/docker/evizitei/neuro-lab

 The easiest way to do this is with docker-compose,
see an example use case in the "example_of_use" directory.

In the "example_of_use" directory
you can see how a remote collaborator would use this system.
They have a docker-compose file, but it just references the
remote image. Let's try it:

`cd example_of_use`
`docker-compose up`

You'll get log output that says something like this:

```bash
lab_1  |     To access the notebook, open this file in a browser:
lab_1  |         file:///home/ubuntu/.local/share/jupyter/runtime/nbserver-17-open.html
lab_1  |     Or copy and paste one of these URLs:
lab_1  |         http://18689d0cfd97:8888/?token=81afae9be659e8a574ce68b6f63016fe2c9e1fad235abc3a
lab_1  |      or http://127.0.0.1:8888/?token=81afae9be659e8a574ce68b6f63016fe2c9e1fad235abc3a
```

Because the docker-compose file binds the port 8888 in the container
to the localhost port, you can use
http://localhost:8888/?token=[the-actual-token] (or 127.0.0.1
instead of localhost) to see the notebook server.
You can also see that it's making the "notebooks" subfolder
available to the jupyter server because that's been
mounted as a volume inside the container by the docker-compose file.  Try running the iris tutorial notebook!

## Getting Started for DEVELOPMENT

If you have docker already, you need to build your containers
on your machine.  Run this from the root directory of this project:

`docker-compose build`

If you need a new dependency for your python environment,
make sure to add it to the "lab_env.yml" statement in
the docker file and run your build again.

Running install from within the shell will change your container
filesystem, but not the image, as soon as you restart your
new dependency will be gone.  Building it into the image
makes sure it's there everytime you start a new container.

## Things you might want to do

*Start a shell* if you just want to get a shell running
inside the container to try out a few commands:

`docker-compose run --rm lab bash`

*Start the notebook server* Most folks will want to get working
with jupyter, that's the most common usecase,
and also the default command:

`docker-compose up` will start the notebook server
with whatever notebooks you have in your "notebooks" directory as

## Improving the container

When sufficient changes have been made to cut a new version:

`docker build -t evizitei/neuro-lab .`

And then to publish to docker hub:

`docker push evizitei/neuro-lab`