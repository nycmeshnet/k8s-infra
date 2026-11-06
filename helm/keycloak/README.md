# Keycloak

```
pub create ns keycloak
helmpub upgrade --install keycloak keycloak -f keycloak/secrets.yaml
```


## Postgres

Login to postgres and run these commands:

```
CREATE USER keycloak WITH ENCRYPTED PASSWORD '<secure_password>';
CREATE DATABASE keycloak OWNER keycloak;
```
