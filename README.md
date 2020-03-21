# Neuro-Lab

A containerized environment for running biophysical cell
simulations on.

Includes the following dependencies:

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

## Things you might want to do

*Start a shell* if you just want to get a shell running
inside the container to try out a few commands:

`docker-compose run --rm lab bash`