FROM postgres:latest
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
# ADD setup-database.sh /docker-entrypoint-initdb.d/
# RUN chmod 755 /docker-entrypoint-initdb.d/setup-database.sh
# ADD setupRemoteConnections.sh /docker-entrypoint-initdb.d/setupRemoteConnections.sh
# RUN chmod 755 /docker-entrypoint-initdb.d/setupRemoteConnections.sh
RUN useradd -ms /bin/bash kiwiprints
RUN echo "kiwiprints:kiwiprints" | chpasswd # change default docker password
ADD setup-kiwiprints.sql /docker-entrypoint-initdb.d/
# ADD runKiwiScripts.sh /docker-entrypoint-initdb.d/
# RUN chmod 755 /docker-entrypoint-initdb.d/runKiwiScripts.sh
