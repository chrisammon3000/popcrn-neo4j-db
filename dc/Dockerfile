FROM python:3.8.1-slim-buster
# LABEL Name=combatb-db-dc Maintainer="thoba@sanbi.ac.za"

RUN apt-get update && apt-get install -y \ 
    wget \
    && mkdir -p /import

# Download data from Google Sheets as .csv
RUN cd import \ 
    && wget -O profile.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=1801331028 \
    && echo "Downloading from Google Sheets: profile.csv ..." \
    && wget -O project.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=276470380 \
    && echo "Downloading from Google Sheets: project.csv ..." \
    && wget -O media.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=0 \
    && echo "Downloading from Google Sheets: media.csv ..."

VOLUME /import

RUN echo "Downloads complete." \
    && pwd

CMD ["bash"]