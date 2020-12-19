select DT, New_Dt
from post_diwali
Limit 20;
 
 /* Adding a new column as New_Dt to change the date column type from text to date */
 Alter table post_diwali
 Add Column New_DT date;
 
 Update post_diwali
 Set New_DT = str_to_date(left(DT,9), "%d-%b-%y");
 
 /* Adding a new column as N_Date to change the date column from text to date */
 Alter Table pre_diwali
 Add Column N_Date date;
 
 Update pre_diwali
 Set N_Date = str_to_date(left(DT,10), "%d-%m-%Y");
 
/* Checking Which shops got more than 3 orders from Pre_Diwali sales */
Select Orders, CATEGORY, N_Date, s_name
From pre_diwali
Where Orders > 3 ;
/* Changed the column name */
Alter Table Pre_Diwali
Rename Column Name to S_Name ;

/* Changede the column name */
Alter Table Post_Diwali
Rename Column Name to S_Name ;

/* City and S_Name where GMV is more than 100 */
Select City, S_Name, Qty, ITEM_GMV, Count(orders) as TotalOrdr
From pre_diwali
Where ITEM_GMV > 100
Group By S_name;


/* Arranging the data as TotalGmv, TotalOrdr, TotalQty in Descending order as per Item_Gmv from Pre_Diwali Sales*/
select  S_name, sum(Qty) as TOtalQty, sum(orders) as TotalOrdr,  sum(ITEM_GMV) as TotalGmv
from pre_diwali
Group BY S_name
Order By 4 Desc;

/* Shops who got more than 2000 orders in Pre_diwali sales */
Select S_name, sum(orders) as TotalOrdr
From pre_diwali
Group BY S_Name
Having TotalOrdr >= 2000
Order By 2 desc;

/* How many shops got more than 2000 orders in pre_diwali sales */
select count(*) as TotalShops
From (Select S_name, sum(orders) as TotalOrdr
From pre_diwali
Group BY S_Name
Having TotalOrdr >= 2000
Order By 2 desc) as TempTable;

/* Arranging the data as TotalGmv, TotalOrdr, TotalQty in Descending order as per Item_Gmv from Post_Diwali Sales */
select  S_name, sum(Qty) as TOtalQty, sum(orders) as TotalOrdr,  sum(ITEM_GMV) as TotalGmv
from post_diwali
Group BY S_name
Order By 4 Desc;


/* How many shops got more than 2000 orders in post_diwali sales */
select count(*) as TotalShops
From (Select S_name, sum(orders) as TotalOrdr
From post_diwali
Group BY S_Name
Having TotalOrdr >= 2000
Order By 2 desc) as TempTable;

/* Total Orders from Pre_diwali sales */
select sum(Orders) as TotalOrd
From pre_diwali;

/* Total Orders from post_diwali sales */
Select sum(orders) as TotalOrd
From post_diwali;

/* Total Item_Gmv from Pre_Diwali */
Select sum(Item_Gmv) as TotalGmv
From pre_diwali;

/* Total Item_Gmv from Post_Diwali */
Select sum(Item_Gmv) as TotalGmv
From post_diwali;

/* Which shops got orders from Pre_diwali and Post_dwiali sales */
select ID, S_name
From pre_diwali
Where ID IN (Select ID From post_diwali);

/* How many shops got both Pre_diwali and Post_diwali sales */
select count(*) as TotalShops
From pre_diwali
Where ID IN (Select ID From post_diwali);

/* How many shops got order from Pre_dwiali sales but not from post_diwali sales */
select count(*) as TotalShops
From pre_diwali
Where ID NOT IN (Select ID From post_diwali);

/* Which shops got order from Pre_dwiali sales but not from post_diwali sales */
select ID, S_name
From pre_diwali
Where ID NOT IN (Select ID From post_diwali);


/* How many shops got order from post_dwiali sales but not from pre_diwali sales */
select count(*) as TotalShops
From post_diwali
Where ID NOT IN (Select ID From pre_diwali);

/* Which shops got order from Post_dwiali sales but not from pre_diwali sales */
select ID, S_name
From post_diwali
Where ID NOT IN (Select ID From pre_diwali);


/* Which are the Category ordered Mamimux , Minimum from Pre_Diwali sales */
Select Category, Max(Orders) as MxOrdr, Min(orders) as MinOrdr
From pre_diwali;


/* Which are the Category ordered Mamimux , Minimum from Post_Diwali sales */
Select Category, Max(Orders) as MxOrdr, Min(orders) as MinOrdr
From post_diwali;

/* Cities which ordrerd more than 1000 GMV from Pre_Diwali sales */
 Select City, sum(Item_Gmv) as TotalGmv
 From Pre_diwali
 Where Item_Gmv >= 1000
 Group BY 1;
 
 
 
 
 
 /* Concluion - 
 1. Post_Diwali sales are more than Pre_Diwali sales
 2. Around more than 800 new shops got orders in Post_Diwali sales 
 3. Pre_Diwali higest sales is for Snaks
 4. Post Diwali highest sales is for Sweets */

