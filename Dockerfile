# Build Neo4j image
# Run script that pipes in command to create a create_db.cyp file in ./neo4j:/var/lib/neo4j/import
# Run cypher-shell script that loads the data

FROM neo4j:3.5.14 

RUN apt-get update \
    && apt-get install -y wget

# Download data from Google Sheets as .csv
RUN wget -O profile.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=1801331028 \
    && echo "Downloading from Google Sheets: profile.csv" \
    && wget -O project.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=276470380 \
    && echo "Downloading from Google Sheets: project.csv" \
    && wget -O media.csv https://docs.google.com/spreadsheets/d/1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0/export?format=csv&id=1LpluS0A4aPHeftGW3R6tyCRHqc3czRVxzogXrWMI3o0&gid=0 \
    && echo "Downloading from Google Sheets: media.csv" \
    && cp *.csv data/ \
    && rm *.csv