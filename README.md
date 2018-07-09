# docker_lemp_server

Docker LEMP server with nginx php7.0 and mariadb


Usage:
  
  docker create --name lemp-server \\\
                 -v /path/to/site:/app/site \\\
                 -p 80:80 \\\
                 wilply/docker_lemp_server
                 
You can add a init_db.sql file to /app/site,\
it will be executed the first time the container is run.
