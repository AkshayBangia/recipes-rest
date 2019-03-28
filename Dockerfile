#FROM continuumio/miniconda3
FROM python:3.7-alpine
MAINTAINER Akshay Bangia

# Setting the entrypoint to use bash
#ENTRYPOINT [ "/bin/bash", "-c" ]

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
# RUN ["conda", "env", "create"]
# SHELL [ "/bin/bash", "-c" ]
#RUN conda env create -f /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user