FROM ubuntu

RUN apt-get update && apt-get install -y git wget

# Set up the challenge file structure
RUN mkdir -p /letsencrypt/challenges/.well-known/acme-challenge
RUN echo "OK" > /letsencrypt/challenges/.well-known/acme-challenge/health

# Install and run the tool
RUN git clone https://github.com/letsencrypt/letsencrypt /letsencrypt/app
WORKDIR /letsencrypt/app
RUN ./letsencrypt-auto; exit 0
RUN ln -s /root/.local/share/letsencrypt/bin/letsencrypt /usr/local/bin/letsencrypt

# Add our script and run
ADD letsencrypt.sh /letsencrypt/
WORKDIR /letsencrypt
ENTRYPOINT ./letsencrypt.sh