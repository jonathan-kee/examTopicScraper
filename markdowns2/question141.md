# Question 141
Which two are true about savepoints? (Choose two.)

# Answers
A.After issuing a savepoint, you can roll back to the savepoint name within the current transaction.

B.They make uncommitted updates visible to sessions owned by other users.

C.You can commit updates done between two savepoints without committing other updates in the current transaction.

D.A ROLLBACK TO SAVEPOINT command issued before the start of a transaction results in an error.

E.They make uncommitted updates visible to other sessions owned by the same user.

F.After issuing a savepoint, you cannot roll back the complete transaction.

# Discussions
## Discussion 1
AD is correct

## Discussion 2
The answers are A and E.
D is incorrect. If you place a savepoint at the beginning of a transaction and rollback to it, it undoes the entire transaction after the savepoint.

## Discussion 3
C is not correct, because you can only commit the entire transaction, not portions of it based on savepoints. Savepoints allow you to roll back to a specific point, but not selectively commit changes between two points.

## Discussion 4
AD is correct

## Discussion 5
AD is correct

