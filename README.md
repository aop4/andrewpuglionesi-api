# Local environment setup
1. Install Ruby with rvm.
    1. Follow instructions at https://rvm.io/rvm/install to install rvm.
    2. Run `rvm install 3.3.5`, then `rvm use 3.3.5`.
    3. If you see a message stating "RVM is not a function," try adding this to your `.bashrc` file: `source ~/.rvm/scripts/rvm`.
2. Set up the database.
    1. Install Postgres 16. This version may not be available among your default Linux packages--you can manually add a repository that allows you to install any Postgres version:
        ```bash
        sudo apt install postgresql-common

        sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

        sudo apt install postgresql-16

        pg_lsclusters # confirm that a Postgres 16 cluster is active
        ```
        More information here: https://www.postgresql.org/download/linux/ubuntu.
    2. Log into the database as the `postgres` user:
        ```
        sudo -u postgres psql
        ```
    3. Set the `postgres` user's password to `postgres`. In the Postgres prompt, enter:
        ```
        ALTER USER postgres PASSWORD 'postgres';
        ```
    4. While in the Postgres prompt, create the main_db database:
        ```
        CREATE DATABASE main_db;
        ```
    5. To allow Rails to connect to the database with the `postgres` user, update the pg_hba.conf file to allow the `postgres` user to log in with the `md5` authentication method:
        - `sudo nano /etc/postgresql/16/main/pg_hba.conf`
        - Edit the first line to read:
        ```
        local   all             postgres                                md5
        ```
    6. Restart postgres: `sudo service postgresql restart`
    7. Load the database dump into the main_db database that you created earlier:
        `psql --username=postgres main_db < db/db_dump_2024-OCT-02.sql`
3. Launch the server:
    1. `bundle install` to install dependencies.
    2. `bin/rails server` to start the server.
    3. Navigate to http://localhost:3000

# Troubleshooting
- `bundle install` fails with a message that includes:
  > Can't find the 'libpq-fe.h header
  - Run `sudo apt-get install libpq-dev` and try again.
- The server experiences a segfault whenever you make a request, and the log mentions the `pg` gem.
  - This may be due to incompatibility with the current Postgres version. Confirm you are using Postgres 16.
