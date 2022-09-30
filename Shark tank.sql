select * from sharktank.data;

#count of number of episodes
select count(distinct `Ep. No.`) as No_of_Episodes from sharktank.data;

# Total number of business who pitched in the show

select count(distinct Brand) as No_of_Business from sharktank.data;

# pitches converted
select sum(a.converted_not_converted) as Converted , count(*) as Total_pitches from(
    select `Amount Invested lakhs`, case when `Amount Invested lakhs`> 0 then 1 else 0 end as converted_not_converted from sharktank.data)a;
    
 #percentage of total pitches converted   
    select (cast(sum(a.converted_not_converted) as float)/cast(count(*) as float)) as Percentage_Converted from(
    select `Amount Invested lakhs`, case when `Amount Invested lakhs`> 0 then 1 else 0 end as converted_not_converted from sharktank.data)a;
    
# Total Male Participant
    select sum(male) as Total_Male_Participant from sharktank.data;
    
#Total Female Participant
    select sum(Female) as Total_Female_Participant from sharktank.data;
    
# Gender Ratio
    select sum(Female)/sum(male) as Gender_Ratio from sharktank.data;
    
# Total Amount Invested
   select sum(`Amount Invested lakhs`) as Total_Investment_in_lakhs from sharktank.data;
   
#Average equaity taken
   select round(avg(a.`Equity Taken %`))as Avg_Equity_taken from (
   (select * from  sharktank.data where `Equity Taken %` > 0))a;
    
# Highest deal
  Select max(`Amount Invested lakhs`) as Highest_Deal from  sharktank.data;
  
# Highest Equity_Taken 
  Select sector, max(`Equity Taken %`) as Higest_Equity_Taken from  sharktank.data;
  
#Pitches with atleast one women contestent
 select sum(a.female_contestent) from (
 select female, case when female>0 then 1 else 0 end as female_contestent from sharktank.data)a;
 
 # Pitches converted having atleast one women

select sum(b.female) as Total_female_entrepreneurs_received_funding from (
select a.*, case when a.female>0 then 1 else 0 end as female_contestent from(
select * from sharktank.data where Deal != 'No Deal')a)b;

#Average Number of Team Members
select round(avg(`Team members`)) from sharktank.data;

#Amount invested per deal

select avg(a.`Amount Invested lakhs`) as Amount_Invested_Per_Deal from
(select * from sharktank.data where  Deal != 'No Deal')a;

# Average Age range of Brand Owners

select`Avg age`, count(`Avg age`) from sharktank.data group by `Avg age` order by `Avg age` desc;


# count of location to which owners belong

select Location, count(Location) as count from sharktank.data group by Location order by count desc;

#count of distinct sectors

select Sector, count(Sector) as count from sharktank.data group by Sector order by count desc;

#count of partner deals

select Partners, count(Partners) as count from sharktank.data where Partners != '-' group by Partners order by count desc;

 #making the matrix


select * from sharktank.data;

select 'Ashnner' as keyy,count(`Ashneer Amount Invested`) from sharktank.data where `Ashneer Amount Invested` is not null;


select 'Ashnner' as keyy,count(`Ashneer Amount Invested`) from sharktank.data where `Ashneer Amount Invested` is not null AND `Ashneer Amount Invested`!=0;

SELECT 'Ashneer' as keyy,SUM(C.`Ashneer Amount Invested`),AVG(C.`Ashneer Amount Invested`) 
FROM (SELECT * FROM sharktank.data  WHERE .`Ashneer Amount Invested`!= 0 AND .`Ashneer Amount Invested` IS NOT NULL) C;


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ashneer' as keyy,count(`Ashneer Amount Invested`) total_deals_present from sharktank.data where `Ashneer Amount Invested` is not null) a

inner join (
select 'Ashneer' as keyy,count(`Ashneer Amount Invested`) total_deals from sharktank.data 
where `Ashneer Amount Invested` is not null AND `Ashneer Amount Invested`!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Ashneer' as keyy,SUM(C.`Ashneer Amount Invested`) as total_amount_invested,
AVG(C.`Ashneer Amount Invested`) avg_equity_taken
FROM (SELECT * FROM sharktank.data where `Ashneer Amount Invested` !=0 AND `Ashneer Amount Invested` IS NOT NULL) C) n
on m.keyy=n.keyy;



 

