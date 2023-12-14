FROM node:16.15.1-alpine as builder
RUN apk add --no-cache git

RUN git clone https://bitbucket.org/hspconsortium/ehr-app.git
RUN git clone https://bitbucket.org/hspconsortium/sandbox-manager-v3.git
RUN npm install react-scripts@1.1.1 --location=global

WORKDIR /ehr-app
RUN npm install
RUN npm run build

WORKDIR /sandbox-manager-v3
ADD ./sandbox-manager/xsettings.local.json ./sandbox-manager-v3/projects/sandbox-manager/src/assets/data/xsettings.local.json
RUN npm install --force
RUN npm run sandbox-manager:build:local

FROM node:16.15.1-alpine

RUN npm install serve@9.6.0 -g

ADD start.sh /start.sh

COPY --from=builder /ehr-app/build /ehr-app
COPY --from=builder /sandbox-manager-v3/projects/sandbox-manager/build/www /sandbox-manager

EXPOSE 3001
EXPOSE 3000

CMD ["sh", "./start.sh"]
