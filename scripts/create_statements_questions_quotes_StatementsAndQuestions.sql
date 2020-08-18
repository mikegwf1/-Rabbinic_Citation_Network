-- statement made by one rabbi to another
drop table rabbi_statement;
drop table rabbi_statement_totals;
drop table rabbi_statement_totals_by_direction;
create table rabbi_statement as (select * from rabbi_intervals 
   where isRabbi2Target > 0 and isRabbi1Target = 0 and isRabbi1Questioned = 0 and contains_quoter_before_span> 0 and numb_intervening_tokens=0 and contains_questioner_before_span = 0);
create table rabbi_statement_totals as (select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_statement group by rabbis_after_link_alpha_order order by count desc);
create table rabbi_statement_totals_by_direction as 
	(select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_statement group by first_rabbi_after_link, second_rabbi_after_link order by count desc);

-- question from one rabbi to another
drop table rabbi_question;
drop table rabbi_question_totals;
drop table rabbi_question_totals_by_direction;
create table rabbi_question as (select * from rabbi_intervals 
   where (isRabbi2Questioned > 0 or isRabbi2Target > 0) and (isRabbi1Target = 0 and isRabbi1Questioned = 0) and contains_questioner_before_span> 0 and numb_intervening_tokens=0);
create table rabbi_question_totals as (select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_question group by rabbis_after_link_alpha_order order by count desc);
create table rabbi_question_totals_by_direction as 
	(select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_question group by first_rabbi_after_link, second_rabbi_after_link order by count desc);

-- one rabbi says in the name of another rabbi
drop table rabbi_quote;
drop table rabbi_quote_totals;
drop table rabbi_quote_totals_by_direction;
create table rabbi_quote as
(select * from rabbi_intervals where (contains_quoter_before_span > 0 and (contains_quoter_in_span > 0 or contains_name_of > 0) and numb_intervening_tokens = 1
  and token_string in ("אמר","משום","משמיה","בשם")) or
  token_string in ("אומר משום","אמר משום","שאמר משום","דאמר משום","אמר משמיה","דאמר משמיה")
);
create table rabbi_quote_totals as (select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_quote group by rabbis_after_link_alpha_order order by count desc);
create table rabbi_quote_totals_by_direction as 
	(select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_quote group by first_rabbi_after_link, second_rabbi_after_link order by count desc);


drop table rabbi_statement_and_question;
drop table rabbi_statement_and_question_totals;
drop table rabbi_statement_and_question_totals_by_direction;
create table rabbi_statement_and_question as
	(select * from rabbi_statement) union (select * from rabbi_question);
create table rabbi_statement_and_question_totals as (select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_statement_and_question group by rabbis_after_link_alpha_order order by count desc);
create table rabbi_statement_and_question_totals_by_direction as 
	(select first_rabbi_after_link, second_rabbi_after_link, count(*) as count from rabbi_statement_and_question group by first_rabbi_after_link, second_rabbi_after_link order by count desc);


