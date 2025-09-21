# Question 1
Examine the description of the PROMOTIONS table:

![](../images/0000200001.png)
		
You want to display the unique promotion costs in each promotion category.
Which two queries can be used? (Choose two.)

# Answers
A.SELECT DISTINCT promo_category || ' has ' || promo_cost AS COSTS FROM promotions ORDER BY 1;Most Voted

B.SELECT DISTINCT promo_cost || ' in ' || DISTINCT promo_category FROM promotions ORDER BY 1;

C.SELECT DISTINCT promo_category, promo_cost FROM promotions ORDER BY 1;Most Voted

D.SELECT promo_category DISTINCT promo_cost, FROM promotions ORDER BY 2;

E.SELECT promo_cost, promo_category FROM promotions ORDER BY 1;

# Discussions
Distinct keyword is used to select the unique values of the column/combination of columns mentioned after the DISTINCT clause.

AC are correct. DB have Distinct in a wrong position in the query and E returns all because of the missing DISTINCT

Distinct is used to get distinct set of values for one or more columns mentioned in select statement