# logica-sandbox-infra
**NON-PRODUCTION USE ONLY**

Custom docker containers to be used with Logica Sandbox Community Edition.

*Only supports DSTU2 & R4 FHIR servers.*

## Support
[slack#team-lasershark](https://lighthouseva.slack.com/archives/C02KV82K48M)

- [Dumping Databases](docs/dumping-databases.md)

## Usage
Connect Docker to ghcr.io
```shell
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USER --password-stdin
```

Add internal hosts to /etc/hosts file
```/etc/hosts
127.0.0.1  keycloak
127.0.0.1  sandbox-mysql
127.0.0.1  sandbox-manager-api
127.0.0.1  sandbox
127.0.0.1  dstu2
127.0.0.1  stu3
127.0.0.1  r4
127.0.0.1  r5
127.0.0.1  static-content
```

```yml
# docker-compose.yml

version: "2.3"

volumes:
  logica-sandbox-volume:

services:

  keycloak:
    image: jboss/keycloak
    volumes:
      - "./realm_properties.json:/etc/security/realm_properties.json"
    ports:
      - "8080:8080"
    environment:
      - KEYCLOAK_USER=admin
      - KEYCLOAK_PASSWORD=admin
      - KEYCLOAK_IMPORT=/etc/security/realm_properties.json
      - DB_VENDOR=MYSQL
      - DB_ADDR=logica-mysql
      - DB_DATABASE=keycloak
      - DB_USER=keycloak
      - DB_PASSWORD=keycloak
    command: ["-Djboss.http.port=8080", "-Dkeycloak.profile.feature.upload_scripts=enabled"]
    depends_on:
      logica-mysql:
        condition: service_healthy
        
  logica-mysql:
    image: ghcr.io/rise8-us/logica-sandbox-infra/mysql:latest
    ports:
      - "3306:3306"
    volumes:
      - logica-sandbox-volume:/var/lib/mysql57
    environment:
      - MYSQL_PASSWORD=password
      - MYSQL_ROOT_PASSWORD=password
    healthcheck:
      test: ["CMD-SHELL", "/wait-for-db.sh"]
      interval: 2s
      timeout: 30s
      retries: 20

  sandbox:
    # This sandbox does not include auth.
    # It is recommended you use the following: logicahealth/sandbox:latest
    image: ghcr.io/rise8-us/logica-sandbox-infra/sandbox:latest
    ports:
      - "3000:3000"
      - "3001:3001"
      - "8060:8060"
    volumes:
      - ./infra/scripts/wait-for-api.sh:/wait-for-api.sh
    environment:
      - HOST_DOCKER_INTERNAL_IP=${HOST_DOCKER_INTERNAL_IP:-host.docker.internal}
      - AUTH_HOST=sandbox
      - AUTH_PORT=8060
      - DB_NAME=oic
      - DB_HOST=logica-mysql
      - DB_USER=root
      - DB_PASSWORD=password
      - SHOW_SQL=true
      - API_DSTU2_HOST=dstu2
      - API_DSTU2_PORT=8078
      - API_STU3_HOST=stu3
      - API_STU3_PORT=8079
      - API_R4_HOST=r4
      - API_R4_PORT=8070
      - PATIENT_PICKER_HOST=localhost
      - PATIENT_PICKER_PORT=8094
      - SANDMAN_API_HOST=sandbox-manager-api
      - SANDMAN_API_PORT=12000
      - SPRING_PROFILES_ACTIVE=users-keycloak,local
      - KEYCLOAK_REALM=Development
      - KEYCLOAK_AUTH_SERVER_URL=http://keycloak:8080/auth
      - KEYCLOAK_SSL_REQUIRED=none
      - KEYCLOAK_CREDENTIALS=593ada9c-b1dc-444f-a2e6-30cc4add8146
      - KEYCLOAK_LOGOUT_SUCCESS_URL=http://keycloak:8080/auth/realms/Development/protocol/openid-connect/logout?redirect_uri=http://localhost:3001
      - JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,address=5060,server=y,suspend=n"
    depends_on:
      logica-mysql:
        condition: service_healthy
        
  sandbox-manager-api:
    image: ghcr.io/rise8-us/logica-sandbox-infra/sandbox-manager-api:latest
    ports:
      - "12000:12000"
    environment:
      - DB_HOST=logica-mysql
      - DB_PORT=3306
      - DB_NAME=sandman
      - DB_USER=root
      - DB_PASSWORD=password
      - AUTH_HOST=sandbox
      - AUTH_PORT=8060
      - API_DSTU2_HOST=dstu2
      - API_STU3_HOST=stu3
      - API_R4_HOST=r4
      - API_R5_HOST=r5
    depends_on:
      logica-mysql:
        condition: service_healthy

  r4:
    image: ghcr.io/rise8-us/logica-sandbox-infra/api:latest
    ports:
      - "8070:8070"
    environment:
      - SPRING_PROFILES_ACTIVE=r4,multitenant
      - API_PORT=8070
      - SANDBOX_NAME=hspc10
      - SBMA_HOST=sandbox-manager-api
      - SBMA_PORT=12000
      - DB_HOST=logica-mysql
      - DB_PORT=3306
      - DB_USER=root
      - DB_PASSWORD=password
      - AUTH_HOST=sandbox
      - AUTH_PORT=8060
      - MANIFEST_OVERRIDE=false
    depends_on:
      logica-mysql:
        condition: service_healthy
```
