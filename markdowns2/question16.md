# Question 16
Which two statements are true about Oracle synonyms? (Choose two.)

# Answers
A.Any user can create a PUBLIC synonym.

B.A synonym has an object number.

C.All private synonym names must be unique in the database.

D.A synonym can be created on an object in a package.

E.A synonym can have a synonym.

# Discussions
## Discussion 1
A. Any user can create a PUBLIC synonym.( x) Must have Create Publc Syn Priv.
B. A synonym has an object number. 
C. All private synonym names must be unique in the database. (X) Unique in the schema.
D. A synonym can be created on an object in a package. (X) A schema object can't be in a package
    E. A synonym can have a synonym.

## Discussion 2
You have created synonym on the entire package, not on the package object.

## Discussion 3
Synonym can be created for the whole package but not for components of the package.

## Discussion 4
B & E is correct

## Discussion 5
B. A synonym has an object number
E. A synonym can have a synonym

