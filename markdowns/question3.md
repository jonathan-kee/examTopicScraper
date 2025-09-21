# Question 3
What is true about non-equijoin statement performance? (Choose two.)

# Answers
A.The BETWEEN condition always performs less well than using the >= and <= conditions.

B.The BETWEEN condition always performs better than using the >= and <= conditions.

C.The Oracle join syntax performs better than the SQL:1999 compliant ANSI join syntax.

D.Table aliases can improve performance.

E.The join syntax used makes no difference to performance.

# Discussions
## Discussion 1
D. Table aliases can improve performance. Table aliases can improve performance by reducing the amount of parsing needed to execute the query.

C. The Oracle join syntax performs better than the SQL:1999 compliant ANSI join syntax in Oracle 18c. Oracle's join syntax can result in better performance in certain scenarios as it allows the optimizer to understand the join order and access paths more effectively.

Therefore, options C and D are correct. Options A, B, and E are incorrect.

## Discussion 2
A B incorrect because Oracle Between is converted to >= <=
C Is arguable
D is not true, you don't find a book saying table alias can improve performance. 
E is arguable
C E to answer this poorly designed question

## Discussion 3
I read that aliases do indeed improve performance, ex. when you order by a column, the parser doesn't need to check all the tables in the query, to find which one the column belongs to. Can anyone confirm this?

## Discussion 4
D E are correct

## Discussion 5
DE are correct

