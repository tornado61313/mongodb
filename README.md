# IDASM101 - Big data ingénierie et traitement
## TP - MongoDB

### Getting started
#### Requirements
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Docker](https://docs.docker.com/get-docker/)

#### Setup
1) Run the command `git clone https://gitlab.unamur.be/info-big-data/idasm101/tp-mongodb.git` to download the repository.
2) Launch Docker Desktop
3) Open a terminal in the repository's root folder and and run `docker compose run -d` command.
4) Open your browser at http://localhost:8081/
5) Enter the default credentials `admin` and `pass`
7) Run the `docker exec -it tp-mongodb-mongo-1 mongosh --username root --authenticationDatabase admin` command to open a mango shell inside the container.
8) Type the root user password `example`
9) Have fun with mongoDB! - Query examples are provided in the `sheet_cheat` folder.

### Database reset
If you want to reset the database. You can simply delete the runnning containers and volumes. To do so, open Docker compose and click on the trashbin icon to delete the corresponding container. Then to delete the volumes go to the Volume tab and click on the trashbin icon. Open a terminal in the repository's root folder and run `docker compose run -d` to recreate everything.

### Links
- https://www.mongodb.com/developer/products/mongodb/cheat-sheet/
- https://www.mongodb.com/docs/
