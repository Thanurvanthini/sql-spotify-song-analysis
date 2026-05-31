CREATE DATABASE spotify_analysis;
use spotify_analysis;
create table songs(
track_id int primary key,
track_name varchar(225),
artist varchar(225),
track_genre varchar(225),
popularity int,danceability float,energy float,album_name varchar(225));
select count(*)as total_songs from dataset;
select track_name,popularity from dataset order by  popularity desc limit 10;
select artists, count(*)as songs_count from dataset group by artists order by songs_count desc;
select track_genre,avg(popularity)as avg_popularity from dataset group by track_genre;
select track_name,popularity,rank() over(order by popularity desc) as ranking from dataset;
with ranked_songs as(select*,rank() over(partition by track_genre order by popularity desc)as rnk from dataset)select*from ranked_songs where rnk=1;
create view top_songs as select track_name,artists,popularity from dataset where popularity>80;
select * from top_songs;
create index idx_artist on dataset(artists(225));
DESCRIBE dataset;

drop database spotify_analysis;