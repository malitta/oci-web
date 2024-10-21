## OCI management application

This repo contains the code for the OCI API.

## Contributing

### Dev environment setup

Make sure you have Docker and Docker Compose installed on your machine. If not, you can download Docker [here](https://www.docker.com/get-started) and Docker Compose [here](https://docs.docker.com/compose/install/).

Follow these steps to set up the development environment after cloning the repository:

1. Duplicate `.env.example` and customize it as `.env`.
    - The application uses port 80 by default. If you want to use a different port, please update the value of `APP_PORT` in the .env file.
2. Run `make up` to initialize the Docker containers.
    - This will create the following services using docker-compose:
        - Webserver
        - MySQL database
        - Laravel queue listener for handling asynchronous jobs
        - Vite worker for building CSS & JS assets and enabling hot-reload

Once you have completed the above steps, you will be able to access the website through `http://localhost`.

### Common tasks

#### Running Artisan commands

To run artisan commands, make sure to connect to the web container first by running `make ssh-web`.

Once inside the web container, you can run artisan commands like `php artisan migrate` or `php artisan db:seed`.

#### Connecting to the database

To connect to the MySQL CLI, run `make mysql`.

Or to connect to a MySQL client, use the credentials specified in the .env file’s DB\_\* variables. Ensure you set the host to `localhost`.
