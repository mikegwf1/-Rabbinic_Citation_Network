SET SQL_SAFE_UPDATES = 0;

--  *********************statement********************************

drop table rabbi_statement_directed_edges;
CREATE TABLE `rabbi_statement_directed_edges` (
  `Source` int(11) default NULL,
  `Target` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `Weight` int(11) DEFAULT NULL,
  `SourceName` varchar(200) DEFAULT NULL,
  `TargetName` varchar(200) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into rabbi_statement_directed_edges (SourceName, TargetName, Weight)  select first_rabbi_after_link, second_rabbi_after_link, count from rabbi_statement_totals_by_direction;
 
update rabbi_statement_directed_edges set Type = "Directed";
 
update rabbi_statement_directed_edges set source =  (select id from rabbis where name = SourceName);
update rabbi_statement_directed_edges set target =  (select id from rabbis where name = TargetName);

-- export to gephi\rabbi_statement_directed_edges.csv

-- create subset of rabbi_nodes that only contains nodes in graph.
drop table rabbi_statement_directed_edges_rabbi_nodes;
drop table node_ids;
create table node_ids as select source id from rabbi_statement_directed_edges union select target id from rabbi_statement_directed_edges;
create table rabbi_statement_directed_edges_rabbi_nodes as
   select id Id, name Label from rabbis u where u.Id in (select id from node_ids);

-- export to gephi\rabbi_statement_directed_edges_rabbi_nodes.csv

--  *********************question********************************

drop table rabbi_question_directed_edges;
CREATE TABLE `rabbi_question_directed_edges` (
  `Source` int(11) default NULL,
  `Target` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `Weight` int(11) DEFAULT NULL,
  `SourceName` varchar(200) DEFAULT NULL,
  `TargetName` varchar(200) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
insert into rabbi_question_directed_edges (SourceName, TargetName, Weight)  select first_rabbi_after_link, second_rabbi_after_link, count from rabbi_question_totals_by_direction;
 
update rabbi_question_directed_edges set Type = "Directed";
 
update rabbi_question_directed_edges set source =  (select id from rabbis where name = SourceName);
update rabbi_question_directed_edges set target =  (select id from rabbis where name = TargetName);

-- export to gephi\rabbi_question_directed_edges.csv

-- create subset of rabbi_nodes that only contains nodes in graph.
drop table rabbi_question_directed_edges_rabbi_nodes;
drop table node_ids;
create table node_ids as select source id from rabbi_question_directed_edges union select target id from rabbi_question_directed_edges;
create table rabbi_question_directed_edges_rabbi_nodes as
   select id Id, name Label from rabbis u where u.Id in (select id from node_ids);

-- export to gephi\rabbi_question_directed_edges_rabbi_nodes.csv

--  *********************quote********************************

drop table rabbi_quote_directed_edges;
CREATE TABLE `rabbi_quote_directed_edges` (
  `Source` int(11) default NULL,
  `Target` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `Weight` int(11) DEFAULT NULL,
  `SourceName` varchar(200) DEFAULT NULL,
  `TargetName` varchar(200) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
insert into rabbi_quote_directed_edges (SourceName, TargetName, Weight)  select first_rabbi_after_link, second_rabbi_after_link, count from rabbi_quote_totals_by_direction;
 
update rabbi_quote_directed_edges set Type = "Directed";
 
update rabbi_quote_directed_edges set source =  (select id from rabbis where name = SourceName);
update rabbi_quote_directed_edges set target =  (select id from rabbis where name = TargetName);

-- export to gephi\rabbi_edges_quotes_directed.csv

-- create subset of rabbi_nodes that only contains nodes in graph.
drop table rabbi_quote_directed_edges_rabbi_nodes;
drop table node_ids;
create table node_ids as select source id from rabbi_quote_directed_edges union select target id from rabbi_quote_directed_edges;
create table rabbi_quote_directed_edges_rabbi_nodes as
   select id Id, name Label from rabbis u where u.Id in (select id from node_ids);

-- export to gephi\rabbi_quote_directed_edges_rabbi_nodes.csv

--  *********************statement and question********************************

drop table rabbi_statement_and_question_directed_edges;
CREATE TABLE `rabbi_statement_and_question_directed_edges` (
  `Source` int(11) default NULL,
  `Target` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `Weight` int(11) DEFAULT NULL,
  `SourceName` varchar(200) DEFAULT NULL,
  `TargetName` varchar(200) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
insert into rabbi_statement_and_question_directed_edges (SourceName, TargetName, Weight)  select first_rabbi_after_link, second_rabbi_after_link, count from rabbi_statement_and_question_totals_by_direction;
 
update rabbi_statement_and_question_directed_edges set Type = "Directed";
 
update rabbi_statement_and_question_directed_edges set source =  (select id from rabbis where name = SourceName);
update rabbi_statement_and_question_directed_edges set target =  (select id from rabbis where name = TargetName);

-- export to gephi\rabbi_edges_statement_and_question_directed.csv

-- create subset of rabbi_nodes that only contains nodes in graph.
drop table rabbi_statement_and_question_directed_edges_rabbi_nodes;
drop table node_ids;
create table node_ids as select source id from rabbi_statement_and_question_directed_edges union select target id from rabbi_statement_and_question_directed_edges;
create table rabbi_statement_and_question_directed_edges_rabbi_nodes as
   select id Id, name Label from rabbis u where u.Id in (select id from node_ids);

-- export to gephi\rabbi_statement_and_question_directed_edges_rabbi_nodes.csv