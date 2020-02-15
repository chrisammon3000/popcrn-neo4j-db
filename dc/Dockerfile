FROM python:3.8-slim-buster
# LABEL Name=combatb-db-dc Maintainer="thoba@sanbi.ac.za"

RUN apk update \
    && apk upgrade \
    && mkdir -p /data \
    && apk add --no-cache wget \
    # Install python packages

# Download data from Google Sheets as .csv
RUN wget -O profile.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=1801331028 \
    && echo "Downloading from Google Sheets: profile.csv" \
    && wget -O project.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=276470380 \
    && echo "Downloading from Google Sheets: project.csv" \
    && wget -O media.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=0 \
    && echo "Downloading from Google Sheets: media.csv" \
    && cp *.csv data/ \
    && rm *.csv

# RUN python import_data.py

VOLUME /data
