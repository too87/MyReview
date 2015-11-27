create sequence hibernate_sequence minvalue 100;

create table users (
    user_id    integer primary key,
    email varchar(255),
    firstname varchar(255),
    lastname varchar(255),
    password varchar(255),
    username varchar(255) unique,
    enabled boolean NOT NULL
    
);

insert into users values (1,'admin@localhost.com','admin','admin', '1234','admin',true);
insert into users values (2,'tu@localhost.com','teddy','sabi','1234', 'tu',true);


create table authorities (
    username    varchar(255) not null references users(username),
    authority   varchar(255)
);

insert into authorities values('admin', 'ROLE_ADMIN');
insert into authorities values('tu', 'ROLE_USER');

create table reviews(
	review_id	integer primary key,
	topic		varchar(255),
	description	text,
	tag			varchar(255),
	user_user_id		integer,
	inReply	integer

);


alter table reviews 
        add constraint FK_37ojl9isdbbiwgwgi8qpf0dt 
        foreign key (user_user_id) 
        references users;

create table reply(
	reply_id integer primary key,
	review_review_id integer not null,
	users_user_id integer not null,
	detail text
);

        
alter table reply 
        add constraint FK_37ojxcxvdbbiwgwgi8qpf0dt 
        foreign key (users_user_id) 
        references users;
        
        
alter table reply 
        add constraint FK_37ojxcxvdbbopkwgi8qpf0dt 
        foreign key (review_review_id) 
        references reviews;
        
insert into reviews values(99,'Microsoft Surface Book review','I’ve always wanted Microsoft to build a laptop.
Some days I’ll be seated on my couch, other days I’ll be seated on the floor of a convention center or press event, 
so I need a laptop that just works and won’t annoy me when I’m in the middle of writing an article. 
The Surface line (from the RT right through to the Surface Pro 3) has always been a compromised mixture of tablet and laptop.
 
They’ve never really worked well in my lap, the trackpad and keyboards weren’t as good as a laptop,
 and battery life hasn’t been ideal for a portable machine. I could use them fine at home on my desk,
 but every time I took them on the road with me I just ended up irritated because they weren’t real laptops.

Microsoft now thinks it has an answer, and it’s calling it the Surface Book.
Microsoft claims it’s the “ultimate laptop” that’s designed to go head-to-head with Apple’s MacBook Pro and premium Windows laptops. 
While the Surface Book is primarily a laptop, it’s also a tablet thanks to a display that detaches into something like a digital clipboard. 
Starting at $1,499, the Surface Book is clearly priced at the high-end of the laptop market, and the 1TB of storage model tops out at $3,199. 
That’s a lot of money to spend on a computer. I want a Surface that works like a laptop, has a great trackpad and keyboard, and actually lasts me a working day.

So, is the Surface Book a really great laptop or just another mix? 
Since Microsoft is calling this a laptop, let’s judge it first as a laptop.
Looking at the Surface Book for the first time, it’s easy to compare it to the MacBook Pro. There’s a big trackpad, nice key spacing on the keyboard, and an overall sleek combination of black and silver. All of this resembles a MacBook Pro, but Microsoft isn’t exactly copying Apple here. Just as it did with the Surface Pro 3, Microsoft has picked magnesium for the materials on the Surface Book. It’s almost soft to touch, and it doesn’t feel as cold and harsh as the aluminum on a MacBook. Microsoft is going for premium here, and it’s pretty clear it’s aiming for those tempted by Apple’s well-designed hardware.'
,'Technology',2,null);  

insert into reply values(1,99,2, 'great article');
insert into reviews values(1001,null,'goooood',null,2,99);
insert into reviews values(1002,null,'agree',null,2,1001);
