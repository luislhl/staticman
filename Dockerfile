FROM node:8.11.3

ARG RSA_PRIVATE_KEY
ENV RSA_PRIVATE_KEY="${RSA_PRIVATE_KEY}"

ARG GITLAB_TOKEN
ENV GITLAB_TOKEN="${GITLAB_TOKEN}"

ARG GITHUB_TOKEN
ENV GITHUB_TOKEN="${GITHUB_TOKEN}"

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
COPY package.json /app/
RUN npm install

# Bundle app source
COPY . /app

EXPOSE 3000
CMD [ "npm", "start" ]