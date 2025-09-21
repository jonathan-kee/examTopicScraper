# Question 194
Table HR.EMPLOYEES contains a row where the EMPLOYEE_ID is 109.
User ALICE has no privileges to access HR.EMPLOYEES.
User ALICE starts a session.
User HR starts a session and successfully executes these statements:
GRANT DELETE ON employees TO alice;
UPDATE employees SET salary = 24000 WHERE employee_id = 109;
In her existing session ALICE then executes:
DELETE FROM hr.employees WHERE employee_id = 109;
What is the result?

# Answers
A.The DELETE command will wait for HR’s transaction to end then return an error.

B.The DELETE command will immediately delete the row.

C.The DELETE command will wait for HR’s transaction to end then delete the row.

D.The DELETE command will immediately return an error.

# Discussions
## Discussion 1
D is correct. ALICE needs SELECT privileges also

## Discussion 2
Tested, C is correct,  i updated row as sys user and deleted as test user, it was stuck in scrip runner, as soon as I commited in sys session delete did happen in test user session

## Discussion 3
I'm seeing a lot of debate here about the security, but what about data lock? nothing indicates that the HR committed the update, thus; shouldn't the row be locked?

## Discussion 4
C gives ORA-41900

## Discussion 5
UPDATE is DML and not a DDL, it does not implicitly commit the transaction.
C. The DELETE command will wait for HR’s transaction to end then delete the row.
ALICE’s DELETE command will wait for HR’s transaction to complete (either commit or rollback) and then delete the row.

