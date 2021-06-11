USE movie;
create table actor(
act_id int not null,
act_fname char(20) not null,
act_lname char(20) not null,
act_gender char(1) not null,

constraint actor_pk primary key(act_id)
);


create table director(
dir_id int not null,
dir_fname char(20) not null,
dir_lname char(20) not null,

constraint director_pk primary key(dir_id)
);

create table movie(
movie_id int not null,
movie_title char(50) not null,
movie_year int not null,
movie_time int not null,
movie_lang char(50) not null,
movie_dt_rel DATE not null,
 movie_rel_country char(5) not null,
 constraint movie_pk primary key(movie_id)
);

create table reviewer(
rev_id int not null,
rev_name char(30),
constraint reviewer_pk primary key(rev_id)
);

create table genre(
gen_id int not null,
gen_title char(20),
constraint genre_pk primary key(gen_id)
);

create table movie_direction(
movie_id int not null,
dir_id int not null,
constraint movie_direction_pk primary key (movie_id,dir_id),
constraint movie_fk foreign key(movie_id)
					references movie(movie_id),
 constraint director_fk foreign key(dir_id)
						references director(dir_id)
);

create table movie_cast(
act_id int not null,
movie_id int not null,
`role` char(30) not null,
constraint movie_cast_pk primary key (movie_id,act_id),
constraint actor_fk foreign key(act_id)
					references actor(act_id),
constraint movie_cast_fk foreign key(movie_id)
					references movie(movie_id)
);

create table movie_genre(
movie_id int not null,
gen_id int not null,
constraint movie_genre_pk primary key (movie_id,gen_id),
constraint movie_genre_fk foreign key(movie_id)
					references movie(movie_id),
constraint genre_fk foreign key(gen_id)
					references genre(gen_id)
);

create table rating(
movie_id int not null,
rev_id int not null,
rev_stars int not null,
num_o_rating int not null,
constraint rating_pk primary key (movie_id,rev_id),
constraint movie_rating_fk foreign key(movie_id)
					references movie(movie_id),
constraint reviewer_fk foreign key(rev_id)
						references reviewer(rev_id)
);

select * from actor;