FROM alpine:3.7

# Update
RUN apk add --update nodejs
RUN npm -g install npm@latest-2
RUN apk add bash
# RUN apt-get install -y curl \
#   && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
#   && apt-get install -y nodejs \
#   && curl -L https://www.npmjs.com/install.sh | sh \
COPY ./xterm /xterm

RUN cd /xterm && npm install

CMD ["node", "xterm/app.js"]

#WORKDIR /

# FROM python

# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# COPY requirements.txt /usr/src/app/
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . /usr/src/app

# COPY ./bootstarp.sh /bootstarp.sh
# RUN chmod +x /bootstarp.sh
# EXPOSE  3000 4000 
# CMD /bootstarp.sh
# ENTRYPOINT ["/bin/sh","python -m http.server 8090"]
#CMD python -m http.server 9000