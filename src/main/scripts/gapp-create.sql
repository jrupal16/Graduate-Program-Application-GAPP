
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

        	create sequence hibernate_sequence minvalue 100;


INSERT INTO public.usersinfo(
            id, email, fname, lname, password, role, type)
    VALUES (1, 'admin@localhost.localdomain', 'Rupal','Jaiswal','abcd','managing departments and users','Administrator');
    INSERT INTO public.usersinfo(
            id, email, fname, lname, password, role, type)
    VALUES (2, 'staff1@localhost.localdomain', 'Kevin','Shaw','abcd','review and update applications','Staff');
    INSERT INTO public.usersinfo(
            id, email, fname, lname, password, role, type)
    VALUES (3, 'staff2@localhost.localdomain', 'Ben','Franklin','abcd','review and update applications','Staff');
    INSERT INTO public.usersinfo(
            id, email, fname, lname, password, role, type)
    VALUES (4, 'student1@localhost.localdomain', 'Steve','Walker','abcd','apply for programs','Student');
    INSERT INTO public.usersinfo(
            id, email, fname, lname, password, role, type)
    VALUES (5, 'student2@localhost.localdomain', 'John','Parker','abcd','apply for programs','Student');


    INSERT INTO public.department(
            id, name)
    VALUES (1, 'Accounting Department');
    INSERT INTO public.department(
            id, name)
    VALUES (2, 'Computer Science Department');
    

    INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (1,'Accounting program', 1);
     INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (3,'Finance Poogram', 1);
      INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (4,'Tax Poogram', 1);
    INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (2,'Computer Science program', 2);
    INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (5,'IT program', 2);
      INSERT INTO public.programs(
            id, programs, dept_id)
    VALUES (6,' Computer Technology', 2);

    INSERT INTO public.additionalinfo(
            id, fieldname, requirement, typefieldvalue, depart_id)
    VALUES (1,'GMAT','Require','Number',1);
    
    
    INSERT INTO public.studentdegree(
            id, degreeearned, field, timeperiod, universityname)
    VALUES (1, 'Masters','Computer Science','2 Year','CalStateLA');
    
    INSERT INTO public.status(
            id, stat)
    VALUES (1,'New');
    INSERT INTO public.status(
            id, stat)
    VALUES (2,'Pending Review');
    INSERT INTO public.status(
            id, stat)
    VALUES (3,'Denied');
    INSERT INTO public.status(
            id, stat)
    VALUES (4,'Recommend Admit');
    INSERT INTO public.status(
            id, stat)
    VALUES (5,'Recommend Admit w/ Condition');
    
    INSERT INTO public.applicationstatus(
            id, comment, recordtime, status_id)
    VALUES (1,'Just Filled','01/01/2016',1);

    
    INSERT INTO public.academicrecords(
            id, gpa, gre, toefl, trans)
    VALUES (1,3.00,300,90,'File');
    
    INSERT INTO public.studentinfo(
            id, cin, citizenship, dob, email, fname, gender, lname, phone)
    VALUES (1, 768687687, 'indian', '01/01/2010', 'jrupal16@gmail.com', 'rupal', 'male', 'vishal', 98685687);

    
    INSERT INTO public.application(
            id, term)
    VALUES (1,'Fall 2016');