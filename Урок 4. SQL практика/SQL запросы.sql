--������ ���� ������ �� ������� sales
select *
from sales;


--������ ������������ �������� (sales_id � transaction_amount) �� ������� sales
select sales_id, transaction_amount
from sales;


--���������� ������� (��� ����������, � transaction_amount >= 80000) � ���������� �� �����������
select *
from sales 
where transaction_amount >= 80000
order by transaction_amount;


--������ ���������� ���������� ���������
select count (distinct product_id)
from products;


-- ����� ���������, ������������ �� C
select *
from products 
where product_name like ('C%');


--��������� � from
select * 
from (
		select sales_id, transaction_amount
		from sales
		where transaction_amount > 0);

-- ��������� � where 
select * 
from sales 
where product_id in 
					(select product_id 
					from products 
					where product_name like 'T%');
		
				
--����������� ������
select p.product_name, t.time_datetime, r.region_name, s.transaction_amount 
from sales s
join products p 
on s.product_id = p.product_id 
join regions r 
on s.region_id = r.region_id 
join time t 
on s.time_id = t.time_id;


--��������� (����� ������ �� ���������)
select product_id, sum (transaction_amount)
from sales 
group by product_id;


--��������� (������� ������ �� ��������) � �����������
select region_id, avg (transaction_amount) as avg_amount
from sales 
group by region_id
having avg_amount > 50000
order by avg_amount;


--��������� ��������� (�� �������� � SQLite)
with sales_v1 as (
					select sales_id, transaction_amount
					from sales
					where transaction_amount > 0)

select *
from sales_v1;


--������� �������
select sales_id, region_id, transaction_amount,
max(transaction_amount) over (partition by region_id) as max_amount_for_region,
sum(transaction_amount) over (partition by region_id) as sum_amount_for_region,
avg(transaction_amount) over (partition by region_id) as avg_amount_for_region
from sales;






