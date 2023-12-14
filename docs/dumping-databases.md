# Dumping Databases

## Usage
This is used for creating initial dumps of the databases for the sandbox.

```shell
mysqldump -u root -ppassword -h 127.0.0.1 -P 3306 --column-statistics=0 --databases hspc_8_testy > ./schema-scripts/hspc_8_testy.sql
mysqldump -u root -ppassword -h 127.0.0.1 -P 3306 --column-statistics=0 --databases oic > ./schema-scripts/oic.sql
mysqldump -u root -ppassword -h 127.0.0.1 -P 3306 --column-statistics=0 --databases sandman > ./schema-scripts/sandman.sql
```
