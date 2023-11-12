
# README

This README would normally document whatever steps are necessary to get the
application up and running.


* Ruby version 3.0.2 & rails 6.1 & Postgresql 

* System dependencies
  - install docker
  - redis-server v6.2.2


* Configuration 
  1- run docker-compose build 
  2- run docker-compose up

Database creation 
  1- docker-compose exec web rails db:create 
  2- docker-compose exec web rails db:migrate 

Run sidekiq
  3- docker-compose exec web sidekiq -C config/sidekiq.yml


Finally run 'http://localhost:3000/' in your browser 




* Services and patterns (job queues, sidekiq, redis, ransack, csv import.)
 - import csv file service for movies 
 - import csv file service for reviews 
 - background job for importing files in the background 
 - observer pattern and service pattern

* UML Diagram
<img width="559" alt="Screen Shot 2023-11-12 at 9 39 36 PM" src="https://github.com/myousry22/movie_reviews_sys/assets/26511051/7467afcf-3333-4f3d-a274-d1567e26de60">


