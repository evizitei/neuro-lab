# Neuro-Lab

A containerized environment for running biophysical cell
simulations on.

Includes the following dependencies:
  * ANACONDA (via miniconda: https://docs.conda.io/en/latest/miniconda.html)

## Background information

This project depends on docker for containerization (https://docs.docker.com/).

And docker-compose for orchestration https://docs.docker.com/compose/

You need to have docker on your machine before you try
anything else in this project:

https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc

## Getting Started

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