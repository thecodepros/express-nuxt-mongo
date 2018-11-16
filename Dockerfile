FROM node:9.10-alpine
RUN  apk update && apk add bash curl
ENV NUXT_HOST 0.0.0.0
RUN  curl -o- -L https://yarnpkg.com/install.sh | bash
RUN  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
RUN mkdir -p /app
COPY . /app
WORKDIR /app
RUN yarn install
RUN yarn build
CMD ["yarn", "start"]
