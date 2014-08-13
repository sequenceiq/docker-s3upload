FROM dockerfile/java

MAINTAINER SequenceIq

# install the ec2 cli tools
RUN apt-get update
RUN apt-get -y install awscli

ADD snapshot.sh /etc/snapshot.sh
RUN chmod +x /etc/snapshot.sh

# install liquibase
ADD http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.2.2-bin.tar.gz/download /tmp/liquibase-3.2.2-bin.tar.gz

# Create a directory for liquibase
RUN mkdir /usr/share/liquibase

# Unpack the distribution
RUN tar -xzf /tmp/liquibase-3.2.2-bin.tar.gz -C /usr/share/liquibase
RUN chmod +x /usr/share/liquibase/liquibase

# Symlink to liquibase to be on the path
RUN ln -s /usr/share/liquibase/liquibase /usr/local/bin/

# Get the postgres JDBC driver from http://jdbc.postgresql.org/download.html
ADD http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar /usr/share/jdbc_drivers/
RUN ln -s /usr/share/jdbc_drivers/postgresql-9.3-1102.jdbc41.jar /usr/local/bin/

# Add configuration script
ADD setup_liquibase.sh /setup_liquibase.sh
RUN chmod +x /setup_liquibase.sh


ENTRYPOINT ["/etc/snapshot.sh"]
