# Build Neo4j image
# Run script that pipes in command to create a create_db.cyp file in ./neo4j:/var/lib/neo4j/import
# Run cypher-shell script that loads the data

FROM neo4j:3.5.14

RUN docker exec -it testneo4j bash