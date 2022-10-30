#!/bin/bash

case $1 in
  init_db)
    echo "======== CREATE ROLE TO POSTGRES"
    psql -h postgres -Upostgres -c "CREATE USER optimus_post WITH PASSWORD '$2';"
    psql -h postgres -Upostgres -c "ALTER ROLE optimus_post SUPERUSER CREATEDB;"
    echo "======== MIGRATION DB"
    docker exec -it optimus-post-app bash -c "bundle exec rails db:create db:migrate db:seed"
    echo "======== END" ;;
  start)
    docker-compose  --env-file .env -p optimus-post-api up -d ;;
  stop)
    docker-compose -p optimus-post-api down ;;
  rmi)
    docker-compose -p optimus-post-api down --volumes
    docker-compose -p optimus-post-api down --rmi -f all
    docker rmi -f $(docker images -a -q) ;;
  console)
    docker exec -it optimus-post-app bash -c "bundle exec rails c" ;;
  connect)
    docker exec -it optimus-post-app bash ;;
  migrate)
    docker exec -it optimus-post-app bash -c "bundle exec rails db:migrate" ;;
  rspec)
    docker exec -it optimus-post-app bash -c "RAILS_ENV='test' bundle exec rspec" ;;
  swagger)
    bash -c "SWAGGER_DRY_RUN=0 RAILS_ENV=test rake rswag:specs:swaggerize" ;;
  *)
    echo "Using: ./optimus-post.sh [init_db 'db_password', start, stop, rmi, connect, console, migrate, rspec, swagger]"
    echo "./optimus-post.sh rmi removes all images in the system, be careful!" ;;
esac;
