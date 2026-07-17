# Question 4
Which two are true? (Choose two.)

# Answers
A.ADD_MONTHS adds a number of calendar months to a date.

B.CEIL requires an argument which is a numeric data type.

C.CEIL returns the largest integer less than or equal to a specified number.

D.LAST_DAY returns the date of the last day of the current month only.

E.LAST_DAY returns the date of the last day of the month for the date argument passed to the function.

F.LAST_DAY returns the date of the last day of the previous month only.

# Discussions
## Discussion 1
maby AE is Right...
C. CEIL returns the largest integer less than or equal to a specified number.
Can change : CEIL returns the minmum integer more than or equal to a specified number

## Discussion 2
Answer: A, E
"CEIL returns smallest integer greater than or equal to n. and can use any numeric or nonnumeric data type that can be implicit converted to numeric adta type"
https://docs.oracle.com/database/121/SQLRF/functions025.htm#SQLRF00614

## Discussion 3
C. CEIL returns the largest integer less than or equal to a specified number.
How does Option:C is correct. CEIL always return greater than or equal to specified number.

## Discussion 4
The two true statements are:
AE
Explanation: 

B. CEIL is an Oracle SQL function that requires an argument which is a numeric data type. This statement is false, as CEIL can also take input arguments of type DATE or TIMESTAMP.

C. CEIL is an Oracle SQL function that returns the smallest integer greater than or equal to a specified number. This statement is false, as CEIL actually returns the largest integer less than or equal to a specified number.

D. LAST_DAY is an Oracle SQL function that returns the date of the last day of the current month only. This statement is false, as LAST_DAY can be used with any date argument to return the last day of that month.

E. This statement is true. LAST_DAY is an Oracle SQL function that can be used with a date argument to return the date of the last day of the month for that date. For example, LAST_DAY('2023-06-26') would return '2023-06-30'.

F. This statement is false. LAST_DAY can be used with any date argument to return the last day of that month, not just the previous month.

## Discussion 5
C is the definition of FLOOR()!

