# Built referencing Combat-TB-NeoDB
# Build Neo4j image
# Run script that pipes in command to create a create_db.cyp file in ./neo4j:/var/lib/neo4j/import
# Run cypher-shell script that loads the data

FROM neo4j:3.5.14
LABEL Maintainer="thoba@sanbi.ac.za"

RUN apt-get update \
    && apt-get install -y wget openssl apt-utils zip unzip \
    && mkdir -p certificates/revoked \
    && mkdir -p certificates/trusted

# Retrieve algorithms & APOCs
# RUN wget "${NEO4J_CONTRIB}/neo4j-graph-algorithms/releases/download/3.5.4.0/graph-algorithms-algo-3.5.4.0.jar" -P plugins/ \
#     && wget "${NEO4J_CONTRIB}/neo4j-apoc-procedures/releases/download/3.5.0.4/apoc-3.5.0.4-all.jar" -P plugins/ 

# COPY dc/plugins/* plugins/
# COPY dc/*.html /

ENV NEO4J_AUTH=none \
    NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
