### Running PostgreSQL

Start the PostgreSQL container:

`docker compose up -d`

PostgreSQL will be available at:
Host: `localhost`  
Port: `5432`  
Database: `playground`  
User: `postgres`  
Password: `postgres`

---

### Stopping and Resetting

Stop the container:

`docker compose down`

To completely remove the database data (including volumes):

`docker compose down -v`

---

### Useful Commands

Access PostgreSQL CLI inside the container:

`docker exec -it postgres_playground psql -U postgres`

List Docker volumes:

`docker volume ls`
