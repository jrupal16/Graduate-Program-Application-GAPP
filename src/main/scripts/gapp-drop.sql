
    alter table additionalinfo 
        drop constraint FK_livqdn7d5hre22ctjh7x98b66;

    alter table application 
        drop constraint FK_nl9gd0m3nwq0059ge78td6or2;

    alter table application 
        drop constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy;

    alter table application 
        drop constraint FK_2rp0vt7mguctkwnequ15ypshq;

    alter table application 
        drop constraint FK_nujmshl1d3tnjphnrpqu3e1ft;

    alter table application 
        drop constraint FK_rkda50udbgjl1nafr6i44fv74;

    alter table applicationstatus 
        drop constraint FK_ac972v3buv5oyhl2e56359jv5;

    alter table programs 
        drop constraint FK_lpnbt3jwi80n0yximj4mic6h6;

    alter table studentdegree 
        drop constraint FK_1b81hd7bnw9yo3josnimq10vx;

    drop table if exists academicrecords cascade;

    drop table if exists additionalinfo cascade;

    drop table if exists application cascade;

    drop table if exists applicationstatus cascade;

    drop table if exists department cascade;

    drop table if exists programs cascade;

    drop table if exists status cascade;

    drop table if exists studentdegree cascade;

    drop table if exists studentinfo cascade;

    drop table if exists usersinfo cascade;

    drop sequence hibernate_sequence;
