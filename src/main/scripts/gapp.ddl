
    create table academicrecords (
        id int4 not null,
        gpa float8,
        gre int4,
        toefl int4,
        trans varchar(255),
        primary key (id)
    );

    create table additionalinfo (
        id int4 not null,
        fieldname varchar(255),
        requirement varchar(255),
        typefieldvalue varchar(255),
        depart_id int4,
        primary key (id)
    );

    create table application (
        id int4 not null,
        term varchar(255),
        appstatus_id int4,
        program_id int4,
        records_id int4,
        sinfo_id int4,
        uinfo_id int4,
        primary key (id)
    );

    create table applicationstatus (
        id int4 not null,
        comment varchar(255),
        recordtime timestamp,
        value varchar(255),
        status_id int4,
        primary key (id)
    );

    create table department (
        id int4 not null,
        name varchar(255),
        primary key (id)
    );

    create table programs (
        id int4 not null,
        programs varchar(255),
        dept_id int4,
        primary key (id)
    );

    create table status (
        id int4 not null,
        stat varchar(255),
        primary key (id)
    );

    create table studentdegree (
        id int4 not null,
        degreeearned varchar(255),
        field varchar(255),
        timeperiod varchar(255),
        universityname varchar(255),
        app_id int4,
        primary key (id)
    );

    create table studentinfo (
        id int4 not null,
        cin int8,
        citizenship varchar(255),
        dob varchar(255),
        email varchar(255),
        fname varchar(255),
        gender varchar(255),
        lname varchar(255),
        phone int8,
        primary key (id)
    );

    create table usersinfo (
        id int4 not null,
        email varchar(255),
        fname varchar(255),
        lname varchar(255),
        password varchar(255),
        role varchar(255),
        type varchar(255),
        primary key (id)
    );

    alter table usersinfo 
        add constraint UK_7lw66ffkiov27cf2u2d62ewg5 unique (email);

    alter table additionalinfo 
        add constraint FK_livqdn7d5hre22ctjh7x98b66 
        foreign key (depart_id) 
        references department;

    alter table application 
        add constraint FK_nl9gd0m3nwq0059ge78td6or2 
        foreign key (appstatus_id) 
        references applicationstatus;

    alter table application 
        add constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy 
        foreign key (program_id) 
        references programs;

    alter table application 
        add constraint FK_2rp0vt7mguctkwnequ15ypshq 
        foreign key (records_id) 
        references academicrecords;

    alter table application 
        add constraint FK_nujmshl1d3tnjphnrpqu3e1ft 
        foreign key (sinfo_id) 
        references studentinfo;

    alter table application 
        add constraint FK_rkda50udbgjl1nafr6i44fv74 
        foreign key (uinfo_id) 
        references usersinfo;

    alter table applicationstatus 
        add constraint FK_ac972v3buv5oyhl2e56359jv5 
        foreign key (status_id) 
        references status;

    alter table programs 
        add constraint FK_lpnbt3jwi80n0yximj4mic6h6 
        foreign key (dept_id) 
        references department;

    alter table studentdegree 
        add constraint FK_1b81hd7bnw9yo3josnimq10vx 
        foreign key (app_id) 
        references application;

    create sequence hibernate_sequence;
