--
-- PostgreSQL database dump
--

\restrict ekj3v93oDc6czprvw4gYylgtZmepp9tUaxSaQenScso5hG4pNhUHyv3hrMmzU24

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    number integer NOT NULL,
    question_number integer NOT NULL,
    question_exam text NOT NULL,
    text text,
    is_correct boolean
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    name text NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: discussions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discussions (
    number integer NOT NULL,
    question_number integer NOT NULL,
    question_exam text NOT NULL,
    selected_answer text,
    text text,
    upvote integer
);


ALTER TABLE public.discussions OWNER TO postgres;

--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    name text NOT NULL,
    company text NOT NULL
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    number integer NOT NULL,
    exam text NOT NULL,
    text text
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questionslink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionslink (
    number integer NOT NULL,
    exam text NOT NULL,
    link text
);


ALTER TABLE public.questionslink OWNER TO postgres;

--
-- Name: seq_questions; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_questions
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_questions OWNER TO postgres;

--
-- Name: seq_questionslink; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_questionslink
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_questionslink OWNER TO postgres;

--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (number, question_number, question_exam, text, is_correct) FROM stdin;
1	1	1z0-071	A.SELECT DISTINCT promo_category || ' has ' || promo_cost AS COSTS FROM promotions ORDER BY 1;Most Voted	t
2	1	1z0-071	B.SELECT DISTINCT promo_cost || ' in ' || DISTINCT promo_category FROM promotions ORDER BY 1;	f
3	1	1z0-071	C.SELECT DISTINCT promo_category, promo_cost FROM promotions ORDER BY 1;Most Voted	t
4	1	1z0-071	D.SELECT promo_category DISTINCT promo_cost, FROM promotions ORDER BY 2;	f
5	1	1z0-071	E.SELECT promo_cost, promo_category FROM promotions ORDER BY 1;	f
1	2	1z0-071	A.SELECT product_id, unit_price, S "Discount", unit_price + surcharge - discount FROM products;	f
2	2	1z0-071	B.SELECT product_id, (unit_price * 0.15 / (4.75 + 552.25)) FROM products;Most Voted	t
3	2	1z0-071	C.SELECT product_id, (expiry_date - delivery_date) * 2 FROM products;Most Voted	t
4	2	1z0-071	D.SELECT product_id, unit_price || 5 "Discount", unit_price + surcharge - discount FROM products;	f
5	2	1z0-071	E.SELECT product_id, expiry_date * 2 FROM products;	f
6	2	1z0-071	F.SELECT product_id, unit_price, unit_price + surcharge FROM products;Most Voted	t
1	3	1z0-071	A.The BETWEEN condition always performs less well than using the >= and <= conditions.	f
2	3	1z0-071	B.The BETWEEN condition always performs better than using the >= and <= conditions.	f
3	3	1z0-071	C.The Oracle join syntax performs better than the SQL:1999 compliant ANSI join syntax.	f
4	3	1z0-071	D.Table aliases can improve performance.Most Voted	t
5	3	1z0-071	E.The join syntax used makes no difference to performance.Most Voted	t
1	4	1z0-071	A.ADD_MONTHS adds a number of calendar months to a date.Most Voted	t
2	4	1z0-071	B.CEIL requires an argument which is a numeric data type.	f
3	4	1z0-071	C.CEIL returns the largest integer less than or equal to a specified number.	f
4	4	1z0-071	D.LAST_DAY returns the date of the last day of the current month only.	f
5	4	1z0-071	E.LAST_DAY returns the date of the last day of the month for the date argument passed to the function.Most Voted	t
6	4	1z0-071	F.LAST_DAY returns the date of the last day of the previous month only.	f
1	5	1z0-071	A.A synonym cannot be created for a PL/SQL package.	f
2	5	1z0-071	B.A synonym can be available to all users.Most Voted	t
3	5	1z0-071	C.A SEQUENCE can have a synonym.Most Voted	t
4	5	1z0-071	D.Any user can drop a PUBLIC synonym.	f
5	5	1z0-071	E.A synonym created by one user can refer to an object belonging to another user.Most Voted	t
1	6	1z0-071	A.CONCAT joins two character strings together.Most Voted	t
2	6	1z0-071	B.CONCAT joins two or more character strings together.	f
3	6	1z0-071	C.FLOOR returns the largest positive integer less than or equal to a specified number.	f
4	6	1z0-071	D.INSTR finds the offset within a character string, starting from position 0.	f
5	6	1z0-071	E.INSTR finds the offset within a string of a single character only.	f
6	6	1z0-071	F.FLOOR returns the largest integer less than or equal to a specified number.Most Voted	t
1	7	1z0-071	A.The primary key constraint will be enabled and IMMEDIATE.Most Voted	t
2	7	1z0-071	B.The foreign key constraint will be enabled and DEFERRED.	f
3	7	1z0-071	C.The primary key constraint will be enabled and DEFERRED.	f
4	7	1z0-071	D.The foreign key constraint will be disabled.Most Voted	t
5	7	1z0-071	E.The foreign key constraint will be enabled and IMMEDIATE.	f
1	8	1z0-071	A.All existing rows in the ORDERS table are updated.Most Voted	t
2	8	1z0-071	B.The subquery is executed before the UPDATE statement is executed.	f
3	8	1z0-071	C.The subquery is not a correlated subquery.	f
4	8	1z0-071	D.The subquery is executed for every updated row in the ORDERS table.Most Voted	t
5	8	1z0-071	E.The UPDATE statement executes successfully even if the subquery selects multiple rows.	f
1	9	1z0-071	A.DELETE can use a WHERE clause to determine which row(s) should be removed.Most Voted	t
2	9	1z0-071	B.TRUNCATE can use a WHERE clause to determine which row(s) should be removed.	f
3	9	1z0-071	C.TRUNCATE leaves any indexes on the table in an UNUSABLE state.	f
4	9	1z0-071	D.The result of a TRUNCATE can be undone by issuing a ROLLBACK.	f
5	9	1z0-071	E.The result of a DELETE can be undone by issuing a ROLLBACK.Most Voted	t
1	10	1z0-071	A.WHERE TO_NUMBER(start_date - SYSDATE) <= 25	f
2	10	1z0-071	B.WHERE MONTHS_BETWEEN(start_date, SYSDATE) <= 25	f
3	10	1z0-071	C.WHERE MONTHS_BETWEEN(SYSDATE, start_date) <= 25Most Voted	t
4	10	1z0-071	D.WHERE ADD_MONTHS(start_date, 25) <= SYSDATE	f
1	11	1z0-071	A.They can be nested.Most Voted	t
2	11	1z0-071	B.They cannot be used in the VALUES clause of an INSERT statement.	f
3	11	1z0-071	C.A scalar subquery expression that returns zero rows evaluates to zero.	f
4	11	1z0-071	D.They can be used as default values for columns in a CREATE TABLE statement.	f
5	11	1z0-071	E.A scalar subquery expression that returns zero rows evaluates to NULL.Most Voted	t
6	11	1z0-071	F.They cannot be used in GROUP BY clauses.Most Voted	t
1	12	1z0-071	A.Use the DEFINE command before executing the query.Most Voted	t
2	12	1z0-071	B.Replace '&1' with '&&1' in the query.	f
3	12	1z0-071	C.Use the UNDEFINE command before executing the query.	f
4	12	1z0-071	D.Execute the SET VERIFY OFF command before executing the query.	f
5	12	1z0-071	E.Execute the SET VERIFY ON command before executing the query.	f
6	12	1z0-071	F.Store the query in a script and pass the substitution value to the script when executing it.Most Voted	t
1	13	1z0-071	A.GRANT UPDATE ON customers.title, customers.address TO andrew;	f
2	13	1z0-071	B.GRANT UPDATE (title, address) ON customers TO andrew;	f
3	13	1z0-071	C.GRANT UPDATE (title, address) ON customers TO andrew WITH GRANT OPTION;Most Voted	t
4	13	1z0-071	D.GRANT UPDATE ON customers.title, customers.address TO andrew WITH ADMIN OPTION;	f
3	66	1z0-071	C.0 rows	f
5	13	1z0-071	E.GRANT UPDATE ON customers.title, customers.address TO andrew WITH GRANT OPTION;	f
6	13	1z0-071	F.GRANT UPDATE (title, address) ON customers TO andrew WITH ADMIN OPTION;	f
1	14	1z0-071	A.It will remove the DEPARTMENTS table from the database.Most Voted	t
2	14	1z0-071	B.It will drop all indexes on the DEPARTMENTS table.Most Voted	t
3	14	1z0-071	C.It will remove all views that are based on the DEPARTMENTS table.	f
4	14	1z0-071	D.It will remove all synonyms for the DEPARTMENTS table.	f
5	14	1z0-071	E.Neither can it be rolled back nor can the DEPARTMENTS table be recovered.Most Voted	t
6	14	1z0-071	F.It will delete all rows from the DEPARTMENTS table, but retain the empty table.	f
1	15	1z0-071	A.It requires that data be contained in hierarchical data storage.	f
2	15	1z0-071	B.It best supports relational databases.	f
3	15	1z0-071	C.It provides independence for logical data structures being manipulated from the underlying physical data storage.	f
4	15	1z0-071	D.It is the only language that can be used for both relational and object-oriented databases.	f
5	15	1z0-071	E.It guarantees atomicity, consistency, isolation, and durability (ACID) features.	f
6	15	1z0-071	F.It is used to define encapsulation and polymorphism for a relational table.	f
1	16	1z0-071	A.Any user can create a PUBLIC synonym.	f
2	16	1z0-071	B.A synonym has an object number.Most Voted	t
3	16	1z0-071	C.All private synonym names must be unique in the database.	f
4	16	1z0-071	D.A synonym can be created on an object in a package.	f
5	16	1z0-071	E.A synonym can have a synonym.Most Voted	t
1	17	1z0-071	A.TRUNC(MOD(25,3),-1) is invalid.	f
2	17	1z0-071	B.ROUND(MOD(25,3),-1) is invalid.	f
3	17	1z0-071	C.ROUND(MOD(25,3),-1) and TRUNC(MOD(25,3),-1) are both valid and give the same result.Most Voted	t
4	17	1z0-071	D.ROUND(MOD(25,3),-1) and TRUNC(MOD(25,3),-1) are both valid but give different results.	f
1	18	1z0-071	A.DML statements always start new transactions.	f
2	18	1z0-071	B.DDL statements automatically commit only data dictionary updates caused by executing the DDL.	f
3	18	1z0-071	C.A session can see uncommitted updates made by the same user in a different session.	f
4	18	1z0-071	D.A DDL statement issued by a session with an uncommitted transaction automatically commits that transaction.Most Voted	t
5	18	1z0-071	E.An uncommitted transaction is automatically committed when the user exits SQL*Plus.Most Voted	t
1	19	1z0-071	A.ORDER BY 1, 2	f
2	19	1z0-071	B.ORDER BY 1, lname DESCMost Voted	t
3	19	1z0-071	C.WHERE city IN ('%AN%')	f
4	19	1z0-071	D.WHERE city = '%AN%'	f
5	19	1z0-071	E.WHERE city LIKE '%AN%'Most Voted	t
6	19	1z0-071	F.ORDER BY last_name DESC, city ASC	f
1	20	1z0-071	A.the access driver TYPE clause	f
2	20	1z0-071	B.the DEFAULT DIRECTORY clauseMost Voted	t
3	20	1z0-071	C.the REJECT LIMIT clause	f
4	20	1z0-071	D.the LOCATION clauseMost Voted	t
5	20	1z0-071	E.the ACCESS PARAMETERS clause	f
1	21	1z0-071	A.A query can return data from unused columns, but no DML is possible on those columns.	f
2	21	1z0-071	B.Unused columns retain their data until they are dropped.Most Voted	t
3	21	1z0-071	C.Once a column has been set to unused, a new column with the same name can be added to the table.Most Voted	t
4	21	1z0-071	D.The DESCRIBE command displays unused columns.	f
5	21	1z0-071	E.A primary key column cannot be set to unused.	f
6	21	1z0-071	F.A foreign key column cannot be set to unused.	f
1	22	1z0-071	A.|| has a higher order of precedence than + (addition).	f
2	22	1z0-071	B.+ (addition) has a higher order of precedence than * (multiplication).	f
3	22	1z0-071	C.NOT has a higher order of precedence than AND and OR in a condition.Most Voted	t
4	22	1z0-071	D.AND and OR have the same order of precedence in a condition.	f
5	22	1z0-071	E.Operators are evaluated before conditions.Most Voted	t
1	23	1z0-071	A.SELECT TO_CHAR(TO_DATE('29-10-2019') + INTERVAL '2' MONTH + INTERVAL '4' DAY - INTERVAL '120' SECOND, 'DD-MON-YYYY') AS "date" FROM DUAL;	f
2	23	1z0-071	B.SELECT TO_CHAR(TO_DATE('29-10-2019') + INTERVAL '3' MONTH + INTERVAL '7' DAY - INTERVAL '360' SECOND, 'DD-MON-YYYY') AS "date" FROM DUAL;	f
3	23	1z0-071	C.SELECT TO_CHAR(TO_DATE('29-10-2019') + INTERVAL '2' MONTH + INTERVAL '5' DAY - INTERVAL '120' SECOND, 'DD-MON-YYYY') AS "date" FROM DUAL;Most Voted	t
4	23	1z0-071	D.SELECT TO_CHAR(TO_DATE('29-10-2019') + INTERVAL '2' MONTH + INTERVAL '5' DAY - INTERVAL '86410' SECOND, 'DD-MON- YYYY') AS "date" FROM DUAL;	f
5	23	1z0-071	E.SELECT TO_CHAR(TO_DATE('29-10-2019') + INTERVAL '2' MONTH + INTERVAL '6' DAY - INTERVAL '120' SECOND, 'DD-MON-YYYY') AS "date" FROM DUAL;	f
5	24	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0001600003.png	f
7	24	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0001600004.png	f
9	24	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0001600005.png	f
11	24	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0001700001.png	f
1	25	1z0-071	A.SELECT prod_id FROM sales WHERE quantity_sold > 55000 AND COUNT(*) > 10 GROUP BY COUNT(*) > 10;	f
2	25	1z0-071	B.SELECT prod_id FROM sales WHERE quantity_sold > 55000 GROUP BY prod_id HAVING COUNT(*) > 10;Most Voted	t
3	25	1z0-071	C.SELECT COUNT(prod_id) FROM sales GROUP BY prod_id WHERE quantity_sold > 55000;	f
4	25	1z0-071	D.SELECT prod_id FROM sales WHERE quantity_sold > 55000 AND COUNT(*) > 10 GROUP BY prod_id HAVING COUNT(*) > 10;	f
5	25	1z0-071	E.SELECT COUNT(prod_id) FROM sales WHERE quantity_sold > 55000 GROUP BY prod_id;Most Voted	t
1	26	1z0-071	A.They return a single result row per table.	f
2	26	1z0-071	B.They can be nested to any level.Most Voted	t
3	26	1z0-071	C.They can accept only one argument.	f
4	26	1z0-071	D.The argument can be a column name, variable, literal or an expression.Most Voted	t
5	26	1z0-071	E.They can be used only in the WHERE clause of a SELECT statement.	f
6	26	1z0-071	F.The data type returned can be different from the data type of the argument.Most Voted	t
1	27	1z0-071	A.USER_TABLES displays all tables owned by the current user.Most Voted	t
2	27	1z0-071	B.You must have ANY TABLE system privileges, or be granted object privileges on the table, to view a table in USER_TABLES.	f
3	27	1z0-071	C.All users can query DBA_TABLES successfully.	f
4	27	1z0-071	D.You must have ANY TABLE system privileges, or be granted object privileges on the table, to view a table in DBA_TABLES.	f
5	27	1z0-071	E.ALL_TABLES displays all tables owned by the current user.	f
6	27	1z0-071	F.You must have ANY TABLE system privileges, or be granted object privileges on the table, to view a table in ALL_TABLES.Most Voted	t
1	28	1z0-071	A.Each row returned by the subquery can be inserted into only a single target table.	f
2	28	1z0-071	B.A single WHEN condition can be used for multiple INTO clauses.Most Voted	t
3	28	1z0-071	C.Each WHEN condition is tested for each row returned by the subquery.Most Voted	t
4	28	1z0-071	D.It cannot have an ELSE clause.	f
5	28	1z0-071	E.The total number of rows inserted is always equal to the number of rows returned by the subquery.	f
1	29	1z0-071	A.COUNT(*) returns the number of rows in a table including duplicate rows and rows containing NULLs in any column.Most Voted	t
2	29	1z0-071	B.It can only be used for NUMBER data types.	f
3	29	1z0-071	C.COUNT(DISTINCT inv_amt) returns the number of rows excluding rows containing duplicates and NULLs in the INV_AMT column.Most Voted	t
4	29	1z0-071	D.COUNT(inv_amt) returns the number of rows in a table including rows with NULL in the INV_AMT column	f
5	29	1z0-071	E.A SELECT statement using the COUNT function with a DISTINCT keyword cannot have a WHERE clause.	f
1	30	1z0-071	A.SELECT emp_id, ADD_MONTHS(hire_date, 6), NEXT_DAY('MONDAY') FROM employees;	f
2	30	1z0-071	B.SELECT emp_id, NEXT_DAY(ADD_MONTHS(hire_date, 6), 1) FROM employees;	f
3	30	1z0-071	C.SELECT emp_id, NEXT_DAY(MONTHS_BETWEEN(hire_date, SYSDATE), 6) FROM employees;	f
4	30	1z0-071	D.SELECT emp_id, NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY') FROM employees;Most Voted	t
1	31	1z0-071	A.GLOBAL TEMPORARY TABLE space allocation occurs at session start.	f
2	31	1z0-071	B.GLOBAL TEMPORARY TABLE rows inserted by a session are available to any other session whose user has been granted select on the table.	f
3	31	1z0-071	C.A TRUNCATE command issued in a session causes all rows in a GLOBAL TEMPORARY TABLE for the issuing session to be deleted.Most Voted	t
4	31	1z0-071	D.Any GLOBAL TEMPORARY TABLE rows existing at session termination will be deleted.Most Voted	t
5	31	1z0-071	E.A DELETE command on a GLOBAL TEMPORARY TABLE cannot be rolled back.	f
6	31	1z0-071	F.A GLOBAL TEMPORARY TABLE'S definition is available to multiple sessions.Most Voted	t
1	32	1z0-071	A.It displays values for variables used only in the WHERE clause of a query.	f
2	32	1z0-071	B.It displays values for variables created by the DEFINE command.Most Voted	t
3	32	1z0-071	C.It can be used only in SQL*Plus.	f
4	32	1z0-071	D.It displays values for variables prefixed with &&.	f
5	32	1z0-071	E.It can be used in SQL Developer and SQL*Plus.Most Voted	t
1	33	1z0-071	A.CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 CYCLE;	f
2	33	1z0-071	B.CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 CACHE;	f
3	33	1z0-071	C.CREATE SEQUENCE emp_seq;	f
4	33	1z0-071	D.CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 NOCACHE;Most Voted	t
5	33	1z0-071	E.CREATE SEQUENCE emp_seq NOCACHE;Most Voted	t
6	33	1z0-071	F.CREATE SEQUENCE emp_seq START WITH 1 CACHE;	f
1	34	1z0-071	A.SELECT 1 - SYSDATE - DATE '2019-01-01' FROM DUAL;	f
2	34	1z0-071	B.SELECT SYSDATE - DATE '2019-01-01' - 1 FROM DUAL;Most Voted	t
3	34	1z0-071	C.SELECT SYSDATE / DATE '2019-01-01' - 1 FROM DUAL;	f
4	34	1z0-071	D.SELECT SYSDATE - 1 - DATE '2019-01-01' FROM DUAL;Most Voted	t
5	34	1z0-071	E.SELECT (SYSDATE - DATE '2019-01-01') / 1 FROM DUAL;Most Voted	t
6	34	1z0-071	F.SELECT 1 / SYSDATE - DATE '2019-01-01' FROM DUAL;	f
1	35	1z0-071	A.INSERT can be granted only on tables and sequences.	f
2	35	1z0-071	B.DELETE can be granted on tables, views, and sequences.	f
3	35	1z0-071	C.SELECT can be granted on tables, views, and sequences.Most Voted	t
4	35	1z0-071	D.ALTER can be granted only on tables and sequences.Most Voted	t
5	35	1z0-071	E.REFERENCES can be granted only on tables.	f
1	36	1z0-071	A.The second ROLLBACK command replays the delete.	f
2	36	1z0-071	B.The first ROLLBACK command restores the 101 rows that were deleted and commits the inserted row.	f
3	36	1z0-071	C.The first ROLLBACK command restores the 101 rows that were deleted, leaving the inserted row still to be committed.Most Voted	t
4	36	1z0-071	D.The second ROLLBACK command undoes the insert.Most Voted	t
5	36	1z0-071	E.The second ROLLBACK command does nothing.	f
1	37	1z0-071	A.A table can have multiple primary keys.	f
2	37	1z0-071	B.A column definition can specify multiple data types.	f
3	37	1z0-071	C.A table can have multiple foreign keys.Most Voted	t
4	37	1z0-071	D.A VARCHAR2 column without data has a NULL value.Most Voted	t
5	37	1z0-071	E.A NUMBER column without data has a zero value.	f
1	38	1z0-071	A.An alias name must not contain space characters.	f
2	38	1z0-071	B.An alias name must always be specified in quotes.	f
3	38	1z0-071	C.An alias name must not be used in an ORDER BY clause.	f
4	38	1z0-071	D.An alias name must not be used in a GROUP BY clause.Most Voted	t
1	39	1z0-071	A.Create roles.	f
2	39	1z0-071	B.Create FOREIGN KEY constraints that reference tables in other schemas.Most Voted	t
3	39	1z0-071	C.Delete rows from tables in any schema except SYS.	f
4	39	1z0-071	D.Set default and temporary tablespaces for a user.	f
5	39	1z0-071	E.Execute a procedure or function in another schema.Most Voted	t
1	40	1z0-071	A.ROLLBACK without the TO SAVEPOINT clause undoes all the transaction's changes, releases its locks, and erases all its savepoints.Most Voted	t
2	40	1z0-071	B.ROLLBACK without the TO SAVEPOINT clause undoes all the transaction's changes but does not release its locks.	f
3	40	1z0-071	C.ROLLBACK without the TO SAVEPOINT clause undoes all the transaction's changes but does not erase its savepoints.	f
4	40	1z0-071	D.ROLLBACK TO SAVEPOINT undoes the transaction's changes made since the named savepoint and then ends the transaction.	f
5	40	1z0-071	E.COMMIT ends the transaction and makes all its changes permanent.Most Voted	t
6	40	1z0-071	F.COMMIT erases all the transaction's savepoints and releases its locks.Most Voted	t
3	41	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0002600001.png	f
5	41	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0002600002.png	f
7	41	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0002600003.png	f
9	41	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0002700001.png	f
1	42	1z0-071	A.A column must be set as unused before it is dropped from a table.	f
2	42	1z0-071	B.A primary key column cannot be dropped.	f
3	42	1z0-071	C.Multiple columns can be dropped simultaneously using the ALTER TABLE command.Most Voted	t
4	42	1z0-071	D.A column can be removed only if it contains no data.	f
5	42	1z0-071	E.A column that is referenced by another column in any other table cannot be dropped.	f
6	42	1z0-071	F.A column drop is implicitly committed.Most Voted	t
1	43	1z0-071	A.A SELECT statement cannot contain a WHERE clause when querying a view containing a WHERE clause in its defining query.	f
2	43	1z0-071	B.Views have no segment.Most Voted	t
3	43	1z0-071	C.Views have no object number.	f
4	43	1z0-071	D.Views can join tables only if they belong to the same schema.	f
5	43	1z0-071	E.A view can be created that refers to a non-existent table in its defining query.Most Voted	t
6	43	1z0-071	F.Rows inserted into a table using a view are retained in the table if the view is dropped.Most Voted	t
1	44	1z0-071	A.To drop the table in this session, you must first truncate it.Most Voted	t
2	44	1z0-071	B.Other sessions can view the committed row.	f
3	44	1z0-071	C.You can add a column to the table in this session.	f
4	44	1z0-071	D.You can add a foreign key to the table.	f
5	44	1z0-071	E.When you terminate your session, the row will be deleted.Most Voted	t
1	45	1z0-071	A.The names of employees earning the maximum salary will appear first in an unspecified order.	f
2	45	1z0-071	B.All remaining employee names will appear in descending order.	f
3	45	1z0-071	C.All remaining employee names will appear in an unspecified order.	f
4	45	1z0-071	D.All remaining employee names will appear in ascending order.Most Voted	t
5	45	1z0-071	E.The names of employees earning the maximum salary will appear first in ascending order.	f
6	45	1z0-071	F.The names of employees earning the maximum salary will appear first in descending order.Most Voted	t
1	46	1z0-071	A.When creating an external table, data can be selected only from a table whose rows are stored in database blocks.	f
2	46	1z0-071	B.Creating an external table creates a directory object.	f
3	46	1z0-071	C.When creating an external table, data can be selected from another external table or from a table whose rows are stored in database blocks.Most Voted	t
4	46	1z0-071	D.Creating an external table creates a dump file that can be used by an external table in the same or a different database.Most Voted	t
5	46	1z0-071	E.Creating an external table creates a dump file that can be used only by an external table in the same database.	f
3	47	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0003100002.png	f
5	47	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0003100003.png	f
7	47	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0003100004.png	f
9	47	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0003200001.png	f
8	48	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0003300001.png	f
10	48	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0003300002.png	f
12	48	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0003300003.png	f
14	48	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0003300004.png	f
7	49	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0003400002.png	f
9	49	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0003400003.png	f
11	49	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0003400004.png	f
13	49	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0003500001.png	f
1	50	1z0-071	A.EXPIRY_DATE contains the SYSDATE by default if no date is assigned to it.	f
2	50	1z0-071	B.PRODUCT_PRICE can be used in an arithmetic expression even if it has no value stored in it.Most Voted	t
3	50	1z0-071	C.PRODUCT_NAME cannot contain duplicate values.	f
4	50	1z0-071	D.EXPIRY_DATE cannot be used in arithmetic expressions.	f
5	50	1z0-071	E.PRODUCT_PRICE contains the value zero by default if no value is assigned to it.	f
6	50	1z0-071	F.PRODUCT_ID can be assigned the PRIMARY KEY constraint.Most Voted	t
3	51	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0003600002.png	f
5	51	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0003600003.png	f
7	51	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0003600004.png	f
9	51	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0003600005.png	f
1	52	1z0-071	A.SELECT * FROM TABLE(123);	f
2	52	1z0-071	B.SELECT * FROM "123";Most Voted	t
3	52	1z0-071	C.SELECT * FROM \\'123\\';	f
4	52	1z0-071	D.SELECT * FROM '123';	f
1	53	1z0-071	A.An update to a table can result in updates to any or all of the table's indexes.Most Voted	t
2	53	1z0-071	B.An update to a table can result in no updates to any of the table's indexes.Most Voted	t
3	53	1z0-071	C.A UNIQUE index can be altered to be non-unique.	f
4	53	1z0-071	D.When a table is dropped and is moved to the RECYCLE BIN, all indexes built on that table are permanently dropped.	f
5	53	1z0-071	E.A table belonging to one user cannot have an index that belongs to a different user.	f
1	54	1z0-071	A.The name of each column in the first SELECT list must match the name of the corresponding column in each subsequent SELECT list.	f
2	54	1z0-071	B.None of the set operators can be used when selecting CLOB columns.	f
3	54	1z0-071	C.There must be an equal number of columns in each SELECT list.Most Voted	t
4	54	1z0-071	D.Each SELECT statement in the query can have an ORDER BY clause.	f
5	54	1z0-071	E.The FOR UPDATE clause cannot be specified.Most Voted	t
2	55	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0003900001.png	f
4	55	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0003900002.png	f
8	55	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0003900004.png	f
1	56	1z0-071	A.Two or more values are always returned from the subquery.	f
2	56	1z0-071	B.They can contain HAVING clauses.Most Voted	t
3	56	1z0-071	C.They can contain GROUP BY clauses.Most Voted	t
4	56	1z0-071	D.They can return multiple columns.Most Voted	t
5	56	1z0-071	E.They cannot contain a subquery.	f
1	57	1z0-071	A.Increase the width of a numeric column.Most Voted	t
2	57	1z0-071	B.Add a new column as the table's first column.	f
3	57	1z0-071	C.Define a default value that is automatically inserted into a column containing nulls.	f
4	57	1z0-071	D.Change a DATE column containing data to a NUMBER data type.	f
5	57	1z0-071	E.Change the default value of a column.Most Voted	t
6	57	1z0-071	F.Add a new NOT NULL column with a DEFAULT value.Most Voted	t
1	58	1z0-071	A.Rows from unrelated tables cannot be joined.	f
2	58	1z0-071	B.Relating data from a table with data from the same table is implemented with a self join.	f
3	58	1z0-071	C.Implementing a relationship between two tables might require joining additional tables.	f
4	58	1z0-071	D.Every relationship between the two tables must be implemented in a join condition.	f
5	58	1z0-071	E.An inner join relates rows within the same table.	f
1	59	1z0-071	A.Roles are assigned to users using the ALTER USER statement.	f
2	59	1z0-071	B.Privileges are assigned to a role using the GRANT statement.Most Voted	t
3	59	1z0-071	C.A role is a named group of related privileges that can only be assigned to a user.	f
4	59	1z0-071	D.A single user can be assigned multiple roles.Most Voted	t
5	59	1z0-071	E.Privileges are assigned to a role using the ALTER ROLE statement.	f
6	59	1z0-071	F.Roles are assigned to roles using the ALTER ROLE statement.	f
7	59	1z0-071	G.A single role can be assigned to multiple users.Most Voted	t
1	60	1z0-071	A.invoice_date = '15-march-2019' : uses implicit conversionMost Voted	t
2	60	1z0-071	B.qty_sold BETWEEN '101' AND '110' : uses implicit conversionMost Voted	t
3	60	1z0-071	C.invoice_date > '01-02-2019' : uses implicit conversion	f
4	60	1z0-071	D.qty_sold = '0554982' : requires explicit conversion	f
5	60	1z0-071	E.CONCAT (qty_sold, invoice_date) : requires explicit conversion	f
1	61	1z0-071	A.A full outer join returns matched and unmatched rows.Most Voted	t
2	61	1z0-071	B.Outer joins can be used when there are multiple join conditions on two tables.Most Voted	t
3	61	1z0-071	C.A full outer join must use Oracle syntax.	f
4	61	1z0-071	D.Outer joins can only be used between two tables per query.	f
5	61	1z0-071	E.A left or right outer join returns only unmatched rows.	f
6	61	1z0-071	F.An inner join returns matched rows.Most Voted	t
1	62	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0004200001.png	f
3	62	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0004300001.png	f
5	62	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0004300002.png	f
7	62	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0004300003.png	f
3	63	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0004400001.png	f
5	63	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0004400002.png	f
7	63	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0004400003.png	f
9	63	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0004400004.png	f
1	64	1z0-071	A.The Oracle join syntax supports creation of a Cartesian product of two tables.Most Voted	t
2	64	1z0-071	B.The Oracle join syntax only supports right outer joins.	f
3	64	1z0-071	C.The SQL:1999 compliant ANSI join syntax supports creation of a Cartesian product of two tables.Most Voted	t
4	64	1z0-071	D.The Oracle join syntax performs less well than the SQL:1999 compliant ANSI join syntax.	f
5	64	1z0-071	E.The Oracle join syntax supports natural joins.	f
6	64	1z0-071	F.The Oracle join syntax performs better than the SQL:1999 compliant ANSI join syntax.	f
7	64	1z0-071	G.The SQL:1999 compliant ANSI join syntax supports natural joins.Most Voted	t
1	65	1z0-071	A.NVL must have expressions of the same data type.	f
2	65	1z0-071	B.NVL can have any number of expressions in the list.	f
3	65	1z0-071	C.NVL2 can have any number of expressions in the list.	f
4	65	1z0-071	D.COALESCE stops evaluating the list of expressions when it finds the first non-null value.Most Voted	t
5	65	1z0-071	E.The first expression in NVL2 is never returned.Most Voted	t
6	65	1z0-071	F.COALESCE stops evaluating the list of expressions when it finds the first null value.	f
1	66	1z0-071	A.an error	f
2	66	1z0-071	B.2 rows	f
4	66	1z0-071	D.1 rowMost Voted	t
1	67	1z0-071	A.an error	f
2	67	1z0-071	B.2 rows	f
3	67	1z0-071	C.0 rows	f
4	67	1z0-071	D.1 rowMost Voted	t
1	68	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0004700001.png	f
3	68	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0004700002.png	f
5	68	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0004700003.png	f
7	68	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0004700004.png	f
1	69	1z0-071	A.when a CREATE TABLE AS SELECT statement is issued in the same session but fails with a syntax error	f
2	69	1z0-071	B.when a DBA issues a successful SHUTDOWN TRANSACTIONAL statement and the user then issues a COMMITMost Voted	t
3	69	1z0-071	C.when the session logs out successfullyMost Voted	t
4	69	1z0-071	D.when a CREATE INDEX statement is executed successfully in the same sessionMost Voted	t
5	69	1z0-071	E.when a DBA issues a successful SHUTDOWN IMMEDIATE statement and the user then issues a COMMIT	f
6	69	1z0-071	F.when a COMMIT statement is issued by the same user from another session in the same database instance	f
1	70	1z0-071	A.NOT NULL can be specified at the column and at the table level.	f
2	70	1z0-071	B.A table can have only one PRIMARY KEY and one FOREIGN KEY constraint.	f
3	70	1z0-071	C.A FOREIGN KEY column in a child table and the referenced PRIMARY KEY column in the parent table must have the same names.	f
4	70	1z0-071	D.PRIMARY KEY and FOREIGN KEY constraints can be specified at the column and at the table level.Most Voted	t
5	70	1z0-071	E.A table can have multiple PRIMARY KEY and multiple FOREIGN KEY constraints.	f
6	70	1z0-071	F.A table can have only one PRIMARY KEY but may have multiple FOREIGN KEY constraints.Most Voted	t
1	71	1z0-071	A.ORDER_IDMost Voted	t
2	71	1z0-071	B.ORDER_TOTAL	f
3	71	1z0-071	C.ORDER_DATE	f
4	71	1z0-071	D.PRODUCT_ID	f
5	71	1z0-071	E.STATUS	f
6	71	1z0-071	F.SERIAL_NOMost Voted	t
1	72	1z0-071	A.GROUP BY ch.channel_type, ROLLUP(t.month, co.country_code);Most Voted	t
2	72	1z0-071	B.GROUP BY ch.channel_type, t.month, ROLLUP(co.country_code);	f
3	72	1z0-071	C.GROUP BY CUBE(ch.channel_type, t.month, co.country_code);	f
4	72	1z0-071	D.GROUP BY ch.channel_type, t.month, co.country_code;	f
1	73	1z0-071	A.SELECT first_name, DISTINCT last_name FROM employees WHERE first_name <> NULL;	f
2	73	1z0-071	B.SELECT first_name, DISTINCT last_name FROM employees WHERE first_name IS NOT NULL;	f
3	73	1z0-071	C.SELECT DISTINCT * FROM employees WHERE first_name IS NOT NULL;Most Voted	t
4	73	1z0-071	D.SELECT DISTINCT * FROM employees WHERE first_name <> NULL;	f
5	74	1z0-071	A. https://www.examtopics.com/assets/media/exam-media/04351/0005200003.png	f
7	74	1z0-071	B. https://www.examtopics.com/assets/media/exam-media/04351/0005200004.png	f
9	74	1z0-071	C. https://www.examtopics.com/assets/media/exam-media/04351/0005200005.png	f
11	74	1z0-071	D. https://www.examtopics.com/assets/media/exam-media/04351/0005300001.png	f
1	75	1z0-071	A.Employees 100 and 200 will have the same SALARY as before the update command.	f
2	75	1z0-071	B.Employee 100 will have JOB_ID set to the same value as the JOB_ID of employee 200.Most Voted	t
3	75	1z0-071	C.Employee 200 will have JOB_ID set to the same value as the JOB_ID of employee 100.	f
4	75	1z0-071	D.Employees 100 and 200 will have the same JOB_ID as before the update command.	f
5	75	1z0-071	E.Employee 100 will have SALARY set to the same value as the SALARY of employee 200.Most Voted	t
6	75	1z0-071	F.Employee 200 will have SALARY set to the same value as the SALARY of employee 100.	f
1	76	1z0-071	A.64	f
2	76	1z0-071	B.6Most Voted	t
3	76	1z0-071	C.3	f
4	76	1z0-071	D.12	f
1	77	1z0-071	A.SYSDATE	f
2	77	1z0-071	B.CURRENT_TIMESTAMPMost Voted	t
3	77	1z0-071	C.LOCALTIMESTAMP	f
4	77	1z0-071	D.CURRENT_DATE	f
1	78	1z0-071	A.INTERVAL YEAR TO MONTH	f
2	78	1z0-071	B.TIMESTAMP WITH TIMEZONE	f
3	78	1z0-071	C.INTERVAL DAY TO SECONDMost Voted	t
4	78	1z0-071	D.TIMESTAMP WITH LOCAL TIMEZONE	f
5	78	1z0-071	E.TIMESTAMP	f
1	79	1z0-071	A.The data type group of each column returned by the second query must match the data type group of the corresponding column returned by the first query.Most Voted	t
2	79	1z0-071	B.The names and number of columns must be identical for all select statements in the query.	f
3	79	1z0-071	C.The data type of each column returned by the second query must be implicitly convertible to the data type of the corresponding column returned by the first query.	f
4	79	1z0-071	D.The data type of each column returned by the second query must exactly match the data type of the corresponding column returned by the first query.	f
5	79	1z0-071	E.The number, but not names, of columns must be identical for all select statements in the query.Most Voted	t
1	80	1z0-071	A.In a query containing multiple set operators, INTERSECT always takes precedence over UNION and UNION ALL.	f
2	80	1z0-071	B.An expression in the first SELECT list must have a column alias for the expression.	f
3	80	1z0-071	C.All set operators are valid on columns of all data types.	f
4	80	1z0-071	D.CHAR columns of different lengths used with a set operator return a VARCHAR2 whose length equals the longest char value.Most Voted	t
5	80	1z0-071	E.Queries using set operators do not perform implicit conversion across data type groups (e.g. character, numeric).Most Voted	t
1	81	1z0-071	A.PROJECT_ID must be the primary key in the PROJECTS entity and foreign key in the STUDENTS entity.	f
2	81	1z0-071	B.STUDENT_ID must be the primary key in the STUDENTS entity and foreign key in the projects entity.	f
5	94	1z0-071	E.Tables in the defining query of a view must always exist in order to create the view.	f
1	249	1z0-071	A.self joinMost Voted	t
3	81	1z0-071	C.An associative table must be created with a composite key of STUDENT_ID and PROJECT_ID, which is the foreign key linked to the students and projects entities.Most Voted	t
4	81	1z0-071	D.The ER must have a many-to-many relationship between the STUDENTS and PROJECTS entities that must be resolved into one-to-many relationships.Most Voted	t
5	81	1z0-071	E.The ER must have a one-to-many relationship between the STUDENTS and PROJECTS entities.	f
1	82	1z0-071	A.an activity	f
2	82	1z0-071	B.a table	f
3	82	1z0-071	C.a relationshipMost Voted	t
4	82	1z0-071	D.an attributeMost Voted	t
5	82	1z0-071	E.a unique identifier	f
6	82	1z0-071	F.an entityMost Voted	t
1	83	1z0-071	A.2	f
2	83	1z0-071	B.1Most Voted	t
3	83	1z0-071	C.3	f
4	83	1z0-071	D.5 01-MAR-2019	f
5	83	1z0-071	E.3 01-JAN-2015	f
6	83	1z0-071	F.4 01-FEB-2015Most Voted	t
1	84	1z0-071	A.SELECT COALESCE(0, SYSDATE) FROM DUAL;	f
2	84	1z0-071	B.SELECT NVL('DATE', SYSDATZ) FROM DUAL;Most Voted	t
3	84	1z0-071	C.SELECT COALESCE('DATE', SYSDATE) FROM DUAL;	f
4	84	1z0-071	D.SELECT NVL('DATE', 200) FROM (SELECT NULL AS "DATE" FROM DUAL);Most Voted	t
5	84	1z0-071	E.SELECT COALESCE('DATE', SYSDATE) FRCM (SELECT NULL AS "DATE" FROM DUAL);	f
1	85	1z0-071	A.It must be an equijoin.	f
2	85	1z0-071	B.The ON clause must be used.	f
3	85	1z0-071	C.It must be an inner join.	f
4	85	1z0-071	D.It can be an outer join.Most Voted	t
5	85	1z0-071	E.The ON clause can be used.Most Voted	t
6	85	1z0-071	F.The query must use two different aliases for the table.Most Voted	t
1	86	1z0-071	A.It executes successfully but does not return any result.	f
2	86	1z0-071	B.It returns the date for the first Monday of the next month.Most Voted	t
3	86	1z0-071	C.It returns the date for the last Monday of the current month.	f
4	86	1z0-071	D.It generates an error.	f
1	87	1z0-071	A.WHERE and HAVING clauses can be used in the same statement only if applied to different table columns.	f
2	87	1z0-071	B.The WHERE clause can be used to exclude rows after dividing them into groups.	f
3	87	1z0-071	C.The HAVING clause can be used with aggregating functions in subqueries.Most Voted	t
4	87	1z0-071	D.The WHERE clause can be used to exclude rows before dividing them into groups.Most Voted	t
5	87	1z0-071	E.Aggregating functions and columns used in HAVING clauses must be specified in the SELECT list of a query.	f
1	88	1z0-071	A.Indexes can be created on them.Most Voted	t
2	88	1z0-071	B.Backup and recovery operations are available for these tables.	f
3	88	1z0-071	C.Their data is always stored in the default temporary tablespace of the user who created them.	f
4	88	1z0-071	D.If the ON COMMIT clause is transaction-specific, all rows in the table are deleted after each COMMIT OR ROLLBACK.Most Voted	t
5	88	1z0-071	E.They can be created only by a user with the DBA role, but can be accessed by all users who can create a session.	f
6	88	1z0-071	F.If the ON COMMIT clause is session-specific, the table is dropped when the session is terminated.	f
1	89	1z0-071	A.A combination of object and system privileges can be granted to a role.Most Voted	t
2	89	1z0-071	B.All types of schema objects have associated object privileges.	f
3	89	1z0-071	C.Schema owners can grant object privileges on objects in their schema to any other user or role.Most Voted	t
4	89	1z0-071	D.Only users with the DBA role can create roles.	f
5	89	1z0-071	E.Only users with the GRANT ANY PRIVILEGE privilege can grant and revoke system privileges from other users.	f
6	89	1z0-071	F.Object privileges granted on a table automatically apply to all synonyms for that table.Most Voted	t
1	90	1z0-071	A.INSERT INTO employees VALUES (101, 'John', 'Smith', 12000, SYSDATE);	f
2	90	1z0-071	B.INSERT INTO employees VALUES (101, 'John', 'Smith', 10, 12000, SYSDATE);	f
3	90	1z0-071	C.INSERT INTO employees (employee_id, salary, first_name, hiredate, last_name) VALUES (101, 12100, 'John', SYSDATE, 'Smith');Most Voted	t
4	90	1z0-071	D.INSERT INTO employees (employee_id, first_name, last_name, salary, hiresate)VALUES ( (SELECT 101, 'John', 'Smith'. 12000, SYSDATE FROM dual) );	f
5	90	1z0-071	E.INSERT INTO employees SELECT 101, 'John', 'Smith', 12000, (SELECT SYSDATE FROM dual), 10 FROM dual;Most Voted	t
6	90	1z0-071	F.INSERT INTO employees VALUES (101, 'John', ' ', 12000, SYSDATE, 10);	f
1	91	1z0-071	A.The structure of the TEST table is removed.	f
2	91	1z0-071	B.All the indexes on the TEST table are dropped.	f
3	91	1z0-071	C.All the constraints on the TEST table are dropped.	f
4	91	1z0-071	D.Removed rows can not be recovered using the ROLLBACK command.Most Voted	t
5	91	1z0-071	E.All the rows in the TEST table are removed.Most Voted	t
1	92	1z0-071	A.Sequences used to populate columns in the HR.EMPLOYEES table are dropped.	f
2	92	1z0-071	B.Synonyms for HR.EMPLOYEES are dropped.	f
3	92	1z0-071	C.Views referencing HR.EMPLOYEES are dropped.	f
4	92	1z0-071	D.All constraints defined on HR.EMPLOYEES are dropped.Most Voted	t
5	92	1z0-071	E.The HR.EMPLOYEES table may be moved to the recycle bin.Most Voted	t
6	92	1z0-071	F.All indexes defined on HR.EMPLOYEES are droppedMost Voted	t
1	93	1z0-071	A.ORDER BY CUST_NO	f
2	93	1z0-071	B.ORDER BY 2, cust_idMost Voted	t
3	93	1z0-071	C.ORDER BY 2, 1Most Voted	t
4	93	1z0-071	D.ORDER BY "Last Name"Most Voted	t
5	93	1z0-071	E.ORDER BY "CUST_NO"	f
1	94	1z0-071	A.The WITH CHECK clause prevents certain rows from being updated or inserted in the underlying table through the view.Most Voted	t
2	94	1z0-071	B.The WITH CHECK clause prevents certain rows from being displayed when querying the view.	f
3	94	1z0-071	C.Views can be indexed.	f
4	94	1z0-071	D.Views can be updated without the need to re-grant privileges on the view.Most Voted	t
1	95	1z0-071	A.SELECT ‘The first_name is ‘‘ || first_name || ‘‘ FROM employees;	f
2	95	1z0-071	B.SELECT ‘The first_name is ‘‘‘ || first_name || ‘‘‘‘ FROM employees;Most Voted	t
3	95	1z0-071	C.SELECT ‘The first_name is ‘‘‘ || first_name || ‘‘‘ FROM employees;	f
4	95	1z0-071	D.SELECT ‘The first_name is ‘ || first_name || ‘‘ FROM employees;Most Voted	t
5	95	1z0-071	E.SELECT ‘The first_name is \\‘‘ || first_name || ‘\\‘‘ FROM employees;	f
1	96	1z0-071	A.Setting an indexed column to unused results in an error.	f
2	96	1z0-071	B.You can query the data dictionary to see the names of unused columns.	f
3	96	1z0-071	C.You can specify multiple column names in an ALTER TABLE...SET UNUSED statement.Most Voted	t
4	96	1z0-071	D.If you set all the columns of a table to unused, the table is automatically dropped.	f
5	96	1z0-071	E.CASCADE CONSTRAINTS must be specified when setting a column to unused if that column is referenced in a constraint on another column.Most Voted	t
1	97	1z0-071	A.WHERE INITCAP(SUBSTR(cust_name, INSTR(cust_name, ' ') + 1)) LIKE 'Mc%'Most Voted	t
2	97	1z0-071	B.WHERE SUBSTR(cust_name, INSTR(cust_name, ' ') + 1) LIKE 'Mc%'	f
3	97	1z0-071	C.WHERE SUBSTR(cust_name, INSTR(cust_name, ' ') + 1 ) LIKE 'Mc%' OR 'MC%'	f
4	97	1z0-071	D.WHERE UPPER(SUBSTR(cust_name, INSTR(cust_name, ' ') + 1)) LIKE UPPER('MC%')Most Voted	t
5	97	1z0-071	E.WHERE INITCAP(SUBSTR(cust_name, INSTR(cust_name, ' ’) + 1)) IN ('MC%', 'Mc%)	f
1	98	1z0-071	A.the first VARCHAR2 column in the first SELECT of the compound query	f
2	98	1z0-071	B.the first column in the first SELECT of the compound queryMost Voted	t
3	98	1z0-071	C.the first NUMBER column in the first SELECT of the compound query	f
4	98	1z0-071	D.the first NUMBER or VARCHAR2 column in the last SELECT of the compound query	f
5	98	1z0-071	E.the first column in the last SELECT of the compound query	f
1	99	1z0-071	A.In a character sort, the values are case-sensitive.Most Voted	t
2	99	1z0-071	B.NULLS are not included in the sort operation.	f
3	99	1z0-071	C.Numeric values are displayed in descending order if they have decimal positions.	f
4	99	1z0-071	D.Column aliases can be used in the ORDER BY clause.Most Voted	t
5	99	1z0-071	E.Only columns that are specified in the SELECT list can be used in the ORDER BY clause.	f
1	100	1z0-071	A.4	f
2	100	1z0-071	B.6Most Voted	t
3	100	1z0-071	C.16	f
4	100	1z0-071	D.0	f
5	100	1z0-071	E.1	f
6	100	1z0-071	F.10	f
1	101	1z0-071	A.an error	f
2	101	1z0-071	B.DURATION -----------+100	f
3	101	1z0-071	C.DURATION -----------+08	f
4	101	1z0-071	D.DURATION -----------+08-04Most Voted	t
1	102	1z0-071	A.150	f
2	102	1z0-071	B.200Most Voted	t
3	102	1z0-071	C.160	f
4	102	1z0-071	D.100	f
5	102	1z0-071	E.16	f
1	103	1z0-071	A.https://img.examtopics.com/1z0-071/image10.png	f
2	103	1z0-071	B.https://img.examtopics.com/1z0-071/image11.png	f
3	103	1z0-071	C.https://img.examtopics.com/1z0-071/image12.png	f
4	103	1z0-071	D.https://img.examtopics.com/1z0-071/image13.pngMost Voted	t
5	103	1z0-071	E.https://img.examtopics.com/1z0-071/image14.png	f
1	104	1z0-071	A.The same table column can be part of a unique and non-unique index.Most Voted	t
2	104	1z0-071	B.A descending index is a type of function-based index.Most Voted	t
3	104	1z0-071	C.An INVINSIBLE index is not maintained when DML is performed on its underlying table.	f
4	104	1z0-071	D.If a query filters on an indexed column then it will always be used during execution of the query.	f
5	104	1z0-071	E.An index can be created as part of a CREATE TABLE statement.Most Voted	t
6	104	1z0-071	F.An UNUSABLE index is maintained when DML is performed on its underlying table.	f
1	105	1z0-071	A.only departments where the total salary is greater than 3000, returned in no particular order	f
2	105	1z0-071	B.only departments where the total salary is greater than 3000, ordered by department	f
3	105	1z0-071	C.all departments and a sum of the salaries of employees with a salary greater than 3000	f
4	105	1z0-071	D.an error	f
1	106	1z0-071	A.They can be indexed.Most Voted	t
2	106	1z0-071	B.They can be referenced in the column expression of another virtual column.	f
3	106	1z0-071	C.They cannot have a data type explicitly specified.	f
4	106	1z0-071	D.They can be referenced in the set clause of an update statement as the name of the column to be updated.	f
5	106	1z0-071	E.They can be referenced in the where clause of an update or delete statement.Most Voted	t
1	107	1z0-071	A.SELECT TO_DATE('2019-01-01') FROM DUAL;	f
2	107	1z0-071	B.SELECT DATE '2019-01-01' FROM DUAL;Most Voted	t
3	107	1z0-071	C.SELECT '2019-01-01' FROM DUAL;	f
4	107	1z0-071	D.SELECT TO_DATE('2019-01-01', 'YYYY-MM-DD') FROM DUAL;Most Voted	t
5	107	1z0-071	E.SELECT TO_CHAR('2019-01-01') FROM DUAL;	f
1	108	1z0-071	A.The DELETE statement executes successfully even if the subquery selects multiple rows.Most Voted	t
2	108	1z0-071	B.The subquery is executed before the DELETE statement is executed.	f
3	108	1z0-071	C.The subquery is not a correlated subquery.	f
4	108	1z0-071	D.All existing rows in the EMPLOYEES table are deleted.	f
5	108	1z0-071	E.The subquery is executed for every row in the EMPLOYEES table.Most Voted	t
1	109	1z0-071	A.The SALARY column must have a value.	f
2	109	1z0-071	B.The DEPTNO column in the EMP table can contain NULLS.Most Voted	t
3	109	1z0-071	C.The COMMISION column can contain negative values.Most Voted	t
4	109	1z0-071	D.The DEPTNO column in the EMP table can contain the value 1.	f
5	109	1z0-071	E.The MANAGER column is a foreign key referencing the EMPNO column.Most Voted	t
6	109	1z0-071	F.The DNAME column has a unique constraint.	f
7	109	1z0-071	G.An index is created automatically in the MANAGER column.	f
1	110	1z0-071	A.Creating an external table will automatically create a file using the specified directory and file name.	f
2	110	1z0-071	B.A system privilege is required.Most Voted	t
3	110	1z0-071	C.The same table name can be used for tables in different schemas.Most Voted	t
4	110	1z0-071	D.A primary key constraint is mandatory.	f
5	110	1z0-071	E.A CREATE TABLE statement can specify the maximum number of rows the table will contain.	f
1	111	1z0-071	A.ORDER BY comm DESC NULLS LAST, enameMost Voted	t
2	111	1z0-071	B.ORDER BY NVL(coram, 0) ASC NULLS FIRST, ename	f
3	111	1z0-071	C.ORDER BY NVL(coram, 0) ASC NULLS LAST, ename	f
4	111	1z0-071	D.ORDER BY NVL(ccmm, 0) DESC, ename	f
1	112	1z0-071	A.SELECT customer_name FROM customers WHERE UPPER(customer_name) LIKE ‘MA*’;	f
2	112	1z0-071	B.SELECT customer_name FROM customers WHERE customer_name = ‘*Ma*’;	f
3	112	1z0-071	C.SELECT customer_name FROM customers WHERE customer_name LIKE ‘Ma*’;	f
4	112	1z0-071	D.SELECT customer_name FROM customers WHERE UPPER(customer_name) LIKE ‘MA%’;	f
5	112	1z0-071	E.SELECT customer_name FROM customers WHERE customer_name LIKE ‘%a%’;Most Voted	t
6	112	1z0-071	F.SELECT customer_name FROM customers WHERE customer_name LIKE ‘Ma%’;Most Voted	t
7	112	1z0-071	G.SELECT customer_name FROM customers WHERE customer_name LIKE ‘*Ma*’;	f
1	113	1z0-071	A.A row whose UNIT_PRICE column contains the value 10235.95 will be displayed as $1,0236.	f
2	113	1z0-071	B.A row whose UNIT_PRICE column contains the value 1023.95 will be displayed as $1,024.Most Voted	t
3	113	1z0-071	C.A row whose UNIT_PRICE column contains the value 10235.95 will be displayed as $1,023.	f
4	113	1z0-071	D.A row whose UNIT_PRICE column contains the value 10235.95 will be displayed as #######.Most Voted	t
5	113	1z0-071	E.A row whose UNIT_PRICE column contains the value 1023.99 will be displayed as $1,023.	f
1	114	1z0-071	A.Updates performed by a database user can be rolled back by another user by using the ROLLBACK command.	f
2	114	1z0-071	B.A query can access only tables within the same schema.	f
3	114	1z0-071	C.The database guarantees read consistency at select level on user-created tables.Most Voted	t
4	114	1z0-071	D.A user can be the owner of multiple schemas in the same database.	f
5	114	1z0-071	E.When you execute an update statement, the database instance locks each updated row.Most Voted	t
1	115	1z0-071	A.For tables with multiple indexes and triggers, DELETE is faster than TRUNCATE.	f
2	115	1z0-071	B.You can never TRUNCATE a table if foreign key constraints would be violated.Most Voted	t
3	115	1z0-071	C.You can DELETE rows from a table with referential integrity constraints.	f
4	115	1z0-071	D.For large tables, DELETE is faster than TRUNCATE.	f
1	116	1z0-071	A.CASE is a function and DECODE is not.	f
2	116	1z0-071	B.Neither CASE nor DECODE is a function.	f
3	116	1z0-071	C.All conditions evaluated using CASE can also be evaluated using DECODE.	f
4	116	1z0-071	D.All conditions evaluated using DECODE can also be evaluated using CASE.Most Voted	t
5	116	1z0-071	E.DECODE is a function and CASE is not.Most Voted	t
6	116	1z0-071	F.Both CASE and DECODE are functions.	f
1	117	1z0-071	A.The code for pen is 10.Most Voted	t
2	117	1z0-071	B.There is no row containing fountain pen.	f
3	117	1z0-071	C.There is no row containing pen.	f
4	117	1z0-071	D.There is no row containing pencil.Most Voted	t
5	117	1z0-071	E.The code for fountain pen is 3.Most Voted	t
6	117	1z0-071	F.The code for pen is 1.	f
1	118	1z0-071	A.Both & and && can prefix a substitution variable name in queries and DML statements.Most Voted	t
2	118	1z0-071	B.An & prefix to an undefined substitution variable, which is referenced twice in the same query, will prompt for a value twice.Most Voted	t
3	118	1z0-071	C.& can prefix a substitution variable name only in queries.	f
4	118	1z0-071	D.An && prefix to an undefined substitution variable, which is referenced multiple times in multiple queries, will prompt for a value once per query.	f
5	118	1z0-071	E.The && prefix will not prompt for a value even if the substitution variable is not previously defined in the session.	f
1	119	1z0-071	A.https://img.examtopics.com/1z0-071/image23.pngMost Voted	t
2	119	1z0-071	B.https://img.examtopics.com/1z0-071/image24.png	f
3	119	1z0-071	C.https://img.examtopics.com/1z0-071/image25.png	f
4	119	1z0-071	D.https://img.examtopics.com/1z0-071/image26.png	f
1	120	1z0-071	A.https://img.examtopics.com/1z0-071/image29.pngMost Voted	t
2	120	1z0-071	B.https://img.examtopics.com/1z0-071/image30.pngMost Voted	t
3	120	1z0-071	C.https://img.examtopics.com/1z0-071/image31.png	f
4	120	1z0-071	D.https://img.examtopics.com/1z0-071/image32.png	f
5	120	1z0-071	E.https://img.examtopics.com/1z0-071/image33.png	f
1	121	1z0-071	A.SELECT INTERVAL '1' DAY - INTERVAL '1' MINUTE FROM DUALMost Voted	t
2	121	1z0-071	B.SELECT SYSTIMESTAMP + INTERVAL '1' DAY FROM DUAL;Most Voted	t
3	121	1z0-071	C.SELECT INTERVAL '1' DAY - SYSDATE FROM DUAL;	f
4	121	1z0-071	D.SELECT INTERVAL '1' DAY + INTERVAL '1' MONTH FROM DUAL;	f
5	121	1z0-071	E.SELECT SYSDATE * INTERVAL '1' DAY FROM DUAL;	f
1	122	1z0-071	A.11-JUL-2019 6.00.00.00000000 AM -05:00	f
2	122	1z0-071	B.11-JUL-2019 11.00.00.00000000 AM	f
3	122	1z0-071	C.11-JUL-2019 6.00.00.00000000 AMMost Voted	t
4	122	1z0-071	D.11-JUL-2019 11.00.00.00000000 AM -05:00	f
1	123	1z0-071	A.User FIN_CLERK can grant SELECT on SCOTT.EMP to user FIN_MANAGER.	f
2	123	1z0-071	B.Dropping user FINANCE will automatically revoke SELECT on SCOTT.EMP from user FIN_CLERK.	f
3	123	1z0-071	C.User FINANCE can grant CREATE SESSION to user FIN_MANAGER.	f
4	123	1z0-071	D.Revoking SELECT on SCOTT.EMP from user FINANCE will also revoke the privilege from user FIN_CLERK.Most Voted	t
5	123	1z0-071	E.User FINANCE is unable to grant all on SCOTT.EMP to FIN_MANAGER.Most Voted	t
1	124	1z0-071	A.An object privilege can be granted to other users only by the owner of that object.	f
2	124	1z0-071	B.The owner of an object acquires all object privileges on that object by default.Most Voted	t
3	124	1z0-071	C.The WITH GRANT OPTION clause can be used only by DBA users.	f
4	124	1z0-071	D.An object privilege can be granted to a role only by the owner of that object.	f
5	124	1z0-071	E.A table owner must grant the REFERENCES privilege to allow other users to create FOREIGN KEY constraints using that table.Most Voted	t
1	125	1z0-071	A.SELECT dept_id, AVG(MAX(salary)) FROM employees GROUP BY dept_id HAVING hire_date > '01-JAN-19';	f
2	125	1z0-071	B.SELECT dept_id, SUM(salary) FROM employees WHERE hire_date > '01-JAN-19' GROUP BY dept_id;Most Voted	t
3	125	1z0-071	C.SELECT dept_id, MAX(SUM(salary)) FROM employees GROUP BY dept_id;	f
4	125	1z0-071	D.SELECT dept_id, AVG(MAX(salary)) FROM employees GROUP BY dept_id, salary;	f
5	125	1z0-071	E.SELECT AVG(MAX(salary)) FROM employees GROUP BY salary;Most Voted	t
1	126	1z0-071	A.The + binary operator has the highest precedence in an expression in a SQL statement.	f
2	126	1z0-071	B.The concatenation operator || is always evaluated before addition and subtraction in an expression.	f
3	126	1z0-071	C.Multiple parentheses can be used to override the default precedence of operators in an expression.Most Voted	t
4	126	1z0-071	D.NULLS influence the precedence of operators in an expression.	f
5	126	1z0-071	E.Arithmetic operators with equal precedence are evaluated from left to right within an expression.Most Voted	t
1	127	1z0-071	A.https://img.examtopics.com/1z0-071/image40.png	f
2	127	1z0-071	B.https://img.examtopics.com/1z0-071/image41.png	f
3	127	1z0-071	C.https://img.examtopics.com/1z0-071/image42.pngMost Voted	t
4	127	1z0-071	D.https://img.examtopics.com/1z0-071/image43.pngMost Voted	t
5	127	1z0-071	E.https://img.examtopics.com/1z0-071/image44.png	f
1	128	1z0-071	A.https://img.examtopics.com/1z0-071/image45.png	f
2	128	1z0-071	B.https://img.examtopics.com/1z0-071/image46.pngMost Voted	t
3	128	1z0-071	C.https://img.examtopics.com/1z0-071/image47.pngMost Voted	t
4	128	1z0-071	D.https://img.examtopics.com/1z0-071/image48.png	f
5	128	1z0-071	E.https://img.examtopics.com/1z0-071/image49.png	f
1	129	1z0-071	A.It will return rows from both SELECT statements including duplicate rows.Most Voted	t
2	129	1z0-071	B.It will return rows from both SELECT statements after eliminating duplicate rows.	f
3	129	1z0-071	C.It will return rows that are not common to both SELECT statements.	f
4	129	1z0-071	D.It will return rows common to both SELECT statements.	f
1	130	1z0-071	A.A sequence’s unallocated cached values are lost if the instance shuts down.Most Voted	t
2	130	1z0-071	B.A sequence number that was allocated can be rolled back if a transaction fails.	f
3	130	1z0-071	C.A sequence can only be dropped by a DBA.	f
4	130	1z0-071	D.A sequence can issue duplicate values.Most Voted	t
5	130	1z0-071	E.Sequences can always have gaps.Most Voted	t
6	130	1z0-071	F.Two or more tables cannot have keys generated from the same sequence.	f
1	131	1z0-071	A.https://img.examtopics.com/1z0-071/image52.png	f
2	131	1z0-071	B.https://img.examtopics.com/1z0-071/image53.png	f
3	131	1z0-071	C.https://img.examtopics.com/1z0-071/image54.pngMost Voted	t
4	131	1z0-071	D.https://img.examtopics.com/1z0-071/image55.pngMost Voted	t
1	132	1z0-071	A.SELECT NVL2(cust_credit_limit * .15, 'Not Available') FROM customers;	f
2	132	1z0-071	B.SELECT NVL2(cust_credit_limit, TO_CHAR(cust_credit_limit * .15), 'Not Available') FROM customersMost Voted	t
3	132	1z0-071	C.SELECT NVL(cust_credit_limit * .15, 'Not Available') FROM customers;	f
4	132	1z0-071	D.SELECT NVL(TO_CHAR(cust_credit_limit * .15), 'Not Available') FROM customers;Most Voted	t
5	132	1z0-071	E.SELECT TO_CHAR(NVL(cust_credit_iimit * .15, 'Not Available')) FROM customers;	f
1	133	1z0-071	A.https://img.examtopics.com/1z0-071/image57.png	f
2	133	1z0-071	B.https://img.examtopics.com/1z0-071/image58.png	f
3	133	1z0-071	C.https://img.examtopics.com/1z0-071/image59.png	f
4	133	1z0-071	D.https://img.examtopics.com/1z0-071/image60.pngMost Voted	t
1	134	1z0-071	A.The ROLLBACK statement does not release locks resulting from table updates.	f
2	134	1z0-071	B.Data consistency is not guaranteed after a rollback.	f
3	134	1z0-071	C.A transaction interrupted by a system failure is automatically rolled back.	f
4	134	1z0-071	D.If the ROLLBACK statement is used without TO SAVEPOINT, then all savepoints in the transaction are deleted.	f
5	134	1z0-071	E.Data Control Language (DCL) statements, such as GRANT and REVOKE, can be rolled back.	f
1	135	1z0-071	A.An UNUSED column's space is reclaimed automatically when the row containing that column is next queried.	f
2	135	1z0-071	B.A column that is set to UNUSED still counts towards the limit of 1000 columns per table.Most Voted	t
3	135	1z0-071	C.A DROP COLUMN command can be rolled back.	f
4	135	1z0-071	D.A primary key column referenced by another column as a foreign key can be dropped if using the CASCADE option.Most Voted	t
5	135	1z0-071	E.An UNUSED column's space is reclaimed automatically when the block containing that column is next queried.	f
6	135	1z0-071	F.Partition key columns cannot be dropped.Most Voted	t
1	136	1z0-071	A.Create a directory object for a flat file.	f
2	136	1z0-071	B.Create a directory object for an external table.	f
3	136	1z0-071	C.Read data from an external table and load it into a table in the database.Most Voted	t
4	136	1z0-071	D.Execute DML statements on an external table.	f
5	136	1z0-071	E.Read data from a table in the database and insert it into an external table.Most Voted	t
6	136	1z0-071	F.Query data from an external table.Most Voted	t
1	137	1z0-071	A.Aggregate functions can be nested to any number of levels.	f
2	137	1z0-071	B.The AVG function implicitly converts NULLS to zero.	f
3	137	1z0-071	C.The MAX and MIN functions can be used on columns with character data types.Most Voted	t
4	137	1z0-071	D.Aggregate functions can be used in any clause of a SELECT statement.	f
1	138	1z0-071	A.They can insert each computed row into more than one table.Most Voted	t
2	138	1z0-071	B.They can be performed on remote tables.	f
3	138	1z0-071	C.They can be performed on external tables using SQL*Loader.	f
4	138	1z0-071	D.They can be performed on views.	f
5	138	1z0-071	E.They can be performed only by using a subquery.Most Voted	t
6	138	1z0-071	F.They can be performed on relational tables.Most Voted	t
1	139	1z0-071	A.They must be placed on the left side of the comparison operator or condition.	f
2	139	1z0-071	B.They must be placed on the right side of the comparison operator or condition.	f
3	139	1z0-071	C.They must return a row to prevent errors in the SQL statement.	f
4	139	1z0-071	D.A SQL statement may have multiple single row subquery blocks.	f
5	139	1z0-071	E.They can be used in the HAVING clause.	f
6	139	1z0-071	F.They can be used in the WHERE clause.	f
1	140	1z0-071	A.SELECT TO_DATE(SYSDATE, 'RRRR-MM-DD') FROM DUAL;	f
2	140	1z0-071	B.SELECT TO_CHAR(SYSDATE, MM/DD/YYYY) FROM DUAL;Most Voted	t
3	140	1z0-071	C.SELECT TO_DATE(ADD_MONTHS(SYSDATE, 6), 'dd-non-yyyy') FROM DUAL;	f
4	140	1z0-071	D.SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6)) FROM DUAL;	f
5	140	1z0-071	E.SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6), 'dd-mon-yyyy') FROM DUAL;Most Voted	t
6	140	1z0-071	F.SELECT TO_DATE(TO_CHAR(SYSDATE, 'MM/DD/YYYY'), 'MM/DD/YYYY') FROM DUAL;	f
1	141	1z0-071	A.After issuing a savepoint, you can roll back to the savepoint name within the current transaction.Most Voted	t
2	141	1z0-071	B.They make uncommitted updates visible to sessions owned by other users.	f
3	141	1z0-071	C.You can commit updates done between two savepoints without committing other updates in the current transaction.	f
4	141	1z0-071	D.A ROLLBACK TO SAVEPOINT command issued before the start of a transaction results in an error.Most Voted	t
5	141	1z0-071	E.They make uncommitted updates visible to other sessions owned by the same user.	f
6	141	1z0-071	F.After issuing a savepoint, you cannot roll back the complete transaction.	f
1	142	1z0-071	A.There is no row containing pencil.Most Voted	t
2	142	1z0-071	B.The code for pen is 10.Most Voted	t
3	142	1z0-071	C.There is no row containing fountain pen.	f
4	142	1z0-071	D.The code for pen is 1.	f
5	142	1z0-071	E.There is no row containing pen.	f
6	142	1z0-071	F.The code for fountain pen is 3.Most Voted	t
1	143	1z0-071	A.WHERE order_date > TO_DATE(‘JUL 10 2018’, ‘ MON DD YYYY’)Most Voted	t
2	143	1z0-071	B.WHERE order_date > TO_DATE(ADD_MONTH(SYSDATE, 6), ‘MON DD YYYY’)	f
3	143	1z0-071	C.WHERE order_date IN (TO_DATE(‘Oct 21 2018’, ‘Mon DD YYYY’), TO_CHAR(‘Nov 21 2018’, ‘Mon DD YYYY’))	f
4	143	1z0-071	D.WHERE order_date > TO_CHAR(ADD_MONTHS(SYSDATE, 6), ‘MON DD YYYY’)	f
5	143	1z0-071	E.WHERE TO_CHAR(order_date. ‘MON DD YYYY’) = ‘JAN 20 2019’Most Voted	t
1	144	1z0-071	A.an error	f
2	144	1z0-071	B.no rowsMost Voted	t
3	144	1z0-071	C.1 row	f
4	144	1z0-071	D.3 rows	f
5	144	1z0-071	E.6 rows	f
6	144	1z0-071	F.8 rows	f
1	145	1z0-071	A.INDEX	f
2	145	1z0-071	B.ALTER	f
3	145	1z0-071	C.UPDATEMost Voted	t
4	145	1z0-071	D.INSERTMost Voted	t
5	145	1z0-071	E.DELETE	f
1	146	1z0-071	A.https://img.examtopics.com/1z0-071/image64.png	f
2	146	1z0-071	B.https://img.examtopics.com/1z0-071/image65.png	f
3	146	1z0-071	C.https://img.examtopics.com/1z0-071/image66.pngMost Voted	t
4	146	1z0-071	D.https://img.examtopics.com/1z0-071/image67.png	f
5	146	1z0-071	E.https://img.examtopics.com/1z0-071/image68.pngMost Voted	t
1	147	1z0-071	A.The statement will execute successfully and a new row will be inserted into the SALES table.Most Voted	t
2	147	1z0-071	B.A product can have a different unit price at different times.Most Voted	t
3	147	1z0-071	C.The statement will fail if a row already exists in the SALES table for product 23.	f
4	147	1z0-071	D.The statement will fail because a subquery may not be contained in a VALUES clause.	f
5	147	1z0-071	E.A customer can exist in many countries.	f
6	147	1z0-071	F.The SALES table has five foreign keys.Most Voted	t
1	148	1z0-071	A.By default an ORDER BY clause sorts rows in descending order	f
2	148	1z0-071	B.An ORDER BY clause will always precede a HAVING clause if both are used in the same top-level query.	f
3	148	1z0-071	C.An ORDER BY clause always sorts NULL values last.	f
4	148	1z0-071	D.By default an ORDER BY clause sorts rows in ascending order.Most Voted	t
5	148	1z0-071	E.An ORDER BY clause can perform a binary sort.Most Voted	t
6	148	1z0-071	F.An ORDER BY clause can perform a linguistic sort.Most Voted	t
1	149	1z0-071	A.SELECT * FROM employees WHERE NVL2(salary + commission, salary + commission, salary) >= 20000;Most Voted	t
2	149	1z0-071	B.SELECT * FROM employees WHERE salary + NVL2(commission, commission, 0) >= 20000Most Voted	t
3	149	1z0-071	C.SELECT * FROM employees WHERE NVL(salary + commission, 0) >= 20000;	f
4	149	1z0-071	D.SELECT * FROM employees WHERE salary + NULLIF(commission, 0) >= 20000;	f
5	149	1z0-071	E.SELECT * FROM employees WHERE COALESCE(salary, commission) >= 20000;	f
6	149	1z0-071	F.SELECT * FROM employees WHERE salary + NVL(commission, 0) >= 20000;Most Voted	t
1	150	1z0-071	A.SELECT employee_name FROM employees WHERE (SYSDATE - hire_date) / 12 > 5;	f
2	150	1z0-071	B.SELECT employee_name FROM employees WHERE (SYSTIMSSTAMF - hire_date) / 12 > INTERVAL '5' YEAR;	f
2	164	1z0-071	B.SELECT * FROM customers WHERE city = ‘%D__’;	f
3	150	1z0-071	C.SELECT employee_name FROM employees WHERE (CURRENT_DATE - hire_date) / 12 > 5	f
4	150	1z0-071	D.SELECT employee_name FROM employees WHERE (CURRENT_DATE - hire_date) / 365 >Most Voted	t
5	150	1z0-071	E.SELECT employee_name FROM employees WHERE (SYSDATE - hire_date) / 365 > 5;Most Voted	t
6	150	1z0-071	F.SELECT employee_name FROM employees WHERE (SYSTIMESTAMP - hire_date) / 365 > INTERVAL '1825' DAY;	f
1	151	1z0-071	A.SELECT "Hello! We're ready" FROM DUAL;	f
2	151	1z0-071	B.SELECT 'Hello! We're ready' FROM DUAL;	f
3	151	1z0-071	C.SELECT q'!Hello! We're ready!' FROM DUAL;Most Voted	t
4	151	1z0-071	D.SELECT q'[Hello! We're ready]' FROM DUAL;Most Voted	t
5	151	1z0-071	E.SELECT 'Hello! We\\'re ready’ ESCAPE '\\' FROM DUAL;	f
1	152	1z0-071	A.It can be used from SQL Developer.Most Voted	t
2	152	1z0-071	B.It displays the PRIMARY KEY constraint for any column or columns that have that constraint.	f
3	152	1z0-071	C.It displays all constraints that are defined for each column.	f
4	152	1z0-071	D.It displays the NOT NULL constraint for any columns that have that constraint.Most Voted	t
5	152	1z0-071	E.It can be used only from SQL* Plus.	f
6	152	1z0-071	F.It can be used to display the structure of an existing view.Most Voted	t
1	153	1z0-071	A.The creator of a view to be dropped must have the DROP ANY VIEW privilege.	f
2	153	1z0-071	B.Data selected by a view’s defining query is deleted from its underlying tables when the view is dropped.	f
3	153	1z0-071	C.Views referencing a dropped view become invalid.Most Voted	t
4	153	1z0-071	D.Read only views cannot be dropped.	f
5	153	1z0-071	E.CASCADE CONSTRAINTS must be specified when referential integrity constraints on other objects refer to primary or unique keys in the view to be dropped.Most Voted	t
1	154	1z0-071	A.The WHEN NOT MATCHED clause can be used to specify the deletions to be performed.	f
2	154	1z0-071	B.The WHEN NOT MATCHED clause can be used to specify the updates to be performed.	f
3	154	1z0-071	C.The WHEN NOT MATCHED clause can be used to specify the inserts to be performed.Most Voted	t
4	154	1z0-071	D.The WHEN WATCHED clause can be used to specify the inserts to be performed.	f
5	154	1z0-071	E.The WHEN WATCHED clause can be used to specify the updates to be performed.Most Voted	t
1	155	1z0-071	A.Table aliases must be used.	f
2	155	1z0-071	B.The SQL:1999 compliant ANSI join syntax must be used.	f
3	155	1z0-071	C.The USING clause can be used.	f
4	155	1z0-071	D.The Oracle join syntax can be used.	f
5	155	1z0-071	E.The ON clause can be used.	f
1	156	1z0-071	A.The PROD_NAME column cannot have a DEFAULT clause added to it.	f
2	156	1z0-071	B.The EXPIRY_DATE column cannot be dropped.	f
3	156	1z0-071	C.The EXPIRY_DATE column data type can be changed to TIMESTAMP.Most Voted	t
4	156	1z0-071	D.The PROD_ID column can be renamed.Most Voted	t
5	156	1z0-071	E.The PROD_ID column data type can be changed to VARCHAR2(2).	f
1	157	1z0-071	A.It fails unless the expression is modified to SUBSTR(TO_CHAR(SYSDATE), 1, 5).	f
2	157	1z0-071	B.It fails unless the expression is modified to SUBSTR(TO_CHAR(TRUNC(SYSDATE), 1, 5).	f
3	157	1z0-071	C.It fails unless the expression is modified to TO_CHAR(SUBSTR(SYSDATE), 1, 5)).	f
4	157	1z0-071	D.It executes successfully with an implicit data type conversion.Most Voted	t
1	158	1z0-071	A.It processes NULLs in the selected columns.Most Voted	t
2	158	1z0-071	B.It ignores NULLs.	f
3	158	1z0-071	C.INTERSECT is of lower precedence than UNION or UNION ALL.	f
4	158	1z0-071	D.Multiple INTERSECT operators are not possible in the same SQL statement.	f
1	159	1z0-071	A.after successfully executing a CREATE TABLE statement followed by a CREATE INDEX statement	f
2	159	1z0-071	B.after successfully executing a TRUNCATE statement followed by a DML statementMost Voted	t
3	159	1z0-071	C.after successfully executing a DML statement following a failed DML statement	f
4	159	1z0-071	D.after successfully executing a CREATE TABLE AS SELECT statement followed by a SELECT FOR UPDATE statementMost Voted	t
5	159	1z0-071	E.after successfully executing a COMMIT or ROLLBACK followed by a DML statementMost Voted	t
6	159	1z0-071	F.after successfully executing a COMMIT or ROLLBACK followed by a SELECT statement	f
1	160	1z0-071	A.It returns matched and unmatched rows from both tables being joined.	f
2	160	1z0-071	B.The Oracle join operator (+) must be used on both sides of the join condition in the WHERE clause.	f
3	160	1z0-071	C.It returns only unmatched rows from both tables being joined.	f
4	160	1z0-071	D.It includes rows that are returned by an inner join.	f
5	160	1z0-071	E.It includes rows that are returned by a Cartesian product.	f
1	161	1z0-071	A.It can be a left outer join.	f
2	161	1z0-071	B.It must be an equijoin.	f
3	161	1z0-071	C.It must be a full outer join.	f
4	161	1z0-071	D.The join key column must have an index.	f
5	161	1z0-071	E.It can be an inner join.	f
1	162	1z0-071	A.SELECT * FROM customers WHERE customer_id - '0001';Most Voted	t
2	162	1z0-071	B.SELECT * FROM customers WHERE customer_id - 0001;	f
3	162	1z0-071	C.SELECT * FROM customers WHERE insert_date - DATE '2019-01-01';	f
4	162	1z0-071	D.SELECT * FROM customers WHERE insert_date - '01-JAN-19';Most Voted	t
5	162	1z0-071	E.SELECT * FROM customers WHERE TO_CHAR(customer_id) - '0001';	f
1	163	1z0-071	A.The value varies depending on the setting of SESSIONTIMEZONE.Most Voted	t
2	163	1z0-071	B.It returns a value of data type TIMESTAMP.Most Voted	t
3	163	1z0-071	C.The date is in the time zone of DBTIMEZONE.	f
4	163	1z0-071	D.It returns the same date as CURRENT_TIME.	f
5	163	1z0-071	E.The time is in the time zone of DBTIMEZONE.	f
6	163	1z0-071	F.It always returns the same value as SYSTEMTIMESTAMP.	f
1	164	1z0-071	A.SELECT * FROM customers WHERE city LIKE ‘D__%’;Most Voted	t
1	262	1z0-071	A.2	f
3	164	1z0-071	C.SELECT * FROM customers WHERE city = ‘D__%’;	f
4	164	1z0-071	D.SELECT * FROM customers WHERE city LIKE ‘D__’;	f
1	165	1z0-071	A.It can be used with SET operators (UNION, INTERSECT etc.).	f
2	165	1z0-071	B.It cannot be used with the DISTINCT keyword.Most Voted	t
3	165	1z0-071	C.If the NOWAIT clause is added, the statement will automatically acquire locks from their owning transactions and not wait.	f
4	165	1z0-071	D.The statement skips rows locked by other transactions.	f
5	165	1z0-071	E.It can be used with joins.Most Voted	t
1	166	1z0-071	A.https://img.examtopics.com/1z0-071/image76.pngMost Voted	t
2	166	1z0-071	B.https://img.examtopics.com/1z0-071/image77.png	f
3	166	1z0-071	C.https://img.examtopics.com/1z0-071/image78.png	f
4	166	1z0-071	D.https://img.examtopics.com/1z0-071/image79.png	f
1	167	1z0-071	A.CROSS	f
2	167	1z0-071	B.RIGHT OUTER	f
3	167	1z0-071	C.LEFT OUTERMost Voted	t
4	167	1z0-071	D.FULL OUTER	f
1	168	1z0-071	A.A column with a FOREIGN KEY constraint can never contain a NULL value.	f
2	168	1z0-071	B.A constraint can be disabled even if the constrained column contains data.Most Voted	t
3	168	1z0-071	C.Constraints are enforced only during INSERT operations.	f
4	168	1z0-071	D.All constraints can be defined at the table or column level.	f
5	168	1z0-071	E.A column with a UNIQUE constraint can contain a NULL value.	f
1	169	1z0-071	A.SELECT * FROM order_items WHERE quantity / 10 - TRUNC(quantity	f
2	169	1z0-071	B.SELECT * FROM order_items WHERE MOD(quantity, 10) - 0;Most Voted	t
3	169	1z0-071	C.SELECT * FROM  order_items WHERE FLOOR(quantity / 10) = TRUNC(quantity / 10);	f
4	169	1z0-071	D.SELECT * FROM  order_items WHERE quantity = TRUNC(quantity,  -1);Most Voted	t
5	169	1z0-071	E.SELECT * FROM  order_items WHERE quantity = ROUND(quantity,  1);	f
1	170	1z0-071	A.A new index can be created or an existing one reused when a primary key constraint is created.Most Voted	t
2	170	1z0-071	B.An INVINSIBLE index is maintained by DML operations on the underlying table.Most Voted	t
3	170	1z0-071	C.If a query filters on an indexed column, the index will always be accessed during execution of the query.	f
4	170	1z0-071	D.A DROP INDEX statement always prevents updates to the table during the drop operation.	f
5	170	1z0-071	E.The same table column cannot be part of a unique and non-unique index.	f
1	171	1z0-071	A.INTERVAL '0.5' DAY	f
2	171	1z0-071	B.INTERVAL '720' MINUTEMost Voted	t
3	171	1z0-071	C.INTERVAL '11:60' HOUR TO MINUTE	f
4	171	1z0-071	D.INTERVAL '12:00' HOUR TO SECOND	f
5	171	1z0-071	E.INTERVAL '0 12' DAY TO HOURMost Voted	t
6	171	1z0-071	F.INTERVAL '12' HOURMost Voted	t
1	172	1z0-071	A.The data dictionary is constantly updated to reflect changes to database objects, permissions, and data.Most Voted	t
2	172	1z0-071	B.All user actions are recorded in the data dictionary.	f
3	172	1z0-071	C.All users have permissions to access all information in the data dictionary by default.	f
4	172	1z0-071	D.The SYS user owns all base tables and user-accessible views in the data dictionary.Most Voted	t
5	172	1z0-071	E.Base tables in the data dictionary have the prefix DBA_.	f
1	173	1z0-071	A.It can display multiple rows but only a single column.	f
2	173	1z0-071	B.It can be accessed only by the SYS user.	f
3	173	1z0-071	C.It can be accessed by any user who has the SELECT privilege in any schema.Most Voted	t
4	173	1z0-071	D.It can display multiple rows and columns.	f
5	173	1z0-071	E.It consists of a single row and single column of VARCHAR2 data type.Most Voted	t
6	173	1z0-071	F.It can be used to display only constants or pseudo columns.	f
1	174	1z0-071	A.For tables with multiple indexes and triggers DELETE is faster than TRUNCATE.	f
2	174	1z0-071	B.For large tables TRUNCATE is faster than DELETE.Most Voted	t
3	174	1z0-071	C.You can never TRUNCATE a table if foreign key constraints will be violated.	f
4	174	1z0-071	D.You can never DELETE rows from a table if foreign key constraints will be violated.	f
1	175	1z0-071	A.NOCACHE	f
2	175	1z0-071	B.INCREMENT BY 10Most Voted	t
3	175	1z0-071	C.START WITH 11	f
4	175	1z0-071	D.MINVALUE 11	f
5	175	1z0-071	E.CYCLE 11	f
1	176	1z0-071	A.quantity * unit_priceMost Voted	t
2	176	1z0-071	B.quantity	f
3	176	1z0-071	C.total_paidMost Voted	t
4	176	1z0-071	D.product_id	f
5	176	1z0-071	E.quantity, unit_price	f
1	177	1z0-071	A.PROMPT Enter table name &x -SELECT employee_id FROM &x WHERE last_name = ‘King’;	f
2	177	1z0-071	B.DEFINE x = ‘employees’PROMPT Enter table name &x -SELECT employee_id FROM &x WHERE last_name = ‘King’;	f
3	177	1z0-071	C.PROMPT Enter table name &x -SELECT employee_id FROM &&x WHERE last_name = ‘King’;	f
4	177	1z0-071	D.PROMPT Enter table name &&x -SELECT employee_id FROM &x WHERE last_name = ‘King’;Most Voted	t
1	178	1z0-071	A.SELECT REPLACE(REPLACE(cust_last_name, ‘son’, ‘’), ‘An’, ‘O’) FROM customers;Most Voted	t
2	178	1z0-071	B.SELECT REPLACE(TRIM(TRAILING ‘son’ FROM cust_last_name), ‘An’, ‘O’) FROM customers;	f
3	178	1z0-071	C.SELECT REPLACE(SUBSTR(cust_last_name, -3), ‘An’, ‘O’) FROM customers;	f
4	178	1z0-071	D.SELECT INITCAP(REPLACE(TRIM(‘son’ FROM cust_last_name), ‘An’, ‘O’)) FROM customers;	f
1	179	1z0-071	A.SELECT prod_id || q”’s not available” FROM product_status WHERE status = ‘OUT OF STOCK’;	f
2	179	1z0-071	B.SELECT prod_id || q’(‘s not available)’ ‘CURRENT AVAILABILITY’ FROM product_status WHERE status = ‘OUT OF STOCK’;	f
3	179	1z0-071	C.SELECT prod_id q’s not available” FROM product_status WHERE status = ‘OUT OF STOCK’;	f
4	179	1z0-071	D.SELECT prod_id “CURRENT AVAILABILITY” || q’(‘s not available)’ FROM product_status WHERE status = ‘OUT OF STOCK’;	f
5	179	1z0-071	E.SELECT prod_id || q’(‘s not available)’ FROM product_status WHERE status = ‘OUT OF STOCK’;Most Voted	t
6	179	1z0-071	F.SELECT prod_id || q’(‘s not available)’ “CURRENT AVAILABILITY” FROM product status WHERE status = ‘OUT OF STOCK’;Most Voted	t
1	180	1z0-071	A.INTERVAL YEAR TO MONTH columns only support monthly intervals within a single year.	f
2	180	1z0-071	B.INTERVAL DAY TO SECOND columns support fractions of seconds.Most Voted	t
3	180	1z0-071	C.INTERVAL YEAR TO MONTH columns support yearly intervals.Most Voted	t
4	180	1z0-071	D.The YEAR field in an INTERVAL YEAR TO MONTH column must be a positive value.	f
5	180	1z0-071	E.INTERVAL YEAR TO MONTH columns only support monthly intervals within a range of years.	f
6	180	1z0-071	F.The value in an INTERVAL DAY TO SECOND column can be copied into an INTERVAL YEAR TO MONTH column.	f
1	181	1z0-071	A.The data dictionary is accessible when the database is closed.	f
2	181	1z0-071	B.The data dictionary does not store metadata in tables.	f
3	181	1z0-071	C.Views with the prefix ALL_, DBA_ and USER_ are not all available for every type of metadata.	f
4	181	1z0-071	D.Views with the prefix DBA_ display only metadata for objects in the SYS schema.	f
5	181	1z0-071	E.Views with the prefix ALL_ display metadata for objects to which the current user has access.	f
1	182	1z0-071	A.WHERE UPPER(cust_last_name) IN (‘AX’, ‘B%’)AND cust_credit_limit < 1000;	f
2	182	1z0-071	B.WHERE (UPPER(cust_last_name) LIKE ‘A%’ OR UPPER(cust_last_name) LIKE ‘B%’)AND ROUND(cust_credit_limit) < 1000;Most Voted	t
3	182	1z0-071	C.WHERE UPPER(cust_last_name) BETWEEN UPPER(‘A%’ AND ‘B%’)AND ROUND(cust_credit_limit) < 1000;	f
4	182	1z0-071	D.WHERE (INITCAP(cust_last_name) LIKE ‘A%’ OR INITCAP(cust_last_name) LIKE ‘B%’)AND cust_credit_limit < 1000;Most Voted	t
5	182	1z0-071	E.WHERE (UPPER(cust_last_name) LIKE INITCAP(‘A’) OR UPPER(cust_last_name) LIKE INITCAP(‘B’))AND ROUND(cust_credit_limit) < ROUND(1000);	f
1	183	1z0-071	A.A substitution variable can be used only in a SELECT statement.	f
2	183	1z0-071	B.A substitution variable used to prompt for a column name must be enclosed in double quotation marks.	f
3	183	1z0-071	C.A substitution variable can be used with any clause in a SELECT statement.Most Voted	t
4	183	1z0-071	D.A substation variable prefixed with && prompts only once for a value in a session unless it is set to undefined in the session.Most Voted	t
5	183	1z0-071	E.A substitution variable prefixed with & always prompts only once for a value in a session.	f
6	183	1z0-071	F.A substitution variable used to prompt for a column name must be enclosed in single quotation marks.	f
1	184	1z0-071	A.They can return at most one row.Most Voted	t
2	184	1z0-071	B.You must enclose them in parentheses.Most Voted	t
3	184	1z0-071	C.You cannot correlate them with a table in the parent statement.	f
4	184	1z0-071	D.They can return two columns.	f
5	184	1z0-071	E.You can use them as a default value for a column.	f
1	185	1z0-071	A.SELECT prod_id FROM products -UNION ALL -SELECT prod_id, prod_name FROM new_products;	f
2	185	1z0-071	B.SELECT prod_id, exp_date FROM productsUNION ALL -SELECT prod_id, NULL FROM new_products;Most Voted	t
3	185	1z0-071	C.SELECT * FROM products -MINUS -SELECT prod_id, FROM new_products;	f
4	185	1z0-071	D.SELECT prod_id, prod_name FROM productsINTERSECT -SELECT 100, prod_name FROM new_products;	f
5	185	1z0-071	E.SELECT * FROM products -UNION -SELECT * FROM new_products;Most Voted	t
1	186	1z0-071	A.UPDATE statements can have different subqueries to specify the values for each updated column.	f
2	186	1z0-071	B.INSERT INTO…SELECT…FROM statements automatically commit.	f
3	186	1z0-071	C.DML statements require a primary key be defined on a table.	f
4	186	1z0-071	D.DELETE statements can remove multiple rows based on multiple conditions.	f
5	186	1z0-071	E.INSERT statements can insert NULLs explicitly into a column.	f
1	187	1z0-071	A.The conditional INSERT FIRST statement always inserts a row into a single table.	f
2	187	1z0-071	B.The unconditional INSERT ALL statement must have the same number of columns in both the source and target tables.	f
3	187	1z0-071	C.They can transform a row from a source table into multiple rows in a target table.Most Voted	t
4	187	1z0-071	D.The conditional INSERT ALL statement inserts rows into a singe table by aggregating source rows.	f
5	187	1z0-071	E.They always use subqueries.Most Voted	t
1	188	1z0-071	A.Using aggregate functions in the WHERE clause requires a subquery.Most Voted	t
2	188	1z0-071	B.Using aggregate functions in the HAVING clause requires a subquery.	f
3	188	1z0-071	C.Using single-row functions in the WHERE clause requires a subquery.	f
4	188	1z0-071	D.Using single-row functions in the HAVING clause requires a subquery.	f
1	189	1z0-071	A.ROLLBACK;	f
2	189	1z0-071	B.ROLLBACK TO SAVEPOINT post_insert;Most Voted	t
3	189	1z0-071	C.ROLLBACK TO post_insert;Most Voted	t
4	189	1z0-071	D.COMMIT;	f
5	189	1z0-071	E.COMMIT TO SAVEPOINT post_insert;	f
1	190	1z0-071	A.SELECT MAX(salary)FROM employees -GROUP By department_id -HAVING MAX(salary) = MAX(MAX(salary));	f
2	190	1z0-071	B.SELECT MAX(salary)FROM employees -GROUP By department_id;	f
3	190	1z0-071	C.SELECT department_id, MAX(salary)FROM employees -GROUP By department_id;	f
4	190	1z0-071	D.SELECT MAX(salary)FROM employees;Most Voted	t
5	190	1z0-071	E.SELECT MAX(MAX(salary))FROM employees -GROUP By department_id;Most Voted	t
1	191	1z0-071	A.SELECT dept_id, INSTR(last_name, ‘A’), SUM(salary) FROM employees GROUP BY dept_id;	f
2	191	1z0-071	B.SELECT dept_id, STDDEV(last_name), SUM(salary) FROM employees GROUP BY dept_id;	f
3	191	1z0-071	C.SELECT dept_id, LENGTH(last_name), SUM(salary) FROM employees GROUP BY dept_id;	f
4	191	1z0-071	D.SELECT dept_id, MAX(last_name), SUM(salary) FROM employees GROUP BY dept_id;Most Voted	t
1	192	1z0-071	A.SELECT join_date FROM employees WHERE join_datee > ’10-02-2018’;Most Voted	t
2	192	1z0-071	B.SELECT join_date || ‘ ‘ || salary FROM employees;	f
3	192	1z0-071	C.SELECT salary + ’120.50’ FROM employees;	f
4	192	1z0-071	D.SELECT join_date + ‘20’ FROM employees;	f
5	192	1z0-071	E.SELECT SUBSTR(join_date, 1, 2) -1’	f
1	193	1z0-071	A.They can be temporary tables.	f
2	193	1z0-071	B.DML statements can modify them.	f
3	193	1z0-071	C.They can be used in queries containing joins.Most Voted	t
4	193	1z0-071	D.They can be used in queries containing sorts.Most Voted	t
5	193	1z0-071	E.They can be indexed.	f
6	193	1z0-071	F.Their metadata is stored in the database.Most Voted	t
1	194	1z0-071	A.The DELETE command will wait for HR’s transaction to end then return an error.	f
2	194	1z0-071	B.The DELETE command will immediately delete the row.	f
3	194	1z0-071	C.The DELETE command will wait for HR’s transaction to end then delete the row.	f
4	194	1z0-071	D.The DELETE command will immediately return an error.Most Voted	t
1	195	1z0-071	A.Views cannot be used to query rows from an underlying table if the table has a PRIMARY KEY and the PRIMARY KEY columns are not referenced in the defining query of the view.	f
2	195	1z0-071	B.Delete statements can always be done on a table through a view.	f
3	195	1z0-071	C.The WITH CHECK clause has no effect when deleting rows from the underlying table through the view.Most Voted	t
4	195	1z0-071	D.Views cannot be used to add rows to an underlying table if the table has columns with NOT NULL constraints lacking default values which are not referenced in the defining query of the view.Most Voted	t
5	195	1z0-071	E.Views cannot be used to add or modify rows in an underlying table if the defining query of the view contains the DISTINCT keyword,Most Voted	t
6	195	1z0-071	F.Insert statements can always be done on a table through a view.	f
1	196	1z0-071	A.TO_NUMBER(PROMO_BEGIN_DATE) – 5 will return a number.	f
2	196	1z0-071	B.PROMO_BEGIN_DATE – SYSDATE will return a number.Most Voted	t
3	196	1z0-071	C.PROMO_BEGIN_DATE – SYSDATE will return an error.	f
4	196	1z0-071	D.PROMO_BEGIN_DATE – 5 will return a date.Most Voted	t
5	196	1z0-071	E.TO_DATE(PROMO_BEGIN_DATE * 5) will return a date.	f
1	197	1z0-071	A.CREATE PUBLIC SYNONYM emp FOR hcm.employee_records;	f
2	197	1z0-071	B.CREATE GLOBAL SYNONYM emp FOR hcm.employee_records;	f
3	197	1z0-071	C.CREATE SYNONYM emp FOR hcm.employee_records:	f
4	197	1z0-071	D.CREATE SYNONYM SYS.emp FOR hcm.employee_records;	f
5	197	1z0-071	E.CREATE SYNONYM PUBLIC.emp FOR hcm.employee_records;	f
1	198	1z0-071	A.Column positions must be used in the ORDER BY clause.	f
2	198	1z0-071	B.Only column names from the first SELECT statement in the compound query are recognized.Most Voted	t
3	198	1z0-071	C.Each SELECT statement in the compound query must have its own ORDER BY clause.	f
4	198	1z0-071	D.The first column in the first SELECT of the compound query with the UNION operator is used by default to sort output in the absence of an ORDER BY clause.Most Voted	t
5	198	1z0-071	E.Each SELECT statement in the compound query can have its own ORDER BY clause.	f
1	199	1z0-071	A.The number of columns in each SELECT in the compound query can be different.	f
2	199	1z0-071	B.INTERSECT returns rows common to both sides of the compound query.Most Voted	t
3	199	1z0-071	C.INTERSECT ignores NULLs.	f
4	199	1z0-071	D.Columns named in each SELECT in the compound query can be different.Most Voted	t
5	199	1z0-071	E.Reversing the order of the intersected tables can sometimes affect the output.	f
1	200	1z0-071	A.c1 can be changed to NUMBER(10) and c2 can be changed to VARCHAR2(10).	f
2	200	1z0-071	B.c1 can be changed to NUMBER(10) and c2 cannot be changed to VARCHAR2(10).	f
3	200	1z0-071	C.c2 can be changed to NUMBER(5) but c1 cannot be changed to VARCHAR2(5).	f
4	200	1z0-071	D.c1 can be changed to VARCHAR2(10) but c1 cannot be changed to NUMBER(10).	f
5	200	1z0-071	E.c1 can be changed to VARCHAR2(5) but c2 can be changed to NUMBER(12,2).Most Voted	t
1	201	1z0-071	A.Andrew will be unable to see the changes you have made.Most Voted	t
2	201	1z0-071	B.Andrew will be unable to perform any INSERTs, UPDATEs, or DELETEs on the table.	f
3	201	1z0-071	C.Andrew will be able to SELECT from the table, but be unable to modify any existing rows.	f
4	201	1z0-071	D.Andrew will be able to see the changes you have made.	f
5	201	1z0-071	E.Andrew will be able to modify any rows in the table that have not been modified by your transaction.Most Voted	t
1	202	1z0-071	A.DELETE FROM scott.emp;	f
2	202	1z0-071	B.ALTER SESSION SET NLS_DATE_FORMAT = ‘DD/MM/YYYY’;	f
3	202	1z0-071	C.GRANT UPDATE ON scott.emp TO fin manager;Most Voted	t
4	202	1z0-071	D.SELECT * FROM user_tab_prive;	f
5	202	1z0-071	E.TRUNCATE TABLE emp;Most Voted	t
1	203	1z0-071	A.SELECT * FROM orders ORDER BY order_idINTERSECT -SELECT * FROM invoices ORDER BY invoice_id;	f
2	203	1z0-071	B.(SELECT * FROM ordersUNION ALL -SELECT * FROM invoices) ORDER BY order_id;	f
3	203	1z0-071	C.SELECT order_id, order_date FROM ordersUNION ALL -SELECT invoice_id, invoice_date FROM invoices ORDER BY order_id;Most Voted	t
4	203	1z0-071	D.SELECT * FROM orders -MINUS -SELECT * FROM invoices ORDER BY 1;Most Voted	t
5	203	1z0-071	E.SELECT order_id invoice_id, order_date FROM ordersMINUS -SELECT invoice_id, invoice_date FROM invoices ORDER BY invoice_id;Most Voted	t
6	203	1z0-071	F.SELECT * FROM orders ORDER BY order_idUNION -SELECT * FROM invoices;	f
7	203	1z0-071	G.SELECT order_id, order_date FROM ordersINTERSECT -SELECT invoice_id, invoice_date FROM invoices ORDER BY invoice_id;	f
1	204	1z0-071	A.SELECT NULLIF (NULL, 100) FROM DUAL;	f
2	204	1z0-071	B.SELECT NULLIF (100, ‘A’) FROM DUAL;	f
3	204	1z0-071	C.SELECT NULLIF (100, 100) FROM DUAL;Most Voted	t
4	204	1z0-071	D.SELECT COALESCE (100, NULL, 200) FROM DUAL;Most Voted	t
5	204	1z0-071	E.SELECT COALESCE (100, ‘A’) FROM DUAL;	f
1	205	1z0-071	A.SELECT COUNT(NVL(list_price, 0)) FROM product_information WHERE list_price is NULL;Most Voted	t
2	262	1z0-071	B.1	f
2	205	1z0-071	B.SELECT COUNT(list_price) FROM product_information WHERE list_price = NULL;	f
3	205	1z0-071	C.SELECT COUNT(list_price) FROM product_information WHERE list_price IS NULL;	f
4	205	1z0-071	D.SELECT COUNT(DISTINCT list_price) FROM product_information WHERE list_price IS NULL;	f
1	206	1z0-071	A.Both the query and the subquery can select only zero rows or one row.	f
2	206	1z0-071	B.Both the query and the subquery can select any number of rows.	f
3	206	1z0-071	C.The query can select only zero rows or one row, but the subquery can select any number of rows.	f
4	206	1z0-071	D.The query can select any number of rows, but the subquery can select only zero rows or one row.Most Voted	t
1	207	1z0-071	A.DELETE order_id FROM orders WHERE order_total < 1000;	f
2	207	1z0-071	B.DELETE orders WHERE order_total < 1000Most Voted	t
3	207	1z0-071	C.DELETE * FROM orders WHERE order_total < 1000;	f
4	207	1z0-071	D.DELETE FROM orders;Most Voted	t
5	207	1z0-071	E.DELETE FROM orders WHERE order_total < 1000;Most Voted	t
1	208	1z0-071	A.SELECT cust_first_name, cust_credit_limit * .05 AS due_amountFROM customers -WHERE cust_income_level IS NOT NULLAND cust_credit_limit IS NOT NULLMost Voted	t
2	208	1z0-071	B.SELECT cust_first_name, cust_credit_limit * .05 AS due_amountFROM customers -WHERE cust_income_level <> NULL -AND due_amount <> NULL;	f
3	208	1z0-071	C.SELECT cust_first_name, cust_credit_limit * .05 AS due_amountFROM customers -WHERE cust_income_level != NULL -AND cust_credit_level != NULL;	f
4	208	1z0-071	D.SELECT cust_first_name, cust_credit_limit * .05 AS due_amountFROM customers -WHERE cust_income_level != NULL -AND due_amount != NULL;	f
5	208	1z0-071	E.SELECT cust_first_name, cust_credit_limit * .05 AS due_amountFROM customers -WHERE cust_income_level IS NOT NULLAND due_amount IS NOT NULL;	f
1	209	1z0-071	A.The foreign key constraint on DEPT_ID must be defined at the table level instead of the column level.	f
2	209	1z0-071	B.The NOT NULL constraint on ENAME must be defined at the column level instead of the table level.Most Voted	t
3	209	1z0-071	C.The primary key constraint on EMP_ID must have a name.	f
4	209	1z0-071	D.One of the LONG columns must be changed to a VARCHAR2 or CLOB.Most Voted	t
5	209	1z0-071	E.The word CONSTRAINT in the foreign key constraint on DEPT_ID must be changed to FOREIGN KEY.	f
1	210	1z0-071	A.SELECT TO_NUMBER(INTERVAL ‘800’ SECOND, ‘HH24:MM’) FROM DUAL;	f
2	210	1z0-071	B.SELECT TO_CHAR(INTERVAL ‘800’ SECOND, ‘HH24:MM’) FROM DUAL;Most Voted	t
3	210	1z0-071	C.SELECT TO_NUMBER(TO_DATE(INTERVAL ‘800’ SECOND)) FROM DUAL;	f
4	210	1z0-071	D.SELECT TO_DATE(TO_NUMBER(INTERVAL ‘800’ SECOND)) FROM DUAL;	f
5	210	1z0-071	E.SELECT TO_DATE(INTERVAL ‘800’ SECOND, ‘HH24:MM’) FROM DUAL;	f
1	211	1z0-071	A.SELECT TO_DATE(SYSDATE, 'FMDAY, DD MONTH, YYYY') FROM DUAL;	f
2	211	1z0-071	B.SELECT TO_CHAR(SYSDATE, 'FMDD, DAY MONTH, YYYY') FROM DUAL;	f
3	211	1z0-071	C.SELECT TO_CHAR(SYSDATE, 'FMDAY, DD MONTH, YYYY') FROM DUAL;Most Voted	t
4	211	1z0-071	D.SELECT TO_CHAR(SYSDATE, 'FMDAY, DDTH MONTH, YYYY') EROM DUAL;	f
1	212	1z0-071	A.Using <> ANY will display all the product names except the product named Fork.Most Voted	t
2	212	1z0-071	B.Using IN will display all the product names.	f
3	212	1z0-071	C.Using NOT IN or <> ANY will give the same result.	f
4	212	1z0-071	D.Using <> ANY will display all the product names.	f
5	212	1z0-071	E.Using NOT IN or <> ANY will give the same result.	f
1	213	1z0-071	A.Only if the salary is 20000 or less and the employee id is 125 or higher, insert EMPLOYEE_ID, MANAGER_ID, and SALARY into the MGR_HISTORY table.	f
2	213	1z0-071	B.Regardless of salary and employee id, insert EMPLOYEE_ID, MANAGER_ID, and SALARY into the MGR_HISTORY table.	f
3	213	1z0-071	C.Regardless of salary, only if the employee id is less than 125, insert EMPLOYEE_ID, MANAGER_ID, and SALARY into the MGR_HISTORY table.	f
4	213	1z0-071	D.Only if the salary is 20000 or less and the employee id is less than 125, insert EMPLOYEE_ID, MANAGER_ID, and SALARY into the MGR_HISTORY table.Most Voted	t
1	214	1z0-071	A.A GLOBAL TEMPORARY TABLE can have only one index.	f
2	214	1z0-071	B.A GLOBAL TEMPORARY TABLE can be referenced in the defining query of a viewMost Voted	t
3	214	1z0-071	C.DML on GLOBAL TEMPORARY TABLES generates no REDO.	f
4	214	1z0-071	D.A GLOBAL TEMPORARY TABLE cannot have a PUBLIC SYNONYM.	f
5	214	1z0-071	E.A GLOBAL TEMPORARY TABLE can have multiple indexes.Most Voted	t
6	214	1z0-071	F.A trigger can be created on a GLOBAL TEMPORARY TABLE.Most Voted	t
1	215	1z0-071	A.WHERE borrowed_date = SYSDATE AND (transaction_type = 'RM' AND member_id = 'A101' OR member_id = 'A102');	f
2	215	1z0-071	B.WHERE borrowed_date = SYSDATE AND (transaction_type = 'RM' AND (member_id = 'A101' OR member_id = 'A102'));	f
3	215	1z0-071	C.WHERE borrowed_date = SYSDATE AND transaction_type = 'RM' OR member_id IN ('A101', 'A102');Most Voted	t
4	215	1z0-071	D.WHERE borrowed_date = SYSDATE AND (transaction_type = 'RM' OR member_id IN ('A101', 'A102');	f
5	215	1z0-071	E.WHERE (borrowed_date = SYSDATE AND transaction_type = 'RM') OR member_id IN ('A101', 'A102');Most Voted	t
1	216	1z0-071	A.SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') - '01-JAN-2019' FROM	f
2	216	1z0-071	B.SELECT ROUND(SYSDATE - '01-JAN-2019') FROM DUAL;	f
3	216	1z0-071	C.SELECT ROUND(SYSDATE – TO_DATE('01/JANUARY/2019')) FROM DUAL;Most Voted	t
4	216	1z0-071	D.SELECT TO_DATE(SYSDATE, 'DD/MONTH/YYYY') - '01/JANUARY/2019' FROM DUAL;	f
5	216	1z0-071	E.SELECT SYSDATE - TO_DATE('01-JANUARY-2019') FROM DUAL;Most Voted	t
1	217	1z0-071	A.CREATE INDEX price_idx ON products (price);Most Voted	t
2	217	1z0-071	B.ALTER TABLE products SET UNUSED (expiry_date);	f
3	217	1z0-071	C.DROP TABLE products;Most Voted	t
4	217	1z0-071	D.ALTER TABLE products DROP COLUMN expiry_date;	f
5	217	1z0-071	E.TRUNCATE TABLE products;	f
6	217	1z0-071	F.ALTER TABLE products DROP UNUSED COLUMNS;Most Voted	t
1	218	1z0-071	A.Users must have the required privileges on the underlying objects to use public synonyms.Most Voted	t
2	218	1z0-071	B.Synonyms can be created for roles.	f
3	218	1z0-071	C.Synonyms cannot be created for sequences.	f
4	218	1z0-071	D.Synonyms cannot be created for synonyms.	f
5	218	1z0-071	E.Synonyms can be created for packages.Most Voted	t
6	218	1z0-071	F.Users must have the DBA role to create public synonyms.	f
1	219	1z0-071	A.SELECT	f
2	219	1z0-071	B.GROUP BYMost Voted	t
3	219	1z0-071	C.WHERE	f
4	219	1z0-071	D.ORDER BY	f
1	220	1z0-071	A.Sequence ORD_SEQ is guaranteed not to generate duplicate numbers.	f
2	220	1z0-071	B.Sequence ORD_SEQ cycles back to 1 after every 5000 numbers and can cycle 20 times.	f
3	220	1z0-071	C.Column ORD_NO gets the next number from sequence and ORD_SEQ whenever a row is inserted into ORD_ITEMS and no explicit value is given for ORD_NO.Most Voted	t
4	220	1z0-071	D.If sequence ORD_SEQ is dropped then the default value for column ORD_NO will be NULL for rows inserted into ORD_ITEMS.	f
5	220	1z0-071	E.Any user inserting rows into table ORD_ITEMS must have been granted access to sequence ORD_SEQ.Most Voted	t
1	221	1z0-071	A.A TIMESTAMP WITH LOCAL TIMEZONE data type column is stored in the database using the time zone of the session that inserted the row.	f
2	221	1z0-071	B.The SESSIONTIMEZONE function can return an offset from Universal Coordinated Time (UTC).Most Voted	t
3	221	1z0-071	C.The DBTIMEZONE function can return an offset from Universal Coordinated Time (UTC).Most Voted	t
4	221	1z0-071	D.The CURRENT_TIMESTAMP function returns data without time zone information.	f
5	221	1z0-071	E.A TIMESTAMP data type column contains information about year, month, and day.Most Voted	t
1	222	1z0-071	A.You use ALTER INDEX to make an INVISIBLE index VISIBLE.Most Voted	t
2	222	1z0-071	B.An INVISIBLE index consumes no storage.	f
3	222	1z0-071	C.The query optimizer never considers INVISIBLE indexes when determining execution plans.	f
4	222	1z0-071	D.You can only create one INVISIBLE index on the same column list.	f
5	222	1z0-071	E.All INSERT, UPDATE, and DELETE statements maintain entries in the index.Most Voted	t
1	223	1z0-071	A.A subquery cannot be used in the select list.	f
2	223	1z0-071	B.< ANY returns true if the argument is less than the highest value returned by the subquery.Most Voted	t
3	223	1z0-071	C.< ANY returns true if the argument is less than the lowest value returned by the subquery.	f
4	223	1z0-071	D.A subquery can be used in a HAVING clause.Most Voted	t
5	223	1z0-071	E.A subquery cannot be used in a FROM clause.	f
6	223	1z0-071	F.A subquery can be used in a WHERE clause.Most Voted	t
7	223	1z0-071	G.= ANY can only evaluate the argument against a subquery if it returns two or more values.	f
1	224	1z0-071	A.A one-to-one relationship is always a self-referencing relationship.	f
2	224	1z0-071	B.A relationship can be mandatory for both entities.Most Voted	t
3	224	1z0-071	C.A many-to-many relationship can be implemented only by using foreign keys.	f
4	224	1z0-071	D.A one-to-many relationship in one direction is a one-to-one relationship in the other direction.Most Voted	t
5	224	1z0-071	E.A table name can be specified just once when selecting data from a table having a self-referencing relationship.	f
1	225	1z0-071	A.They can use INNER JOIN and LEFT JOIN.Most Voted	t
2	225	1z0-071	B.They require the EXISTS operator in the join condition.	f
3	225	1z0-071	C.They require the NOT EXISTS operator in the join condition.	f
4	225	1z0-071	D.They require table aliases.Most Voted	t
5	225	1z0-071	E.They have no join condition.	f
6	225	1z0-071	F.They are always equijoins.	f
1	226	1z0-071	A.42	f
2	226	1z0-071	B.0	f
3	226	1z0-071	C.14Most Voted	t
4	226	1z0-071	D.28	f
1	227	1z0-071	A.providing graphical capabilities	f
2	227	1z0-071	B.processing sets of data	f
3	227	1z0-071	C.providing database transaction control	f
4	227	1z0-071	D.providing update capabilities for data in external files	f
5	227	1z0-071	E.providing variable definition capabilities	f
1	228	1z0-071	A.https://img.examtopics.com/1z0-071/image113.png	f
2	228	1z0-071	B.https://img.examtopics.com/1z0-071/image114.pngMost Voted	t
3	228	1z0-071	C.https://img.examtopics.com/1z0-071/image115.png	f
4	228	1z0-071	D.https://img.examtopics.com/1z0-071/image116.pngMost Voted	t
1	229	1z0-071	A.A PRIMARY KEY constraint can be added after a table has been created and populated.Most Voted	t
2	229	1z0-071	B.A FOREIGN KEY column can contain NULLs.Most Voted	t
3	229	1z0-071	C.A CHECK constraint can refer to values in other rows.	f
4	229	1z0-071	D.A NOT NULL constraint can be defined at the table level.	f
5	229	1z0-071	E.A UNIQUE constraint can use a pre-existing index on the constrained column or columns.Most Voted	t
6	229	1z0-071	F.A UNIQUE constraint permits NULLs.Most Voted	t
7	229	1z0-071	G.A column can have only one CHECK constraint.	f
1	230	1z0-071	A.1, 2 and 3	f
2	230	1z0-071	B.2, 3 and 4	f
3	230	1z0-071	C.1 only	f
4	230	1z0-071	D.2 and 3 onlyMost Voted	t
1	231	1z0-071	A.It will return the five employees earning the lowest salaries, in ascending order.Most Voted	t
2	231	1z0-071	B.It will return the six employees earning the highest salaries, in descending order.	f
3	231	1z0-071	C.It will return the six employees earning the lowest salaries, in ascending order.	f
4	231	1z0-071	D.It will return the five employees earning the highest salaries, in descending order.	f
1	232	1z0-071	A.INSERT INTO rate_list VALUES (0.999) produces an error.	f
2	232	1z0-071	B.INSERT INTO rate_list VALUES (-.9) inserts the value as -.9.Most Voted	t
3	232	1z0-071	C.INSERT INTO rate_list VALUES (87654.556) inserts the value as 87654.6.	f
4	232	1z0-071	D.INSERT INTO rate_list VALUES (-10) produces an error.	f
5	232	1z0-071	E.INSERT INTO rate_list VALUES (-99.99) inserts the value as 99.99.	f
6	232	1z0-071	F.INSERT INTO rate_list VALUES (0.551) inserts the value as .55.Most Voted	t
1	233	1z0-071	A.1 and 4 give different results.	f
2	233	1z0-071	B.2 returns the value 20.Most Voted	t
3	233	1z0-071	C.3 returns an error.	f
4	233	1z0-071	D.1 and 4 give the same result.Most Voted	t
5	233	1z0-071	E.2 and 3 give the same result.	f
1	234	1z0-071	A.SELECT last_name, (monthly_salary * 12) + (monthly_salary * 12 * NVL(monthly_commission_pct, 0)) AS annual_comp FROM employees;Most Voted	t
2	234	1z0-071	B.SELECT last_name, (monthly_salary * 12) + (monthly_salary * 12 * monthly_commission_pct) AS annual_comp FROM employees;	f
3	234	1z0-071	C.SELECT last_name, (monthly_salary + monthly_commission_pct) * 12 AS annual_comp FROM employees;	f
4	234	1z0-071	D.SELECT last_name, (monthly_salary * 12) + (monthly_commission_pct * 12) AS annual_comp FROM employees;	f
1	235	1z0-071	A.1 and 3Most Voted	t
2	235	1z0-071	B.2 and 3	f
3	235	1z0-071	C.1, 2, and 3	f
4	235	1z0-071	D.1 and 2	f
1	236	1z0-071	A.https://img.examtopics.com/1z0-071/image124.png	f
2	236	1z0-071	B.https://img.examtopics.com/1z0-071/image125.pngMost Voted	t
3	236	1z0-071	C.https://img.examtopics.com/1z0-071/image126.png	f
4	236	1z0-071	D.https://img.examtopics.com/1z0-071/image127.png	f
1	237	1z0-071	A.Both statements will execute successfully if you add E.AVG_SAL to the select list.	f
2	237	1z0-071	B.Both statements will display departments with no employees.Most Voted	t
3	237	1z0-071	C.Only the second statement will execute successfully if you add E.AVG_SAL to the select list.Most Voted	t
4	237	1z0-071	D.Only the first statement will display departments with no employees.	f
5	237	1z0-071	E.Only the second statement will display departments with no employees.	f
6	237	1z0-071	F.Only the first statement will execute successfully if you add E.AVG_SAL to the select list.	f
1	238	1z0-071	A.It can use subqueries to produce source rows.	f
2	238	1z0-071	B.It can update the same row of the target table multiple times.	f
3	238	1z0-071	C.It can update, insert, or delete rows conditionally in multiple tables.	f
4	238	1z0-071	D.It can use views to produce source rows.	f
5	238	1z0-071	E.It can merge rows only from tables.	f
6	238	1z0-071	F.It can combine rows from multiple tables conditionally to insert into a single table.	f
1	239	1z0-071	A.Primary key columns allow null values.	f
2	239	1z0-071	B.Every primary or unique key value must refer to a matching foreign key value.	f
3	239	1z0-071	C.Every foreign key value must refer to a matching primary or unique key value.	f
4	239	1z0-071	D.Foreign key columns allow null values.	f
5	239	1z0-071	E.Unique key columns allow null values.	f
1	240	1z0-071	A.table1 JOIN table2 USING (column1, column2)	f
2	240	1z0-071	B.table1 JOIN table2 ON (table1.column BETWEEN table2.column1 AND table2.column2)	f
3	240	1z0-071	C.table1 NATURAL JOIN table2	f
4	240	1z0-071	D.table1 JOIN table2 ON (table1.column >= table2.column)	f
5	240	1z0-071	E.table1 JOIN table2 ON (table1.column = table2.column) WHERE table2.column LIKE ‘A%’	f
1	241	1z0-071	A.Duplicates are eliminated automatically by the UNION ALL operator.	f
2	241	1z0-071	B.The output is sorted by the UNION ALL operator.	f
3	241	1z0-071	C.The names of columns selected in each SELECT statement must be identical.	f
4	241	1z0-071	D.NULLs are not ignored during duplicate checking.	f
5	241	1z0-071	E.The number of columns selected in each SELECT statement must be identical.	f
1	242	1z0-071	A.Query any table in a database.Most Voted	t
2	242	1z0-071	B.Execute a procedure in another schema.	f
3	242	1z0-071	C.Log in to a database instance.Most Voted	t
4	242	1z0-071	D.Access flat files, which are stored in an operating system directory, via the UTL_FILE package.Most Voted	t
5	242	1z0-071	E.Use the WITH GRANT OPTION clause.	f
1	243	1z0-071	A.GRANT CREATE SEQUENCE TO manager, emp;Most Voted	t
2	243	1z0-071	B.GRANT CREATE TABLE, emp TO manager;Most Voted	t
3	243	1z0-071	C.GRANT CREATE ANY SESSION, CREATE ANY TABLE TO manager;	f
4	243	1z0-071	D.GRANT SELECT, INSERT ON hr.employees TO manager WITH GRANT OPTION;	f
5	243	1z0-071	E.GRANT CREATE TABLE, SELECT ON hr.employees TO manager;	f
1	244	1z0-071	A.SELECT INITCAP(TRIM(‘H’ FROM ‘Hello World’)) FROM DUAL;	f
2	244	1z0-071	B.SELECT SUBSTR(‘Hello World’, 2) FROM DUAL;	f
3	244	1z0-071	C.SELECT LOWER(SUBSTR(‘Hello World’, 2, 1)) FROM DUAL;	f
4	244	1z0-071	D.SELECT LOWER(TRIM(‘H’ FROM ‘Hello World’)) FROM DUAL;Most Voted	t
5	244	1z0-071	E.SELECT LOWER(SUBSTR(‘Hello World’, 2)) FROM DUAL;Most Voted	t
1	245	1z0-071	A.https://img.examtopics.com/1z0-071/image130.png	f
2	245	1z0-071	B.https://img.examtopics.com/1z0-071/image131.png	f
3	245	1z0-071	C.https://img.examtopics.com/1z0-071/image132.png	f
4	245	1z0-071	D.https://img.examtopics.com/1z0-071/image133.pngMost Voted	t
1	246	1z0-071	A.Drop pseudocolumns from a table.	f
2	246	1z0-071	B.Restrict all DML statements on a table.Most Voted	t
3	246	1z0-071	C.Lock a set of rows in a table.	f
4	246	1z0-071	D.Rename a table.Most Voted	t
5	246	1z0-071	E.Drop all columns simultaneously from a table.	f
6	246	1z0-071	F.Enable or disable constraints on a table.Most Voted	t
1	247	1z0-071	A.The default length for a CHAR column is always one character.	f
2	247	1z0-071	B.A VARCHAR2 blank-pads column values only in the data stored is non-numeric and contains no special characters.	f
3	247	1z0-071	C.A VARCHAR2 column definition does not require the length to be specified.	f
4	247	1z0-071	D.A CHAR column definition does not require the length to be specified.Most Voted	t
2	249	1z0-071	B.RIGHT OUTER JOIN with self join	f
5	247	1z0-071	E.A BLOB stores unstructured binary data within the database.Most Voted	t
6	247	1z0-071	F.A BFILE stores unstructured binary data in operating system files.Most Voted	t
1	248	1z0-071	A.UPDATE can be granted only on tables and views.Most Voted	t
2	248	1z0-071	B.DELETE can be granted on tables, views, and sequences.	f
3	248	1z0-071	C.SELECT can be granted on tables and views.	f
4	248	1z0-071	D.ALTER can be granted only on tables and sequences.Most Voted	t
5	248	1z0-071	E.REFERENCES can be granted only on tables and views.Most Voted	t
6	248	1z0-071	F.INSERT can be granted on tables, views, and sequences.	f
3	249	1z0-071	C.LEFT OUTER JOIN with self join	f
4	249	1z0-071	D.FULL OUTER JOIN with self join	f
5	249	1z0-071	E.subqueryMost Voted	t
1	250	1z0-071	A.Rolling back to a SAVEPOINT can undo a CREATE INDEX statement.	f
2	250	1z0-071	B.Only one SAVEPOINT may be issued in a transaction.	f
3	250	1z0-071	C.Rolling back to a SAVEPOINT can undo a DELETE statement.	f
4	250	1z0-071	D.A SAVEPOINT does not issue a COMMIT.	f
5	250	1z0-071	E.Rolling back to a SAVEPOINT can undo a TRUNCATE statement.	f
1	251	1z0-071	A.SELECT customer_id AS “CUSTOMER_ID”, transaction_date AS “DATE”, amount + 100 DUES FROM transactions;Most Voted	t
2	251	1z0-071	B.SELECT customer_id AS ‘CUSTOMER_ID’, transaction_date AS DATE, amount + 100 ‘DUES’ FROM transactions;	f
3	251	1z0-071	C.SELECT customer_id AS “CUSTOMER_ID”, transaction_date AS DATE, amount + 100 “DUES” FROM transactions;	f
4	251	1z0-071	D.SELECT customer_id AS CUSTOMER_ID, transaction_date AS TRANS_DATE, amount + 100 “DUES AMOUNT” FROM transactions;Most Voted	t
5	251	1z0-071	E.SELECT customer_id CUSTID, transaction_date TRANS_DATE, amount + 100 DUES FROM transactions;	f
1	252	1z0-071	A.WITH GRANT OPTTON cannot be used when granting an object privilege to PUBLIC.Most Voted	t
2	252	1z0-071	B.WITH GRANT OPTION can be used when granting an object privilege to both users and roles.	f
3	252	1z0-071	C.Revoking an object privilege that was granted with the WITH GRANT OPTION clause has a cascading effect.C. Adding a primary key constraint to an existing table in another schema requires a system privilege.Most Voted	t
4	252	1z0-071	D.Adding a foreign key constraint pointing to a table in another schema requires the REFERENCES object privilege.Most Voted	t
5	252	1z0-071	E.Revoking a system privilege that was granted with WITH ADMIN OPTION has a cascading effect.	f
1	253	1z0-071	A.DML statements cannot be used on them.Most Voted	t
2	253	1z0-071	B.You can populate them from existing data in the database by using the CREATE TABLE AS SELECT command.Most Voted	t
3	253	1z0-071	C.Their data can be retrieved by using only SQL or PL/SQL.	f
4	253	1z0-071	D.Indexes can be created on them.	f
5	253	1z0-071	E.Their metadata and actual data are both stored outside the database.	f
1	254	1z0-071	A.ALTER VIEW emp_view ADD (employee.manager_id);	f
2	254	1z0-071	B.ALTER VIEW emp_view MODIFY (SELECT employee_id, employee_name, department_name, manager_idFROM employees e, departments d -WHERE e.department_id = d.department_id);	f
3	254	1z0-071	C.ALTER VIEW emp_view ADD (SELECT manager_id FROM employees);	f
4	254	1z0-071	D.CREATE OR REPLACE VIEW emp_view ASSELECT employee_id, employee_name, department_name, manager_idFROM employees e, departments d -WHERE e.department_id = d.department_id;Most Voted	t
1	255	1z0-071	A.System privileges always set privileges for an entire database.	f
2	255	1z0-071	B.PUBLIC can be revoked from a user.	f
3	255	1z0-071	C.All roles are owned by the SYS schema.	f
4	255	1z0-071	D.A user has all object privileges for every object in their schema by default.Most Voted	t
5	255	1z0-071	E.A role is owned by the user who created it.	f
6	255	1z0-071	F.A role can contain a combination of several privileges and roles.Most Voted	t
7	255	1z0-071	G.PUBLIC acts as a default role granted to every user in a database.Most Voted	t
1	256	1z0-071	A.https://img.examtopics.com/1z0-071/image137.png	f
2	256	1z0-071	B.https://img.examtopics.com/1z0-071/image138.png	f
3	256	1z0-071	C.https://img.examtopics.com/1z0-071/image139.png	f
4	256	1z0-071	D.https://img.examtopics.com/1z0-071/image140.png	f
1	257	1z0-071	A.It can be used for system and object privileges.	f
2	257	1z0-071	B.The grantee can grant the object privilege to any user in the database, with or without including this option.Most Voted	t
3	257	1z0-071	C.The grantee must have the GRANT ANY OBJECT PRIVILEGE system privilege to use this option.	f
4	257	1z0-071	D.It cannot be used to pass on privileges to PUBLIC by the grantee.	f
5	257	1z0-071	E.It can be used when granting privileges to roles.	f
6	257	1z0-071	F.It can be used to pass on privileges to other users by the grantee.Most Voted	t
1	258	1z0-071	A.SELECT dept_id, join_date, SUM(salary) FROM employees GROUP BY dept_id;	f
2	258	1z0-071	B.SELECT dept_id, join_date, SUM(salary) FROM employees GROUP BY dept_id, join_date;	f
3	258	1z0-071	C.SELECT dept_id, MAX(AVG(salary)) FROM employees GROUP BY dept_id;	f
4	258	1z0-071	D.SELECT dept_id, AVG(MAX(salary)) FROM employees GROUP BY dept_id;	f
1	259	1z0-071	A.SELECT CURRVAL FROM emp_seq;	f
2	259	1z0-071	B.SELECT emp_seq.CURRVAL FROM DUAL;Most Voted	t
3	259	1z0-071	C.SELECT NEXTVAL FROM emp_seq;	f
4	259	1z0-071	D.SELECT emp_seq.NEXTVAL FROM DUAL;	f
1	260	1z0-071	A.SALES1 is created with 55,000 rows.Most Voted	t
2	260	1z0-071	B.SALES1 has NOT NULL constraints on any selected columns which had those constraints in the SALES table.Most Voted	t
3	260	1z0-071	C.SALES1 is created with no rows.	f
4	260	1z0-071	D.SALES1 is created with 1 row	f
5	260	1z0-071	E.SALES1 has PRIMARY KEY and UNIQUE constraints on any selected columns which had those constraints in the SALES table.	f
1	261	1z0-071	A.TRUNC : can be used with NUMBER and DATE valuesMost Voted	t
2	261	1z0-071	B.FLOOR : returns the smallest integer greater than or equal to a specified number	f
3	261	1z0-071	C.MOD : returns the quotient of a division operation	f
4	261	1z0-071	D.CEIL : can be used for positive and negative numbersMost Voted	t
5	261	1z0-071	E.CONCAT : can be used to combine any number of values	f
3	262	1z0-071	C.3	f
4	262	1z0-071	D.5D. 5 01-MAR-2019Most Voted	t
5	262	1z0-071	E.3 01-JAN-2019	f
6	262	1z0-071	F.4 01-FEB-2019	f
1	263	1z0-071	A.You can add a USING clause with a join condition.	f
2	263	1z0-071	B.You can add an ON clause with a join condition.	f
3	263	1z0-071	C.You can add a WHERE clause with filtering criteria.Most Voted	t
4	263	1z0-071	D.It returns the number of rows in bricks plus the number of rows in COLORS.	f
5	263	1z0-071	E.It returns the same rows as SELECT * FROM bricks CROSS JOIN colors;.Most Voted	t
1	264	1z0-071	A.Line 3	f
2	264	1z0-071	B.Line 5	f
3	264	1z0-071	C.Line 7	f
4	264	1z0-071	D.Line 8Most Voted	t
1	265	1z0-071	A.It is used to specify an equijoin of columns that have the same name in both tables.Most Voted	t
2	265	1z0-071	B.It can never be used with a full outer join.	f
3	265	1z0-071	C.It can never be used with a natural join.Most Voted	t
4	265	1z0-071	D.All column names in a USING clause must be qualified with a table name or table alias.	f
5	265	1z0-071	E.It is used to specify an explicit join condition involving operators.	f
1	266	1z0-071	A.SYSDATE can be queried only from the dual table.	f
2	266	1z0-071	B.SYSDATE can be used in expressions only if the default date format is DD-MON-RR.	f
3	266	1z0-071	C.CURRENT_DATE returns the current date and time as per the session time zone.	f
4	266	1z0-071	D.CURRENT_TIMESTAMP returns the same date as CURRENT_DATE.	f
5	266	1z0-071	E.CURRENT_TIMESTAMP returns the same date and time as SYSDATE with additional details of fractional seconds.	f
6	266	1z0-071	F.SYSDATE and CURRENT__DATE return the current date and time set for the operating system of the database server.	f
1	267	1z0-071	A.A new column with the name DEPARTMENT_ID can be added to the EMPLOYEES table.	f
2	267	1z0-071	B.No updates can be made to the data in the DEPARTMENT_ID column.	f
3	267	1z0-071	C.The DEPARTMENT_ID column can be recovered from the recycle bin.Most Voted	t
4	267	1z0-071	D.The storage space occupied by the DEPARTMENT_ID column is released only after a COMMIT is issued.	f
5	267	1z0-071	E.A query can display data from the DEPARTMENT_ID column.	f
6	267	1z0-071	F.The DEPARTMENT_ID column is set to null for all rows in the table.	f
1	268	1z0-071	A.It can include the CREATE..INDEX statement for creating an index to enforce the primary key constraint.	f
2	268	1z0-071	B.The owner of the table should have space quota available on the tablespace where the table is defined.Most Voted	t
3	268	1z0-071	C.It implicitly executes a commit.Most Voted	t
4	268	1z0-071	D.It implicitly rolls back any pending transactions.	f
5	268	1z0-071	E.A user must have the CREATE ANY TABLE privilege to create tables.Most Voted	t
6	268	1z0-071	F.The owner of the table must have the UNLIMITED TABLESPACE system privilege.	f
1	269	1z0-071	A.ALTER TABLE products DROP COLUMN expiry_date;	f
2	269	1z0-071	B.TRUNCATE TABLE products;	f
3	269	1z0-071	C.DROP TABLE products;Most Voted	t
4	269	1z0-071	D.CREATE INDEX price_idx ON products (price);Most Voted	t
5	269	1z0-071	E.ALTER TABLE products DROP UNUSED COLUMNS;Most Voted	t
6	269	1z0-071	F.ALTER TABLE products SET UNUSED (expiry_date);	f
1	270	1z0-071	A.Primary key and foreign key constraints can be defined at both the column and table level.Most Voted	t
2	270	1z0-071	B.A table can have only one primary key and one foreign key.	f
3	270	1z0-071	C.The foreign key columns and parent table primary key columns must have the same names.	f
4	270	1z0-071	D.A table can have only one primary key but multiple foreign keys.Most Voted	t
5	270	1z0-071	E.Only the primary key can be defined at the column and table level.	f
6	270	1z0-071	F.It is possible for child rows that have a foreign key to remain in the child table at the time the parent row is deleted.Most Voted	t
7	270	1z0-071	G.It is possible for child rows that have a foreign key to be deleted automatically from the child table at the time the parent row is deleted.Most Voted	t
1	271	1z0-071	A.The statement executes successfully only if the subquery does not return multiple rows.	f
2	271	1z0-071	B.The subquery is not a correlated subquery.	f
3	271	1z0-071	C.The subquery is evaluated once for each row selected by the outer query.	f
4	271	1z0-071	D.The subquery is executed for every row in the EMP_HISTORY table.Most Voted	t
5	271	1z0-071	E.The subquery is a correlated subquery.	f
1	272	1z0-071	A.You must have the UNLIMITED TABLESPACE privilege.	f
2	272	1z0-071	B.You must have either the SELECT privilege on the table or the SELECT ANY TABLE privilege.	f
3	272	1z0-071	C.You must have the CREATE ANY INDEX privilege.	f
4	272	1z0-071	D.You have the UNLIMITED TABLESPACE privilege or sufficient quota for the tablespace to contain the index.Most Voted	t
5	272	1z0-071	E.You have either the INDEX privilege on the table or the CREATE ANY INDEX privilege.Most Voted	t
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (name) FROM stdin;
Oracle
\.


--
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discussions (number, question_number, question_exam, selected_answer, text, upvote) FROM stdin;
1	1	1z0-071	Selected Answer: AC	i think	1
2	1	1z0-071	Selected Answer: AC	A & C is correct	1
3	1	1z0-071	Selected Answer: AC	A-C is correct	1
4	1	1z0-071	Selected Answer: AC	A and C are correct options	1
5	1	1z0-071	Selected Answer: AC	B: Has two distincts in the statement. Not correct. \nD: The position of the distinct is not correct\nE: it is not returning unique values.	2
6	1	1z0-071	null	A and C is the correct answer.	1
7	1	1z0-071	Selected Answer: AC	Correct answers	1
8	1	1z0-071	Selected Answer: AC	A and C are correct.	1
9	1	1z0-071	Selected Answer: AC	Agree that right answers are A and C	1
10	1	1z0-071	Selected Answer: AC	Agree that right answers are A and C	1
11	1	1z0-071	Selected Answer: AC	Distinct is used to get distinct set of values for one or more columns mentioned in select statement	2
12	1	1z0-071	Selected Answer: AC	The correct answers	1
13	1	1z0-071	Selected Answer: AC	AC are correct	1
14	1	1z0-071	null	-- Distinct keyword is used to select the unique values of the column/combination of columns mentioned after the DISTINCT clause.\n   \n     Thus Option E is incorrect , as this does not use DISTINCT clause and might include duplicates.\n\t \n   -- Distinct should be used once in a SELECT statement and should be used IMMEDIATELY after the SELECT clause. NOT to be used before every column.\n     \n\t Thus Options D and B are incorrect, as the positioning of the DISTINCT clause is incorrect.\n\t \n   -- Option A and C are correct.\n   \n     Option A: Even though there is a string ' has ' in everyrow returned , the combination of promo_category  || ' has ' || promo_cost will still be distinct.\n\t Option C: correct use case. ORDER BY clause does not affect the uniqueness in the returned result set.	4
15	1	1z0-071	Selected Answer: AC	AC are correct. DB have Distinct in a wrong position in the query and E returns all because of the missing DISTINCT	2
16	1	1z0-071	null	Option A is not correct because the query uses the "||" operator to concatenate the promo_category and promo_cost columns with a string ' has ' in between. This creates a new column "COSTS" that combines the values from the two columns in a way that is not useful for the task of displaying unique promotion costs in each promotion category. The SELECT DISTINCT statement is used on this combined column, so it will return unique values for the concatenated column, but it does not address the requirement of showing unique promotion costs in each promotion category. Additionally, it uses an ORDER BY 1 which in this case doesn't make sense since the column COSTS doesn't exist.	1
17	1	1z0-071	null	distinct must come soon after the select keyword and only one per select statement	1
18	1	1z0-071	null	AC are correct. DB have Distinct in a wrong position in the query and E returns all because of the missing DISTINCT	2
19	1	1z0-071	null	ac are correct answers	2
1	2	1z0-071	null	BCE should be correct answer cause number+varchar in this case imspossible	8
2	2	1z0-071	Selected Answer: BCF	BCF - would be correct	1
3	2	1z0-071	Selected Answer: BCF	A: Discount field doesn't exist in the table. \nB: OK\nC: OK\nD: Discount field doesn't exist in the table. \nE: Date * Number is not a valid operation\nF: Depending on the values, it may or may not be OK. if the entered values are numeric, this statement will work. Because the question requires 3 answers, I pass this option as correct.	1
4	2	1z0-071	Selected Answer: BCF	F works (altough is VARCAR2) if its content is numeric,	1
5	2	1z0-071	Selected Answer: BCF	B and C clearly correct.\nF is tricky. It can be correct only if the column Surcharge contains numeric characters defined as varchar2	2
6	2	1z0-071	Selected Answer: BCF	A and D wrong cause they have invalid identifier "Discount".\nE wrong cause date can't multiple with number.	1
7	2	1z0-071	null	BCF is correct answer\nPlease note:\ndate+date is not allowed	2
8	2	1z0-071	Selected Answer: BCF	It´s not a right decision plus a NUMBER with VARCHAR2 fields.	1
9	2	1z0-071	null	Seems like a sketchy question, have to assume surcharge contains only numerical characters in the string for F	3
10	2	1z0-071	null	BCF \nThe three queries that use valid expressions are:\n\nB. SELECT product_id, (unit_price * 0.15 / (4.75 + 552.25)) FROM products;\n\nC. SELECT product_id, (expiry_date - delivery_date) * 2 FROM products;\n\nF. SELECT product_id, unit_price, unit_price + surcharge FROM products;\n\nExplanation:\n\nA. This query is invalid because the alias "S" is not defined anywhere in the query.\n\nB. This query is valid. It calculates a value based on the unit price of each product using a mathematical expression.\n\nC. This query is valid. It calculates the difference between the expiry date and delivery date for each product and multiplies it by 2.\n\nD. This query is invalid because the alias "discount" is not defined anywhere in the query.\n\nE. This query is invalid because you cannot multiply a date value by a number.\n\nF. This query is valid. It selects the product ID, unit price, and the sum of the unit price and surcharge for each product.	3
11	2	1z0-071	null	select '2'+3 from dual;\n\nit produces the SUM correctly so F is correct	2
12	2	1z0-071	null	B-C-F IS CORRECT IF the varchar-column has stored number.	2
13	2	1z0-071	null	why is D incorrect?	3
14	2	1z0-071	null	Is "-discount" in AD supposed to be an alias for the column?	1
15	2	1z0-071	null	IT is correct BCF because in the Datatype Varchar2 there may be a number. Oracle makes it an implicit cast and uses it as a number	4
16	2	1z0-071	null	you cant multiply date, BCF correct if varchar2 is number	4
17	2	1z0-071	null	bce should be	2
1	3	1z0-071	Selected Answer: CD	D. Table aliases can improve performance. Table aliases can improve performance by reducing the amount of parsing needed to execute the query.\n\nC. The Oracle join syntax performs better than the SQL:1999 compliant ANSI join syntax in Oracle 18c. Oracle's join syntax can result in better performance in certain scenarios as it allows the optimizer to understand the join order and access paths more effectively.\n\nTherefore, options C and D are correct. Options A, B, and E are incorrect.	6
2	3	1z0-071	Selected Answer: E	Those who answered D - provide a link with the Oracle documentation as a prove! \nE - is correct.	1
3	3	1z0-071	Selected Answer: DE	DE are correct	1
1	7	1z0-071	Selected Answer: AE	Its A & E not D.\nwhy? read below\nD. The foreign key constraint will be disabled. \nThis is incorrect because the question states that the SQL statements execute successfully, so the foreign key constraint would typically be enabled, not disabled.	1
1	223	1z0-071	null	CDF for sure	1
4	3	1z0-071	Selected Answer: E	A and B are false, no discussion.\nC. Oracle's query optimizer internally rewrites both syntaxes into the same execution plan. The decision on how to execute the join—nested loop, hash join, merge join, etc.—is based on statistics, indexes, and optimizer settings, not on the join syntax itself.\nD. Oracle's SQL parser and optimizer are designed to handle fully qualified table names just as efficiently as aliases. The use of aliases affects only the textual complexity of the query, not the underlying parsing or optimization time in any meaningful or measurable way.	1
5	3	1z0-071	Selected Answer: DE	Oracle's official stance: Oracle documentation explicitly states that the SQL:1999-compliant join syntax does not offer any performance benefits over the Oracle-proprietary join syntax that existed in prior releases	1
6	3	1z0-071	Selected Answer: DE	D, E with no doupt	1
7	3	1z0-071	Selected Answer: DE	D. Table aliases can improve performance. Most Voted\nE. The join syntax used makes no difference to performance.	1
8	3	1z0-071	Selected Answer: DE	D. Table aliases can improve performance. Most Voted\nE. The join syntax used makes no difference to performance.	1
9	3	1z0-071	Selected Answer: DE	A and B states ALWAYS - which is not always the case. \nC: The join syntax doesn't make much difference with performance. \nD: That's correct; it helps the optimizer\nE: this makes sense to me - The joint syntax doesn't make a difference.	1
10	3	1z0-071	Selected Answer: CD	According to some papers and IA, these must be the better options...	1
11	3	1z0-071	null	options D and E are correct\nOptions C are incorrect because the SQL:1999–compliant join syntax does not offer any \nperformance benefits over the Oracle-proprietary join syntax that existed in the earlier releases.	1
12	3	1z0-071	null	i find D and E a little bit contradictory, do aliases come under join syntax?	1
13	3	1z0-071	Selected Answer: DE	D. Table aliases can improve performance.\nE. the difference related to performance that can be experimented between the two join syntax is minimum since Oracle optimizes internally both manners in a similar way	1
14	3	1z0-071	null	C and D is true.\nC is true because oracle Join does perform better.\nD is true. Table aliases improve the I/O. Refer:\nhttps://docs.oracle.com/middleware/1221/bip/BIPDM/best_practices.htm\nE is false. It does affect performance. Refer:\nhttps://docs.oracle.com/cd/F49540_01/DOC/server.815/a67781/c20c_joi.htm	1
15	3	1z0-071	Selected Answer: DE	Table alias makes it easy for the parser to look up the columns in their respective tables.\n"Join" or "Where T1.id=T2.id" conditions have no difference in performance, though join is recommended to be used as the new syntax.	1
16	3	1z0-071	Selected Answer: CE	I vote for answers C and E. To be honest, I don't know how good they are, so vague are their contents...  I just know that answers A, B and C are wrong. \nSo I vote by elemination.	1
17	3	1z0-071	null	C and E correct.	1
18	3	1z0-071	Selected Answer: DE	D E are correct	3
19	3	1z0-071	Selected Answer: DE	C D E are all correct it seems\nhttps://www.examtopics.com/discussions/oracle/view/10257-exam-1z0-071-topic-1-question-253-discussion/	1
20	3	1z0-071	null	Table aliases can improve performance: Table aliases can potentially improve performance by making the query more readable and reducing the length of the query statements. They can also help to avoid ambiguity when referencing columns from multiple tables. However, the improvement in performance is not directly related to the use of table aliases but rather to the improved readability and maintainability of the query.	1
21	3	1z0-071	null	C AND E, fundamental NATURAL JOIN performance, Alias table, less memory disc not performance in execution.	1
22	3	1z0-071	null	D/E Are good, because if you use alianses you say to Oracle where to find.	1
23	3	1z0-071	null	I read that aliases do indeed improve performance, ex. when you order by a column, the parser doesn't need to check all the tables in the query, to find which one the column belongs to. Can anyone confirm this?	3
24	3	1z0-071	null	I disagree with D, table alias does not improve performance. Alias is often used to make it more readable.	1
25	3	1z0-071	null	A B incorrect because Oracle Between is converted to >= <=\nC Is arguable\nD is not true, you don't find a book saying table alias can improve performance. \nE is arguable\nC E to answer this poorly designed question	4
1	4	1z0-071	null	maby AE is Right...\nC. CEIL returns the largest integer less than or equal to a specified number.\nCan change : CEIL returns the minmum integer more than or equal to a specified number	13
2	4	1z0-071	Selected Answer: AE	A and E	1
3	4	1z0-071	Selected Answer: AE	The only possible responses	1
4	4	1z0-071	Selected Answer: AE	B is wrong because [select ceil('12,4') from dual;] . '12.4' is char type, Oracle use implicit conversion to make the argument is valid if they can be.	1
5	4	1z0-071	Selected Answer: AE	The only possible responses	1
6	4	1z0-071	null	The two true statements are:\nAE\nExplanation: \n\nB. CEIL is an Oracle SQL function that requires an argument which is a numeric data type. This statement is false, as CEIL can also take input arguments of type DATE or TIMESTAMP.\n\nC. CEIL is an Oracle SQL function that returns the smallest integer greater than or equal to a specified number. This statement is false, as CEIL actually returns the largest integer less than or equal to a specified number.\n\nD. LAST_DAY is an Oracle SQL function that returns the date of the last day of the current month only. This statement is false, as LAST_DAY can be used with any date argument to return the last day of that month.\n\nE. This statement is true. LAST_DAY is an Oracle SQL function that can be used with a date argument to return the date of the last day of the month for that date. For example, LAST_DAY('2023-06-26') would return '2023-06-30'.\n\nF. This statement is false. LAST_DAY can be used with any date argument to return the last day of that month, not just the previous month.	3
7	4	1z0-071	null	AE is correct since ceil returns minimum integer greater than or equal to specified value.	1
8	4	1z0-071	Selected Answer: AE	https://docs.oracle.com/database/121/SQLRF/functions025.htm\n"CEIL returns the smallest integer that is greater than or equal to n. "	1
9	4	1z0-071	null	A and E is the correct answer. C is incorrect because ceil always return smallest integer  greater than or equal to values.	1
2	7	1z0-071	null	Never knew what DEFERRED was. One keeps, learning every day.	2
3	7	1z0-071	Selected Answer: AD	DEFERRED: allows to make insertions and updates without immediate validation, only when you commit	1
4	7	1z0-071	Selected Answer: AD	AD is the correct answer	2
1	251	1z0-071	null	ADE correct.	2
10	4	1z0-071	Selected Answer: AB	Based on Oracle's definitions, even though they do not make sense. Since when common sense is common practice? Anyhow for test purposes. According to that information I believe the correct answers are ABE. Although you can only choose 2. \n\nOracle's Definition of CEIL: CEIL returns the smallest integer that is greater than or equal to n. ( https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CEIL.html#GUID-6DCC9AFB-9B80-4C27-AF63-5AA3B1E43660 ) \n\nC is incorrect as it says: CEIL returns the largest integer less than or equal to a specific number. This is the definition of FLOOR ( https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/FLOOR.html#GUID-67F61AC7-C097-4397-A122-213157BF584F )\n\nE: LAST_DAY  ( https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/LAST_DAY.html#GUID-296C7C02-7FB9-4AAC-8927-6A79320CE0C6 )	1
11	4	1z0-071	null	B also could an answer as if you execute select ceil('abc') from dual; you get ORA-017222: invalid number. \n\nMaking this even more confusing.	2
12	4	1z0-071	Selected Answer: AE	AE is the correct answer.\nSELECT LAST_DAY(TO_DATE('09-SEP-2023')) FROM DUAL;\n//op- 30-09-2023\nSELECT CEIL('100'.2) FROM DUAL;\n//op 101\nselect add_months(TO_DATE('25-DEC-2023'),3) from dual;\n//op 25-03-2024	1
13	4	1z0-071	null	A and E are the correct answers.\nA - ADD_MONTHS returns the date date plus integer months. (https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/ADD_MONTHS.html#GUID-B8C74443-DF32-4B7C-857F-28D557381543)\nE - LAST_DAY returns the date of the last day of the month that contains date. The return type is always DATE, regardless of the datatype of date. (https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions072.htm)	1
14	4	1z0-071	null	C. CEIL returns the largest integer less than or equal to a specified number.\nHow does Option:C is correct. CEIL always return greater than or equal to specified number.	3
15	4	1z0-071	null	AE is correct, C is false CEIL return SMALL NOT LARGEST https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/CEIL.html#GUID-6DCC9AFB-9B80-4C27-AF63-5AA3B1E43660	1
16	4	1z0-071	null	por sure AE are correct. C cannot be correct by "CEIL returns the largest integer...". Correct answer should be "CEIL returns the smallest integer..."	1
17	4	1z0-071	Selected Answer: AE	C is the definition of FLOOR()!	3
18	4	1z0-071	null	I think that these are correct: A, B, E. \nC is wrong because CEIL returns the smallest integer that is greater than or equal to the specified number	1
19	4	1z0-071	Selected Answer: AE	C is wrong because \nCEIL returns the smallest integer greater than or equal to a specified number.\nhttps://docs.oracle.com/database/121/SQLRF/functions025.htm#SQLRF00614\n\nE is good \nBecause \nselect last_day(('01-FEB-2023')) as "xxxgg" from dual;\nAnswer : 2/28/2023\n\nFinally the answer is AE	1
20	4	1z0-071	null	Why B is not correct ?? It is true the CIEL_FUNCTION() requires a numeric data type. I do not understand why it is being ignored!\n\nplease refer to this source:\nhttps://www.w3resource.com/sql/arithmetic-functions/ceil-with-positive-value.php	2
21	4	1z0-071	null	I understand why it is A and C. I do not understand why D is not correct??	1
22	4	1z0-071	Selected Answer: AE	Answer: A, E\n"CEIL returns smallest integer greater than or equal to n. and can use any numeric or nonnumeric data type that can be implicit converted to numeric adta type"\nhttps://docs.oracle.com/database/121/SQLRF/functions025.htm#SQLRF00614	4
23	4	1z0-071	Selected Answer: AE	A, E may be right.\nAs per option C, Ceil returns the lesser integer compared to the argument provided.\nlast_day('date') provides the last day of whatever date is provided as argument.	2
1	5	1z0-071	Selected Answer: BCE	yes bce	1
2	5	1z0-071	Selected Answer: BCE	Almost all objects can have synonyms. And drop implies privileges	1
3	5	1z0-071	Selected Answer: BCE	bce, ecb	1
4	5	1z0-071	Selected Answer: BCE	BCE is the correct answer!	1
5	5	1z0-071	null	BCE is the correct answer!	1
6	5	1z0-071	null	D) Any user can drop a PUBLIC synonym. False. Must have system privilege to create or drop a PUBLIC SYNONYM.	2
7	5	1z0-071	null	bce are the correct answers	1
1	6	1z0-071	Selected Answer: AF	FLOOR arredonda o número para baixo, para o inteiro mais próximo. \nCONCAT  é usada para concatenar duas ou mais cadeias de caracteres em uma única string	1
2	6	1z0-071	null	In 23 ora version B is possible.	1
3	6	1z0-071	Selected Answer: AF	Selected Answer: AF	1
4	6	1z0-071	Selected Answer: AF	A. CONCAT joins two character strings together\nF. FLOOR returns the largest integer less than or equal to a specified number	2
5	6	1z0-071	Selected Answer: BF	B is correct, CONCAT joins two or more arguments.\n\n--Example query\nselect concat('this ', 'is ', 'a ', 'test') concat from dual;\n\nOutput: "this is a test"\n\nF is also correct, since it accepts negative numbers as well.\n\n--Example query\nselect floor(-5.2526) from dual;\n\nOutput: -6 (-6 is smaller than -5, it also caught me offguard the first time).	1
6	6	1z0-071	Selected Answer: BF	Starting from Oracle 23c, CONCAT can take multiple arguments:\nhttps://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/CONCAT.html\nhttps://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/CONCAT.html	1
7	6	1z0-071	null	I thought B was correct, whereas it depends on the database. Oracle defers from Microsoft.	1
8	6	1z0-071	Selected Answer: AF	floor(12.3) returns 12 and ceil(12.3) returns 13	1
9	6	1z0-071	null	How F can be correct?!  Okay, in oracle documents it is mentioned like : FLOOR returns the largest integer equal to or less than n. \nBut why it returns less than inputted value?? (select floor(15,7) from dual => output is 15) \nThat statement is proper for CEIL function for my point of view. \nCan anyone help me to overcome this simply seem but complicated question?	1
10	6	1z0-071	null	How F is correct. \nIn case argument is passed in a negative. eg -1.4. The output is -2.\nBut -1 is greater than -2. And, its contrast with option F.\nF. FLOOR returns the largest integer less than or equal to a specified number.\n\nselect floor(-1.4) from dual;\no/p\n---2	3
11	6	1z0-071	Selected Answer: AF	A. CONCAT joins two character strings together.\nF. FLOOR returns the largest integer less than or equal to a specified number.	2
12	6	1z0-071	Selected Answer: AF	A-F Correct	1
13	6	1z0-071	null	Why option-b is not correct? can any one explain	1
14	6	1z0-071	null	how is F correct?	1
5	7	1z0-071	null	What does it mean by IMMEDIATE tho?	1
6	7	1z0-071	null	is AD\nPK enable again	1
7	7	1z0-071	null	AD\nCascade constraint will disable to primay key as well as foreign key.	2
8	7	1z0-071	null	AD. Due to the PK being disabled, the FK is disabled. PK afterwards is enabled again	3
1	8	1z0-071	null	A and D tested on Oracle 12c1	14
2	8	1z0-071	Selected Answer: AD	Correct answers are A,D	1
3	8	1z0-071	Selected Answer: AD	Correct Answers:\nA. All existing rows in the ORDERS table are updated.\nD. The subquery is executed for every updated row in the ORDERS table.	2
4	8	1z0-071	Selected Answer: AD	No WHEN in update: all rows will be updated. Correlated subquery, will execute for every row in the upddate	1
5	8	1z0-071	null	SHOULD BE b AND d	1
6	8	1z0-071	Selected Answer: AD	B (false), depending EXPLAIN PLAN. no always is executed first.\nC (false), ".o" is correlative\nE (false) is possible multiple rows, an error more than row.\nA and D is correct	2
7	8	1z0-071	Selected Answer: AD	sHOULD BE a AND d	1
8	8	1z0-071	null	AD option is right	1
9	8	1z0-071	null	AD; cannot be B, correlated subqueries are not executed before the parent (outer) query.  Cannot be E, cannot set customer_name to multiple values for each row	1
10	8	1z0-071	Selected Answer: AD	A is correct \nD :It will retrieve the matching value for each row from the table orders with the table customers	1
11	8	1z0-071	null	BD,\nA is incorrect only matching rows are updated, not all\nC is invalid, statement correct structure\nE is incorrect, in case multiple rows, error multiple rows in subquery	4
12	8	1z0-071	null	Can someone explain why A is correct?	1
13	8	1z0-071	null	I think B is correct,  subquery will execute for each row its right but also update will update for each raw after fulfilling the condition of subquery :) \nThen how update will update each raw ? update will check its resources "subquery" is condition met ? yes ? then update after execute subquery and fully checking it.	1
14	8	1z0-071	Selected Answer: AD	AD are correct	2
15	8	1z0-071	Selected Answer: AD	AD is the answer	1
16	8	1z0-071	Selected Answer: AD	A nd D are correct	2
17	8	1z0-071	Selected Answer: AD	E - wrong because will cause an error "ORA-01427: Subquery returns more than one row"	3
18	8	1z0-071	Selected Answer: AE	A and E are correct answers	2
19	8	1z0-071	null	Answer: A and D are correct.\n\nB is not correct because the subquery is executed for each row in the ORDERS table, not before the update statement is executed.\nC is not correct because the subquery is a correlated subquery, not a non-correlated subquery.\nE is not correct because if the subquery selects multiple rows, the update statement will fail with a "subquery returns more than one row" error.	3
20	8	1z0-071	null	what is an answer in exam? i thin AD are correct.	2
21	8	1z0-071	Selected Answer: AE	I think A vs E are correct answers in any case	2
22	8	1z0-071	null	DE \n\nA. All existing rows in the ORDERS table are updated. False. Only the rows that match from both tables\nB. The subquery is executed before the UPDATE statement is executed. False\nC. The subquery is not a correlated subquery.\nThis is a correlated subquery- it will fetch records from outer query first, then run subquery related to that outer query record and then perform action. So it will work for more then one record.    \nD. The subquery is executed for every updated row in the ORDERS table. True\nE. The UPDATE statement executes successfully even if the subquery selects multiple rows. True	2
23	8	1z0-071	null	why not D?	1
1	9	1z0-071	null	A. DELETE can use a WHERE clause to determine which row(s) should be removed. ---> Is correct\nB. TRUNCATE can use a WHERE clause to determine which row(s) should be removed. ---> Its wrong bcoz truncate will delete every rows in a table except the table definitions.\nC. TRUNCATE leaves any indexes on the table in an UNUSABLE state.  ----> its wrong truncate will remove everything except table definition or skeleton of the table\nD. The result of a TRUNCATE can be undone by issuing a ROLLBACK.-----> Its wrong bcoz TRUNCATE is a ddl statement whereas it can be done for DELETE since its dml statement\nE. The result of a DELETE can be undone by issuing a ROLLBACK. ----> Its correct bcoz DELETE is DML statement and each delete of row are recorded in transaction log or the redo logs.	5
2	9	1z0-071	Selected Answer: AE	We can use WHERE clause in DELETE, We can ROLLBACK DELETE operation.	1
3	9	1z0-071	Selected Answer: AE	Truncate is forever...	1
4	9	1z0-071	Selected Answer: AE	A, E correct answers	1
5	9	1z0-071	null	AE\nis the correct ans.\nWith truncate we can not user where clause (B)\nwith truncate even if we rollback data will not be rollback. (D)	2
6	9	1z0-071	null	AE correct answers	2
7	9	1z0-071	null	AE are the correct answers	2
1	10	1z0-071	Selected Answer: C	months_between.. The interval is important, and if I add 25 months to a date 3 years ago, it will not be in the desired interval... disregar my previous comment	1
2	10	1z0-071	Selected Answer: C	ADD_Months	1
3	10	1z0-071	null	c is the answer using ADD_MONTHS(date, n)	1
4	10	1z0-071	null	START_DATE stores "the date the row was inserted". Therefore cannot be > SYSDATE (that is "now") and C is the right one	1
5	10	1z0-071	null	I can't get why the B is incorrect.\nA negative value is still less than 25.\nI think I have to check it in DB.	1
6	10	1z0-071	Selected Answer: C	C is correct	2
7	10	1z0-071	null	D is false, only put an example between '01/01/200' and '01/02/2002' 25 months but isn't in the last 25 months	1
8	10	1z0-071	null	C is true. MONTHS_BETWEEN(date 1, date 2) Oracle gives a positive value when date 1 > date 2 and a negative when date 1 < date 2\n\nhttps://www.techonthenet.com/oracle/functions/months_between.php	2
9	10	1z0-071	null	why D is not true ?	1
1	11	1z0-071	Selected Answer: AEF	A. They can be nested.\nE. A scalar subquery expression that returns zero rows evaluates to NULL\nF. They cannot be used in GROUP BY clauses	1
2	11	1z0-071	Selected Answer: AEF	I also think AEF are the correct answers	1
3	11	1z0-071	null	Why is D incorrect?	1
4	11	1z0-071	Selected Answer: BEF	I don't think they can be nested.  Tried:\nselect employee_id, \n    (select department_name, (select city from locations l where l.location_id=d.location_id) \n        from departments d where d.department_id=e.department_id)\n    from employees e;\nBut got 'too many values error'.	1
10	18	1z0-071	null	True hehe	1
4	19	1z0-071	Selected Answer: BE	B-E IS CORRECT.	2
5	19	1z0-071	Selected Answer: BE	BE is correct	1
5	11	1z0-071	Selected Answer: AEF	A. They can be nested. Scalar subqueries can be nested within other scalar subqueries or within other SQL expressions.\n\nE. A scalar subquery expression that returns zero rows evaluates to NULL. If a scalar subquery returns no rows, it evaluates to NULL.\n\nF. They cannot be used in GROUP BY clauses. Scalar subqueries cannot be used in GROUP BY clauses because they do not return a single value that can be used to group rows.	3
6	11	1z0-071	null	Its ABE.\nA. They can be nested. --> True\nB. They cannot be used in the VALUES clause of an INSERT statement. --> True\nC. A scalar subquery expression that returns zero rows evaluates to zero. --> False\nD. They can be used as default values for columns in a CREATE TABLE statement.--> False\nE. A scalar subquery expression that returns zero rows evaluates to NULL. --> True\nF. They cannot be used in GROUP BY clauses.--> False\n\nhttps://www.oratable.com/scalar-subquery/	1
7	11	1z0-071	null	According to both of your links, wouldn't B also correct because INSERT is part of a DML statement? B says "CANNOT" be used in the value of an INSERT statement. Double negative makes the statement positive. Just saying...	1
8	11	1z0-071	null	AEF are the correct answers\nhttps://docs.oracle.com/cd/B19306_01/server.102/b14200/expressions010.htm	2
1	12	1z0-071	null	B cannot be an option because the question says "Prevent prompting of hire date value". && will still prompt it once.	3
2	12	1z0-071	Selected Answer: AB	Still cant get why F is the answer, it literally says 'pass a value', doesnt that translate to prompting the user? as for B, && does an implicit DEFINE on first value entered via the prompt, but if it was already defined then it will just use the value that was already defined, I say AB.	1
3	12	1z0-071	null	Why is B not correct?..and someone explain how o store a query in a script, i cant get the concept..	1
4	12	1z0-071	null	AF are correct.\n B will promt once, but question asks for no prompting at all\nC. UNDIFINE is not a thing\nD/E Verify has nothing to do with prompting	2
5	12	1z0-071	Selected Answer: AF	It's confusing, if you replace &1 with &&1 it would still be asking for the value every time you run the query, it doesn't make sense to me... but if you previously used DEFINE to define that variable, it wouldn't. That's why I think AF is more accurate	2
6	12	1z0-071	null	B. By replacing '&1' with '&&1' in the query, it creates a double-ampersand substitution variable which will remember the value of the variable throughout the session and will not prompt for a value every time it is used.\n\nF. By storing the query in a script and passing the substitution value to the script when executing it, you can provide a value for the variable before the query is executed. This prevents the query from prompting for a value when it is executed.	3
7	12	1z0-071	null	Why not B?	1
8	12	1z0-071	null	https://www.oreilly.com/library/view/oracle-sqlplus-the/1565925785/ch04s06.html#:~:text=The%20UNDEFINE%20command%20deletes%20a,it%20is%20no%20longer%20needed.\nThe UNDEFINE command deletes a variable definition. If you have created a variable containing sensitive information, such as a password,...	1
9	12	1z0-071	Selected Answer: AF	There is no UNDEFINE keyword	1
1	13	1z0-071	null	C is correct: WITH GRANT OPTION is necessary in this case	7
2	13	1z0-071	Selected Answer: C	C. GRANT UPDATE (title, address) ON customers TO andrew WITH GRANT OPTION;	1
3	13	1z0-071	Selected Answer: C	C is correct (GRANT option is for object privileges):\nGRANT UPDATE (title, address) ON customers TO andrew WITH GRANT OPTION\n\nE is not correct (ADMIN option is for system privileges):\nGRANT UPDATE (title, address) ON customers TO andrew WITH ADMIN OPTION\ngives the error ORA-00993: missing GRANT keyword.	1
4	13	1z0-071	Selected Answer: C	C is the correct answer. \n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/GRANT.html#GUID-20B4E2C0-A7F8-4BC8-A5E8-BE61BDC41AC3__I2126048	1
5	13	1z0-071	Selected Answer: C	The answer is C.\nC is for Cat.	1
6	13	1z0-071	Selected Answer: C	Yes, this is the correct syntax according to some sites	1
7	13	1z0-071	null	C is correct	1
8	13	1z0-071	null	Why is E not correct?	1
9	13	1z0-071	Selected Answer: E	E is also correct	2
10	13	1z0-071	null	Whats the difference between C & E ?\nC. GRANT UPDATE (title, address) ON customers TO andrew WITH GRANT OPTION;\nE. GRANT UPDATE ON customers.title, customers.address TO andrew WITH GRANT OPTION;	1
11	13	1z0-071	null	C is correct!\n\nWITH GRANT OPTION\nnow the user ANDREW can give grants to other users.\nGRANT UPDATE(TITLE) ON CUSTOMERS TO HR;\nIf REVOKE UPDATE(TITLE,ADDRESS) ON CUSTOMERS FROM ANDREW\nis executed then eventually HR will also lose the grants.	1
12	13	1z0-071	null	C is correct.\nThe owner of an object can grant it to another user by specifying the WITH GRANT OPTION clause in the GRANT statement. In this case, the new grantee can then grant the same level of access to other users or roles. Here are three points to keep in mind about the WITH GRANT OPTION clause:\n\nhttps://www.oreilly.com/library/view/oracle-database-administration/1565925165/ch06s01s05s01.html#:~:text=The%20owner%20of%20an%20object,to%20other%20users%20or%20roles.	1
13	13	1z0-071	null	C is correct	2
1	14	1z0-071	null	ABE.\nNote: Synoyms and views will get invalid, Indexes will be dropped along with the table and data will be purged and free space will be regained, dropped table can not be recovered even if you use flashback table command	5
2	14	1z0-071	Selected Answer: ABE	It will drop DEPARTMENTS table along with all indexes as we have used PURGE in DROP statement so table cann't be rollback or recovered.	1
3	14	1z0-071	Selected Answer: ABE	ABE correct answers	1
4	14	1z0-071	Selected Answer: ABE	ABE are correct. Views and synonyms are not dropped with the table	2
5	14	1z0-071	Selected Answer: ABE	ABE IS CORRECT.	1
6	14	1z0-071	Selected Answer: ABE	ABE is the answer	1
7	14	1z0-071	null	ABE is correct answers	1
8	14	1z0-071	null	ABE is correct	1
9	14	1z0-071	Selected Answer: ABE	https://docs.oracle.com/database/121/SQLRF/statements_9003.htm#SQLRF01806	1
10	14	1z0-071	Selected Answer: ADE	A,D,E - correct answer	1
11	14	1z0-071	null	https://docs.oracle.com/cd/E18283_01/server.112/e17120/tables010.htm	1
1	19	1z0-071	Selected Answer: BE	For '%%' or '_' we have to use LIKE, not "="	1
2	19	1z0-071	null	Option BE is right!	2
3	19	1z0-071	Selected Answer: BE	EF cannot be right. As the question asks us to first sort by cities in the ascending order. Only then further the sorting requires for lastname is descending order. F does vice versa	1
12	14	1z0-071	null	In ORACLE SQL, you own table DEPARTMENTS, referenced by views, indexes, and synonyms.\nExamine this command which executes successfully:\nDROP TABLE departments PURGE;\nWhich three statements are true? (Choose three.)\nA. It will remove the DEPARTMENTS table from the database. (True)\nB. It will drop all indexes on the DEPARTMENTS table. (True)\nC. It will remove all views that are based on the DEPARTMENTS table. (False, it will not remove the views that are based on the DEPARTMENTS table)\nD. It will remove all synonyms for the DEPARTMENTS table. (False, it will not remove the synonyms for the DEPARTMENTS table)\nE. Neither can it be rolled back nor can the DEPARTMENTS table be recovered. (True)\nF. It will delete all rows from the DEPARTMENTS table, but retain the empty table. (False, it will delete all rows and the table itself)	2
13	14	1z0-071	null	A, B, E\nhttps://docs.oracle.com/database/121/SQLRF/statements_9003.htm#SQLRF01806	1
1	15	1z0-071	null	A needs to be heard as well.	1
2	15	1z0-071	null	I think the answer should be BCD as SQL is used for both RDBMS and Object Oriented DB. Regarding atomicity and consistency, I think that is facilitated by the RDBMS engine.	1
3	15	1z0-071	Selected Answer: BCE	Answers are B, C, E.	1
4	15	1z0-071	null	A is also true my reference is                                                                                                                https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Hierarchical-Queries.html#GUID-0118DF1D-B9A9-41EB-8556-C6E7D6A5A84E	1
5	15	1z0-071	null	BCF CORRECT	1
6	15	1z0-071	null	BCE is the correct answer	4
7	15	1z0-071	null	answer is BCE	4
8	15	1z0-071	null	Answer is ACE	1
1	16	1z0-071	null	A. Any user can create a PUBLIC synonym.( x) Must have Create Publc Syn Priv.\nB. A synonym has an object number. \nC. All private synonym names must be unique in the database. (X) Unique in the schema.\nD. A synonym can be created on an object in a package. (X) A schema object can't be in a package\n    E. A synonym can have a synonym.	16
2	16	1z0-071	Selected Answer: BE	A synonym cannot be created on an object inside a package like procedure or function, but synonym can be created on whole package.	1
3	16	1z0-071	Selected Answer: BE	B. A synonym has an object number\nE. A synonym can have a synonym	1
4	16	1z0-071	null	B,D,E are correct. \nB and E are obvious. \nWhy D is correct : Following workd in oracle.livesql.com\nCREATE PACKAGE employee_pkg1 AS\n    PROCEDURE add_employee(p_first_name VARCHAR2, p_last_name VARCHAR2);\nEND employee_pkg1;\n\nCREATE SYNONYM emp_pkg_syn FOR employee_pkg1;\n--Works\n\nCREATE SYNONYM add_emp_addemp_syn FOR employee_pkg1.add_employee;\n-- works	1
5	16	1z0-071	Selected Answer: BE	B & E is correct	2
6	16	1z0-071	null	C is incorrect because private synonyms are need to be private in the schama not in the database\nso \nBDE	1
7	16	1z0-071	null	BE IS CORRECT	1
8	16	1z0-071	null	BE is correct. syn has object. here is to find object ID. Modify it or remove the owner \n\nSELECT \n    s.synonym_name,\n    s.owner,\n    o.object_id,\n    o.object_name,\n    o.object_type\nFROM \n    dba_synonyms s\nJOIN \n    dba_objects o\nON \n    s.synonym_name = o.object_name\nAND \n    s.owner = o.owner\nand S.owner = 'HR'\n;	1
9	16	1z0-071	Selected Answer: DE	With no so many arguments, I would answer DE in an hypothetical exam since documentation says that a synonym can be created on a Stored procedure, function, or package. Besides, I don't find accurate the way B is written since the creation of a new synonym doesn't envolve a new object id, but the synonim actually "has" the object id of the object it references...	1
10	16	1z0-071	null	D and E\nSpecify the object for which the synonym is created. The schema object for which you are creating the synonym can be of the following types:\nTable or object table\nView or object view\nSequence\nStored procedure, function, or package\nMaterialized view\nJava class schema object\nUser-defined object type\nSynonym\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-SYNONYM.html	1
11	16	1z0-071	Selected Answer: DE	de should be	1
12	16	1z0-071	null	b is wrong\n1000%	1
13	16	1z0-071	Selected Answer: DE	DE for me	1
14	16	1z0-071	Selected Answer: BE	A - user need CREATE PUBLIC SYNONYM : false\nC - must be unique in schema : false\nD - The schema object cannot be contained in a package for synonyms	1
15	16	1z0-071	Selected Answer: BE	Synonym can be created for the whole package but not for components of the package.	3
16	16	1z0-071	Selected Answer: DE	D. A synonym can be created on an object in a package. A synonym can be created for an object in a package, allowing users to reference the object using the synonym name instead of the package and object name 1.\n\nE. A synonym can have a synonym. A synonym can be created for another synonym, allowing users to reference the underlying object using either synonym name	1
17	16	1z0-071	Selected Answer: DE	D and E is true the rest is false	1
18	16	1z0-071	null	You have created synonym on the entire package, not on the package object.	3
1	17	1z0-071	Selected Answer: C	Both return 0	2
2	17	1z0-071	null	C is correct\nBoth return 0	2
1	18	1z0-071	null	A. DML statements always start new transactions. (X). Not always\n    B. DDL statements automatically commit only data dictionary updates caused by executing the DDL. (X) Not "only"  data dictionary\n    C. A session can see uncommitted updates made by the same user in a different session. (X) in the same session\n    D. A DDL statement issued by a session with an uncommitted transaction automatically commits that transaction.\n    E. An uncommitted transaction is automatically committed when the user exits SQL*Plus.	9
2	18	1z0-071	Selected Answer: DE	D. A DDL statement issued by a session with an uncommitted transaction automatically commits that transaction\nE. An uncommitted transaction is automatically committed when the user exits SQL*Plus	1
3	18	1z0-071	Selected Answer: AD	hix chatGPT said that	2
4	18	1z0-071	Selected Answer: AD	A : transaction contains of one or more dml statements or DDL statement\nD : because DDL make commit before and after DDL statement\nhttps://docs.oracle.com/cd/E11882_01/server.112/e40540/transact.htm#CNCPT016	1
5	18	1z0-071	Selected Answer: DE	The answer is DE	1
6	18	1z0-071	Selected Answer: BD	bd is correct	2
7	18	1z0-071	null	The answer is BE	1
8	18	1z0-071	Selected Answer: DE	should be DE\n SET AUTOCOMMIT does not alter the commit behavior when SQL*Plus exits. Any uncommitted data is committed by default.	1
9	18	1z0-071	null	https://docs.oracle.com/cd/E11882_01/server.112/e16604/ch_twelve040.htm#BABEGEGC	3
6	19	1z0-071	Selected Answer: BE	BE is ok , but i think EF is also right	1
7	19	1z0-071	Selected Answer: BE	BE is correct	1
8	19	1z0-071	Selected Answer: BE	lname is alias and can be used on order by	1
9	19	1z0-071	Selected Answer: BE	lname is in the question\nSELECT city, last_name AS lname FROM members	2
10	19	1z0-071	Selected Answer: BF	lname is in the question\nSELECT city, last_name AS lname FROM members	1
11	19	1z0-071	Selected Answer: EF	LNAME doesn't exist	1
1	20	1z0-071	Selected Answer: AB	A. the access driver TYPE clause\n✅ Required\n\nThis tells Oracle which access driver to use (typically ORACLE_LOADER or ORACLE_DATAPUMP).\n\nExample:\n\nsql\nCopy\nEdit\nTYPE ORACLE_LOADER\nB. the DEFAULT DIRECTORY clause\n✅ Required\n\nThis defines the Oracle directory object where the external file is located.\n\nExample:\n\nsql\nCopy\nEdit\nDEFAULT DIRECTORY ext_dir	1
2	20	1z0-071	null	LOCATION is the only MUST clause. You can specify the ENTIRE physical path in LOCATION without having to have a DEFAULT_DIRECTORY clause	1
3	20	1z0-071	null	The Right answers are : \nB and D \nas i tried the following create table statement but an error occured to specify the default ditrectory . The query is : \n\n create table CUST(\n cust_id number (2),\n Credit_limit Number (10))\n Organization External \n Type Oracle_Loader\n Location ('c:\\test.txt')) ;	1
4	20	1z0-071	Selected Answer: AD	Option A is required because Oracle needs to know how to handle the external data file (driver type).\nOption D is required because Oracle needs to know the location of the external data file to access the data.	1
5	20	1z0-071	null	A D TRUE BECAUSE IF WE USE LOCATION THEN WE CAN USE DEFAULT DIRECTORY	2
6	20	1z0-071	null	D and E.\nB is WRONG, there is no need to define the DEFAULT DIRECTORY, you can specify each of the files with a DIRECTORY, like: \n\ncreate directory testsdir as 'c:\\tests';\n\nLOGFILE testsdir:'loggile.log'\nBADFILE testsdir:'badfile.log'\n\nLOCATION (testsdir:'invoice_data.txt')\n\nTried to upload the full example but the site does not accept it, gives a Cloudflare error.	1
7	20	1z0-071	Selected Answer: BD	TYPE: "Oracle Database provides two access drivers: ORACLE_LOADER and ORACLE_DATAPUMP. If you omit the TYPE specification, ORACLE_LOADER is the default access driver."\nhttps://docs.oracle.com/cd/B28359_01/server.111/b28310/tables013.htm#ADMIN11705\n\nACCESS PARAMETERS: "To modify the default behavior of the access driver for external tables, specify access parameters."\nhttps://docs.oracle.com/en/database/oracle/oracle-database/23/sutil/oracle-external-tables-concepts.html#GUID-ACF1D3AA-1D61-4682-AEC5-42C944756E12\n\nREJECT LIMIT : there are several examples that don't use this clause\n\nLOCATION: "For ORACLE_HIVE, the LOCATION clause is not used." \nhttps://docs.oracle.com/en/database/oracle/oracle-database/23/sutil/oracle-external-tables-concepts.html#GUID-ACF1D3AA-1D61-4682-AEC5-42C944756E12\n\nThat about LOCATION confuse me, but I tend to believe it's a very particular case, so the answer should be (BD) DEFAULT DIRECTORY and LOCATION	4
8	20	1z0-071	null	E is also correct since it species the data source of the external tables.	2
9	20	1z0-071	null	why not E?	1
1	21	1z0-071	Selected Answer: BC	Option B: "Unused columns retain their data until they are dropped."\nThis is correct. Unused columns keep their data until they are explicitly removed from the table. Setting a column to unused does not immediately delete its data; it only marks the column as unavailable.\n\nOption C: "Once a column has been set to unused, a new column with the same name can be added to the table."\nThis is correct. Once a column is marked as unused, you can add a new column with the same name to the table, because the unused column is effectively 'removed' from the table’s structure in a logical sense.	1
2	21	1z0-071	Selected Answer: BC	Note on C: you can add the same name and data type as unused column even if it's not dropped. Tested and it works.	4
3	21	1z0-071	null	I tested, Unused can be added on primary key.\nDesc does not display unused column. not does select query.	1
4	21	1z0-071	null	B C.\nNote on C. You can only add a new column with the same name as long as it's a different data type until the UNUSED is dropped.	2
1	22	1z0-071	null	The rules are listed in descending order:\nParentheses (as well as brackets in lookup expressions and IN expressions). Note that you can freely add parentheses any time you want to impose an alternative precedence or to make precedence clearer.\n* /\n+ -\n= <> < > <= >=\nIS (IS NULL, IS NOT NULL, IS EMPTY, IS NOT EMPTY)\nBETWEEN\nNOT\nAND\nOR	11
2	22	1z0-071	Selected Answer: AC	✅ A. || (concatenation) vs + (addition)\nIn Oracle SQL, the concatenation operator || has higher precedence than the addition operator +.\n\n✅ C. NOT vs AND/OR\nCorrect. In logical expressions, NOT is evaluated before AND, and AND is evaluated before OR.\n\nOrder: NOT > AND > OR	1
3	22	1z0-071	Selected Answer: CE	|| (OR) doesn't have a highter order of precedence than + (addition). Here I'll show you why:\n\nSELECT 1+1||'1.9' AS addition_operator FROM DUAL; --output: 21.9\nSELECT '1.9'||1+1 AS or_condition FROM DUAL; --output: 2.91\n\nIn the first SELECT statement is first adding up 1+1 (2) and then concatenating with '1.9', making the output '21.9'.\n\nLastly, the second SELECT statement concatenates '1.9' with 1 ('1.91') and then adding up 1, making the output '2.91'.\n\nThis proves that, in this case, whatever comes first in the statement will be calculated. \n\nIf there was an order of precedence, the outputs would've been:\n\nOR first: '12.9' (1+(1||'1.9')) and '2.91' (('1.91'||1)+1).\n+ first: '21.9' ((1+1)||'1.9') and '1.92' ('1.9'||(1+1)).\n\nSo the correct answers are C and E.	1
4	22	1z0-071	Selected Answer: AC	|| has a higher order of precedence than + (addition).	1
5	22	1z0-071	Selected Answer: AC	select '9.9'||1+2 from dual\nResult 11.91\n\n\nContamination is done first	1
6	22	1z0-071	Selected Answer: CE	https://docs.oracle.com/cd/E49933_01/server.770/es_eql/src/ceql_expr_precedence_rules.html#:~:text=The%20rules%20are,the%20JOIN%20operators.	1
7	22	1z0-071	Selected Answer: CE	CE is correct	2
8	22	1z0-071	null	This Oracle doc explains between OR, AND, and NOT. https://docs.oracle.com/en/database/other-databases/nosql-database/22.2/sqlreferencefornosql/operator-precedence.html	2
9	22	1z0-071	null	https://www.tutorialspoint.com/plsql/plsql_operators_precedence.htm	1
1	23	1z0-071	Selected Answer: C	Option C is the statement that returns the result 02-JAN-2020. The statement converts the string '29-10-2019' to a date using the TO_DATE function, then adds an interval of 2 months and an interval of 5 days, and subtracts an interval of 120 seconds. The resulting date is then converted to a string using the TO_CHAR function with the format model 'DD-MON-YYYY', which produces the result 02-JAN-2020.\n\nHere is the calculation: TO_DATE('29-10-2019') = October 29, 2019 + INTERVAL '2' MONTH = December 29, 2019 + INTERVAL '5' DAY = January 3, 2020 - INTERVAL '120' SECOND = January 2, 2020	6
2	23	1z0-071	null	note to self: study the calendar to know when months end, because if Dec ends on 30 instead of 31, the answer would've been A or D	1
3	23	1z0-071	null	C because:  when we add INTERVAL '2' MONTH + INTERVAL '5' DAY  to 29-10-2019, we get 03-01-2020, as of midnight, and then we subtract - INTERVAL '120' SECOND i.e. 2 minutes, hence we get answer as '02-JAN-2020'	3
4	23	1z0-071	null	Correct answer should be \nSELECT TO_CHAR(TO_DATE('29-OCT-2019') + INTERVAL '2' MONTH + INTERVAL '5' DAY - INTERVAL '120' SECOND, 'DD-MON-YYYY') AS "date" FROM DUAL;	4
5	23	1z0-071	null	C is correct after testing, although I don't know why it is INTERVAL '5' instead of '4'.	2
1	24	1z0-071	null	For anyone confused A isn't gonna work because you didn't use aliases so its not comparing the right things.\nHere is the correct query\n\n\ncreate table invoices(\n    invoice_id number,\n    currency_code varchar2(10),\n    raised_date date\n);\ninsert into invoices values(1, 'EUR', to_date('01-jan-2019'));\ninsert into invoices values(2, 'USD', to_date('01-feb-2019'));\ninsert into invoices values(3, 'JPY', to_date('01-mar-2019'));\n\ncreate table currencies(\n    currency_code varchar2(10)\n);\n\ninsert into currencies values('JPY');\ninsert into currencies values('GPD');\ninsert into currencies values('CAD');\ninsert into currencies values('EUR');\ninsert into currencies values('USD');\n\nselect *\nfrom invoices;\n\nselect *\nfrom currencies;\n\n\nselect *\nfrom currencies c\nwhere not exists (\n    select null from invoices i where i.currency_code = c.currency_code\n);	7
2	24	1z0-071	null	D IS CORRECT OPTION...AS THE NUMBER OF COLUMN ARE NOT SAME IN BOTH TABLES..PRACTICALLY IMPLEMENTED..CORRECT OPTION D	1
3	24	1z0-071	null	for minus operator one needs to specify the colums. \nIntersect gives you the matching data. \nSo C	3
4	24	1z0-071	null	C is correct.	2
1	25	1z0-071	Selected Answer: BE	BE is the correct one	2
2	25	1z0-071	null	You cannot have a COUNT() in a WHERE clause. That is what the HAVING clause is for	1
1	26	1z0-071	Selected Answer: BDF	BDF is correct. Can be nested to any level.	1
2	26	1z0-071	Selected Answer: BDF	BDF is correct	4
3	26	1z0-071	null	BDF is correct. Can be nesed to any level.	1
4	26	1z0-071	null	Answer is BDF.\ncheck the discussion of the link.\nhttps://www.examtopics.com/discussions/oracle/view/20182-exam-1z0-071-topic-2-question-46-discussion/	2
5	26	1z0-071	null	E is not right either because of the word "only".	2
6	26	1z0-071	null	DEF. \nB is wrong. Nested only to 255 levels.	1
1	27	1z0-071	Selected Answer: AD	dba_tables - requires privileges for querying, all_tables - does not require privileges for querying.	1
2	27	1z0-071	Selected Answer: AD	Not F because ALL_TABLES shows only those tables the user already has access to, so no special privileges are needed beyond access. Also, the question says 'You must have..'\n\n✅ D. You must have ANY TABLE system privileges, or be granted object privileges on the table, to view a table in DBA_TABLES.\nTrue.\n\nTo query DBA_TABLES, you need appropriate system privileges, like SELECT_CATALOG_ROLE.	1
3	27	1z0-071	null	AF is the right answer anyday.\nUSER_TABLE - dictionary view which has list of tables owned by the user\nALL_TABLE   - dictionary view which has list of tables owned by the user + tables which user has grants for.\nDBA_TABLE - All tables in database(but you should have dba privelege to see them)	1
4	27	1z0-071	null	AD , the right answers.\n\nThe data dictionary views that begin with DBA_ are restricted. These views can be accessed only by users with the SELECT_ANY_TABLE privilege. This privilege is assigned to the DBA role when the system is initially installed.\n\nhttps://docs.oracle.com/cd/A57673_01/DOC/server/doc/SRF73/ch2a.htm	3
5	27	1z0-071	Selected Answer: AF	if you don't have dba role then you will get message that DBA_TABLES doesn't exist.\nDBA_TABLES is a data dictionary view	2
6	27	1z0-071	null	I tried D and it doesn't work for me!!!!\nBut its probably A. idk about the 2nd option	1
7	27	1z0-071	null	AD\nto view dba_table should have privilege.	2
8	27	1z0-071	Selected Answer: AF	i am for AF	3
9	27	1z0-071	null	AD.\n\nTried on ORA 19. \nGRANT SELECT ANY_TABLE to gives access to DBA_TABLES\nF is incorrect because querying ALL_TABLES you can always do but only see those tables you have the rights to view, which would be a subset of DBA_TABLES	4
10	27	1z0-071	Selected Answer: AF	AF\ncannot grant dba_tables privilege	3
11	27	1z0-071	null	A, F are correct	1
12	27	1z0-071	null	Don't get USER_TABLE and ALL_TABLE views confused.\nA) USER_TABLES displays all tables owned by the current user. (True)\nE) ALL_TABLES displays all tables owned by the current user. (False) \nThe ALL_TABLES view contains description of tables accessible to the user.	3
1	28	1z0-071	null	BC are correct\nhttps://oracle-base.com/articles/9i/multitable-inserts	7
2	28	1z0-071	Selected Answer: BC	Not A Because:\n❌ A. Each row returned by the subquery can be inserted into only a single target table.\nFalse.\n\nA row can be inserted into multiple tables if multiple WHEN clauses are true, or if a WHEN clause targets multiple INTO tables	1
3	28	1z0-071	Selected Answer: BC	B and C are correct.	1
4	28	1z0-071	null	A,c are correct	2
1	29	1z0-071	null	Group functions do not consider NULL values, except the COUNT(*)	9
2	29	1z0-071	Selected Answer: AC	tested	1
3	29	1z0-071	Selected Answer: AC	A and C are correct.	1
4	29	1z0-071	null	A and C seem correct!	4
1	30	1z0-071	Selected Answer: D	Oracle’s NEXT_DAY(date, 'DAY') function returns the next specified weekday after the given date.\nSince the NLS_TERRITORY is set to AMERICA, Oracle understands 'MONDAY' correctly.	1
2	30	1z0-071	Selected Answer: D	This query first uses ADD_MONTHS(hire_date, 6) to calculate the date six months after the hire date, and then uses NEXT_DAY to find the first Monday after this date. This is the correct approach and meets the requirements of the problem.	1
3	30	1z0-071	Selected Answer: D	D is correct. \nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/NEXT_DAY.html#GUID-01B2CC7A-1A64-4A74-918E-26158C9096F6	3
2	43	1z0-071	null	what that is mean no segment about view	1
3	43	1z0-071	null	I don't understand the answer E. \nHow can views refers to non-existent table ?	4
4	43	1z0-071	Selected Answer: BEF	select object_id, object_name\nfrom user_objects\n\n\nIn this table you will also find views so they do have an object number. Views have no segment since they don't take up physical space	4
18	49	1z0-071	null	Answer is B, complete weeks.	1
1	31	1z0-071	Selected Answer: CDF	A global temporary table is a type of table in Oracle that holds data only for the duration of a session or transaction. It is a persistent database object, visible to all sessions, until the user drops it explicitly using the DROP TABLE statement. Data is only visible to the session which inserts it. The data stored in the global temporary table is private to the session1.\n\nIn contrast, a regular table is a permanent database object that stores data on disk and is visible to all sessions. The data stored in a regular table is not private to any session and can be accessed by any session with the appropriate privileges.\n\nIn summary, the main differences between a global temporary table and a regular table are:\n\nA global temporary table holds data only for the duration of a session or transaction, while a regular table holds data permanently.\nData stored in a global temporary table is private to the session, while data stored in a regular table is not private to any session.	5
2	31	1z0-071	Selected Answer: CDF	✅ F. A GLOBAL TEMPORARY TABLE'S definition is available to multiple sessions.\nTrue. The table structure is shared among all users, but data is private to each session	1
3	31	1z0-071	null	When I delete from GTT and then Rollback, response is "Rollback complete" but the rollback does not occur.  The rows are still gone from the table	3
4	31	1z0-071	Selected Answer: CDF	Delete operation can totally be rolled back!	1
5	31	1z0-071	null	https://www.oracletutorial.com/oracle-basics/oracle-global-temporary-table/ will explain the differences between session or transaction specific GTT.	3
6	31	1z0-071	null	A. Can someone explain me when a space allocation occurs?\nB. It's not true because GTT are avaible for everyone even without permissions like SELECT.\nC. Changing in private session causes only for private data in GTT.\nD. Any rows existing at GTT retain after close a session but are not avaible.\nE. It can be rolled back, GTT works like a normal table.\nF. GTT for everyone LOCAL TEMPORARY TABLE only for a current session.\n\nIf what I wrote is not true, please correct me.	1
1	32	1z0-071	Selected Answer: CD	✅ C. It can be used only in SQL*Plus.\nTrue. SET VERIFY ON is a command specific to SQL*Plus (and tools that emulate it).\nIt is not supported in GUI tools like SQL Developer (though similar behavior can sometimes be simulated).\n\n✅ D. It displays values for variables prefixed with &&.\nTrue. When SET VERIFY ON is enabled, SQL*Plus displays the old and new values of substitution variables (like &&var) before executing the SQL.\n\n❌ Incorrect options:\nA. It displays values for variables used only in the WHERE clause of a query.\n➤ False. It shows substituted values regardless of where they are used, not just in the WHERE clause.\n\nB. It displays values for variables created by the DEFINE command.\n➤ False. SET VERIFY ON shows values of substitution variables, not necessarily those created by DEFINE.\n\nE. It can be used in SQL Developer and SQLPlus.*\n➤ False. SET VERIFY ON works only in SQL*Plus. SQL Developer ignores it.	2
2	32	1z0-071	Selected Answer: BE	BE works well	1
3	32	1z0-071	Selected Answer: CD	ANSWER CD	1
4	32	1z0-071	Selected Answer: BE	after testing it does not work with &&	1
5	32	1z0-071	null	The Correct Answer Is : D & E	1
6	32	1z0-071	null	BDE ---All true	1
7	32	1z0-071	Selected Answer: DE	Should be DE	2
8	32	1z0-071	Selected Answer: BE	BE for me	1
9	32	1z0-071	Selected Answer: DE	id say DE, B is kinda right?	1
10	32	1z0-071	null	BDE all worked for me.	2
11	32	1z0-071	Selected Answer: BE	correct is BE	2
12	32	1z0-071	null	correct is BE	2
13	32	1z0-071	null	Is C also correct?	1
14	32	1z0-071	null	B no right: VERIFY ON shows all substituted variables althought you dont use DEFINE (sqlplus/developer ask for them).	2
15	32	1z0-071	null	BDE are true but if I have to narrow it down to 2 answers then DE.	2
16	32	1z0-071	null	BDE are correct, when SET VERIFY ON it shows us variables defined by a DEFINE and a variables in &&.	4
17	32	1z0-071	null	correct is BE	3
1	33	1z0-071	Selected Answer: DE	Reduce chances of gaps: so NOCACHE is preferred, since cached sequences can create gaps if the database shuts down before cache is used.	1
2	33	1z0-071	Selected Answer: DE	NO CACHE	2
3	33	1z0-071	null	if there is cache option sequence get some numbers (for example 10). if oracle used some of this (less than 10) and restart instance occurs, then will be gap, because oracle will cache next 10 numbers.	2
4	33	1z0-071	null	How reduce the chances of gaps in the values by syntax?	1
1	34	1z0-071	Selected Answer: ABD	A is also right why?...\n✅ A. SELECT 1 - SYSDATE - DATE '2019-01-01' FROM DUAL;\nValid: Oracle allows arithmetic with dates and numbers.\n\n1 - SYSDATE gives a negative number (interval), and subtracting another DATE results in a valid numeric result.\n\n✅ Executes successfully	1
2	34	1z0-071	Selected Answer: BDE	I am assuming it is supposed to be to_date	2
3	34	1z0-071	Selected Answer: BDE	Tried all the alternatives	4
1	35	1z0-071	Selected Answer: CD	The following OBJECT PRIV'S can be granted on tables, views and sequences---\nUPDATE: tables, views.\nREFERENCES:  tables, views\nALTER: tables, sequences.\nSELECT: tables, views, sequences	10
2	35	1z0-071	Selected Answer: CE	D incorrect for Oracle - only for IBM hierarchial dbms\n Per Oracle doc\nREFERENCES\n\nTable or materialized view\n\nEnables a user to create a foreign key dependency on a table or materialized view.\n\nThe REFERENCES privilege on a parent table implicitly grants SELECT privilege on the parent table.	1
3	35	1z0-071	Selected Answer: CE	Object\tPrivilege\nTable\tSELECT, INSERT, UPDATE, DELETE, REFERENCES, ALTER, DROP, INDEX\nView\tSELECT, INSERT, UPDATE, DELETE, ALTER, DROP\nSequence\tSELECT, USAGE	1
4	35	1z0-071	Selected Answer: CD	UPDATE: tables, views. REFERENCES: tables, views ALTER: tables, sequences. SELECT: tables, views, sequences. DELETE: tables, views. INSERT: tables, views.\n\nDoc: https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/GRANT.html#GUID-20B4E2C0-A7F8-4BC8-A5E8-BE61BDC41AC3__BGBCIIEG	2
5	35	1z0-071	Selected Answer: CD	C and D	1
6	35	1z0-071	null	C and D because you can grant References on a view. Tried out! :)	1
15	49	1z0-071	null	how to filter department = 90 when theres no Department or Dept_ID in the table...\nAll options must be wrong.	6
16	49	1z0-071	null	Answer is B, complete weeks.	1
17	49	1z0-071	null	I would say A. If we have 5 working days in a week, then Round will give us the correct result. And as we were asked to show employees, who serves longer, first, then we should order by desc. So, I do not understand why correct answer is C ...	1
7	35	1z0-071	Selected Answer: CE	CE, \naccording to this site: \nhttps://docs.oracle.com/database/121/TTSQL/privileges.htm#TTSQL338\nA. INSERT can be granted only on tables and sequences. (FALSE, table + synonym)\nB. DELETE can be granted on tables, views, and sequences. (FALSE, only table)\nC. SELECT can be granted on tables, views, and sequences. (TRUE)\nD. ALTER can be granted only on tables and sequences. (FALSE, ALTER is system priv. not object)\nE. REFERENCES can be granted only on tables. (TRUE, tables + materialised views, which are different than 'normal' views)	3
1	36	1z0-071	Selected Answer: CD	A. The second ROLLBACK command replays the delete.\nThis is false. The second rollback undoes the INSERT operation but does not affect the DELETE. The first rollback already restored the rows deleted before the savepoint.\n\nB. The first ROLLBACK command restores the 101 rows that were deleted and commits the inserted row.\nThis is false. The first rollback restores the deleted rows but does not commit the inserted row. The insert is still in an uncommitted state until the second rollback is issued.\n\nC. The first ROLLBACK command restores the 101 rows that were deleted, leaving the inserted row still to be committed.\nThis is true. The first rollback restores the deleted rows (100 rows), and the inserted row is still uncommitted, meaning it will be undone by the second rollback.\n\nD. The second ROLLBACK command undoes the insert.\nThis is true. The second rollback undoes the insert, as it was the most recent uncommitted operation at the time.\n\nE. The second ROLLBACK command does nothing.\nThis is false. The second rollback does undo the inserted row ('ADV112', 'Adventures of Tom Sawyer'), so it does something.	1
2	36	1z0-071	Selected Answer: CD	CD are correct	1
3	36	1z0-071	Selected Answer: DE	For me DE	1
4	36	1z0-071	Selected Answer: CD	Seems right!	1
5	36	1z0-071	Selected Answer: CD	Rollback without savepoint:\n- end of the transaction\n- delete savepoints\n- undoes all changes in the transactions	3
1	37	1z0-071	null	Table can have multiple foreign Key:\n\nCREATE TABLE ENCOUNTER (\nENCT_ID VARCHAR2(25) PRIMARY KEY,\nENCT_DATE DATE NOT NULL,\nPT_MRN NUMBER NOT NULL,\nENCT_BP VARCHAR2(10) NOT NULL,\nENCT_WT NUMBER(3,2) NOT NULL,\nENCT_TEMP NUMBER(3) NOT NULL,\nACCT_ID VARCHAR2(25) NOT NULL,\nPHX_ID VARCHAR2(25) NOT NULL,\nCONSTRAINT FK_PATIENT FOREIGN KEY (PT_MRN) REFERENCES PATIENT(PT_MRN)\nCONSTRAINT FK_ACCOUNT FOREIGN KEY (ACCT_ID) REFERENCES ACCOUNT(ACCT_ID)\nCONSTRAINT FK_PTHISTORY FOREIGN KEY (PHX_ID) REFERENCES PTHISTORY(PHX_ID));	1
2	37	1z0-071	null	CD is correct answer. PFB discussion link for same question\nhttps://www.examtopics.com/discussions/oracle/view/21762-exam-1z0-071-topic-2-question-64-discussion/	1
3	37	1z0-071	Selected Answer: CD	One pk and yeah if you dont insert anything in a row with a with a varchar datatype the value is null and not an empty string which i guess is what they're trying to trick you into?	1
1	38	1z0-071	Selected Answer: D	alias does not work with Group by and Having	6
1	39	1z0-071	null	BE\nA : False. Creating role is system privilege.\nB : True. Use REFERENCE privilege.\nC : False. Use DELETE ANY TABLE system privilege.\nD : False?\nE : True. Use EXECUTE privilege.	16
2	39	1z0-071	Selected Answer: BE	B, E - correct\nsee description in the table 7-2\nhttps://docs.oracle.com/database/121/TTSQL/privileges.htm#TTSQL341	7
3	39	1z0-071	Selected Answer: BE	E. Execute a procedure or function in another schema. ✅\nIf you’re granted the EXECUTE privilege on a procedure/function in another schema, you can run it.	1
4	39	1z0-071	Selected Answer: BC	ANSWER BC	1
5	39	1z0-071	null	SELECT * FROM DBA_SYS_PRIVS;\nSELECT * FROM user_tab_privs;	1
6	39	1z0-071	Selected Answer: BE	B. Correct. To create foreign key constraints in one schema that reference tables in another schema, you must have appropriate object permissions on the target table, such as the REFERENCES permission. This is a typical application of object permissions.\nE Correct. Executing a procedure or function in another schema requires having the EXECUTE permission on that procedure or function, which is also a type of object permission.	1
7	39	1z0-071	null	`BE is correct	1
8	39	1z0-071	Selected Answer: BE	should be bE	1
9	39	1z0-071	null	B and E. A can not be correct cause it is system privilege.	1
10	39	1z0-071	Selected Answer: BE	BE for me, please update the answers	3
11	39	1z0-071	Selected Answer: BE	You can delete from a table under sys schema if object priv is granted	2
12	39	1z0-071	null	System privileges allow a user to perform a particular database operation or class of database operations. For example, to create a table, the user needs the create table privilege.\n\nObjects have privileges associated with them, such as insert, update and delete a table.	1
13	39	1z0-071	Selected Answer: BC	A is wrong because : Create Role is a system privilege	6
14	39	1z0-071	Selected Answer: BC	ADE is system privileges	3
15	39	1z0-071	null	A You must have the CREATE ROLE system privilege. \n\nB Object privileges REFERENCES object type Table or materialized view  \n\nEnables a user to create a foreign key dependency on a table or materialized view. \n\nThe REFERENCES privilege on a parent table implicitly grants SELECT privilege on the parent table \n\n \n\nC System privileges  DELETE ANY TABLE  Enables a user to delete from any table in the database. \n\nD I think it’s System privileges \n\n \n\nE Object privileges: Object type PL/SQL package, procedure or function; \n\nEnables a user to execute a PL/SQL package, procedure or function directly.	2
16	39	1z0-071	Selected Answer: BE	Delete is an onject privilege, same as execute, I think B and E are correct, please correct me if I'm wrong	3
1	40	1z0-071	Selected Answer: AEF	AEF is correct	1
2	40	1z0-071	Selected Answer: AEF	AEF is correct answer	1
1	41	1z0-071	null	Can anyone please explain why option E is the right answer here? why not C?	1
1	42	1z0-071	Selected Answer: CE	answer CEF	1
2	42	1z0-071	Selected Answer: CF	You can drop a column that is referenced by another column with CASCADE CONSTRAINTS clause (E), so I only find here 2 correct answers (CF)	2
3	42	1z0-071	Selected Answer: CEF	CEF for me	1
4	42	1z0-071	null	For E, using cascade constraints, I was able to delete a primary key column that was referenced by a foreign key.  C and F seem like the only truly correct options.	3
5	42	1z0-071	Selected Answer: CEF	If use have on delete then E is indeed right	1
6	42	1z0-071	Selected Answer: CF	CF are the most correct, the other options have some special cases	2
7	42	1z0-071	null	E is partial correct because you can use ON DELETE clause	4
1	43	1z0-071	null	the correct answer is B and e and F	1
19	49	1z0-071	null	B correct	2
1	44	1z0-071	null	1. CREATE GLOBAL TEMPORARY TABLE my_temp_table (\n  id           NUMBER,\n  description  VARCHAR2(20)\n)\nON COMMIT PRESERVE ROWS\n2. INSERT INTO my_temp_table VALUES (1, 'ONE');\n3. Commit;\n4. ALTER TABLE my_temp_table\nADD ID_1 VARCHAR(20); --> ORA-14450: attempt to access a transactional temp table already in use\n5. drop table my_temp_table; --> ORA-14452: attempt to create, alter or drop an index on temporary table already in use\n6. truncate table my_temp_table;\n7. drop table my_temp_table;	13
2	44	1z0-071	Selected Answer: CE	How can someone answer A and take this exam?	1
3	44	1z0-071	Selected Answer: CE	ANSWER CE	1
4	44	1z0-071	Selected Answer: CE	Here is why A is wrong:\n❌ A. To drop the table in this session, you must first truncate it.\nFalse.\n\nTruncating is not required before dropping a table in Oracle.\n\nYou can drop a temporary table at any time (assuming permissions).\n\n✅ No dependency on truncation.	1
5	44	1z0-071	Selected Answer: CE	ANSWER CE	1
6	44	1z0-071	Selected Answer: CE	A. Incorrect. Dropping a table is unrelated to whether it has been truncated. If you have sufficient privileges, you can drop the table directly without needing to truncate it first.\nB. Incorrect. In a global temporary table, data is isolated per session, and other sessions cannot see the data in the current session, even if it has been committed.\nC. Correct. If you have sufficient privileges, you can modify the table structure in the current session, including adding new columns.\nD. Incorrect. Generally, you cannot add a foreign key to a global temporary table because a foreign key requires referencing a permanent table, and the rows in a global temporary table are cleared at the end of the session.\nE. Correct. With a global temporary table using ON COMMIT PRESERVE ROWS, all data inserted during the session will be automatically cleared when the session ends.	1
7	44	1z0-071	Selected Answer: CD	At least in 23c C and E are correct.\nI haven't faced any error when adding a column, so C correct\nI could drop the table without truncating it first -- A incorrect	1
8	44	1z0-071	Selected Answer: AE	A and E, test in 19c.\nC in the session error ORA 14450 attempt to access a transactional temp table already in use, FIRST end session and add column, but no in the same session	1
9	44	1z0-071	Selected Answer: AE	You get the following error if you don't truncate table invoices_gtt\n\ndrop table invoices_gtt\nError report:\nSQL Error: ORA-14452: attempt to create, alter or drop an index on temporary table already in use\n14452. 00000 -  "attempt to create, alter or drop an index on temporary table already in use"\n*Cause:    An attempt was made to create, alter or drop an index on temporary\n           table which is already in use.\n*Action:   All the sessions using the session-specific temporary table have\n           to truncate table and all the transactions using transaction\n           specific temporary table have to end their transactions.	1
10	44	1z0-071	Selected Answer: AE	Should be A and E tried it out	1
11	44	1z0-071	Selected Answer: CE	why is C wrong? google tells me its possible\n\n'A temporary table can be altered in the same way as a permanent base table although there is no official support to toggle the behavior of the ON COMMIT clause.' \n-some article	1
12	44	1z0-071	Selected Answer: AE	You cant add an fk to a temporary table. Can't refer to it and cannot refer to another table from the temporary table. Tried it out!	2
13	44	1z0-071	Selected Answer: AE	AE is the answer	1
14	44	1z0-071	Selected Answer: AE	A is correct ,you can try execute the sql ,and you would get the  err msg:ORA-03290\nE is correct,when you terminate your session,the row will be deleted,you can try it.	1
15	44	1z0-071	null	DDL operation on global temporary tables\nIt is not possible to perform a DDL operation (except TRUNCATE) on an existing global temporary table if one or more sessions are currently bound to that table.	2
16	44	1z0-071	null	for me , correct  are\nA. To drop the table in this session, you must first truncate it.\nE. When you terminate your session, the row will be deleted.	2
17	44	1z0-071	null	I think A and E are correct. You have a row inserted, so first you have to truncate the table in order to drop it. When you end the session, the table will be dropped, what it means that the row will be also deleted. Please correct me if I am wrong.	1
18	44	1z0-071	Selected Answer: AB	The answers are AB.\nC- false. You CAN'T add a column, and the rows are preserved.\nD-false. You CAN"T add a foreign key to a temp table.\nE-false. Rows are preserved.	2
19	44	1z0-071	null	Here is an example of the differences between session-specific and transaction-specific GTT with comments:\n \ndrop table temp1 purge;\nCREATE GLOBAL TEMPORARY TABLE temp1(\n    id INT,\n    description VARCHAR2(100)\n) ON COMMIT DELETE ROWS;\nINSERT INTO temp1(id,description) \n    VALUES(1,'Transaction specific global temp table');\nSELECT id, description FROM temp1; -- 1 row is there\ncommit;\nSELECT id, description FROM temp1; -- row is gone after the transaction \nALTER TABLE temp1 Add ID_1 char(20);  -- will add column after commit because it is transaction specific\ndrop table temp1;\n\nCREATE GLOBAL TEMPORARY TABLE temp2(\n    id INT,\n    description VARCHAR2(100)\n) ON COMMIT PRESERVE ROWS;\nINSERT INTO temp2(id,description)\nVALUES(1,'Session specific global temp table');\nSELECT id, description FROM temp2; --1 row is there\ncommit;\nSELECT id, description FROM temp2; -- 1 row is still there\nALTER TABLE temp2 Add ID_1 char(20);  --will not work with or without commit after INSERT. It's in session\ndrop table temp2;  -- won't work. session specific\ntruncate table temp2;\ndrop table temp2; -- now it works	3
1	45	1z0-071	Selected Answer: AB	A. The names of employees earning the maximum salary will appear first in an unspecified order: Because if there more than one employ with the same salary the order is unspecified cuz both will use 'A' letter.\nB. All remaining employee names will appear in descending order. Because there is last_name DESC\n\nI should just google the answers instead of depending on the ones here...	6
2	45	1z0-071	Selected Answer: DE	I tested, D & F are right. Order by 'A' means nothing, are not sorted. all of salary > avg salary rows that are not sorted at first, then they are sorted by 'last_name DESC;' at the end of query.	1
3	45	1z0-071	Selected Answer: DF	see answer by ninjax_m further down:\n\nD. All remaining employee names will appear in ascending order.\nAscending is default ordering. case - else outputs employee name that should be sorted ascending.\nF. The names of employees earning the maximum salary will appear first in descending order.\nThey appear first because of 'A' , then after that they are sorted by name, but in descending order (2nd order by clause).	1
4	45	1z0-071	Selected Answer: BF	B. All remaining employee names will appear in descending order.\nCorrect: The last_name DESC clause ensures this.\nF. The names of employees earning the maximum salary will appear first in descending order.\nCorrect: The last_name DESC clause ensures this.	1
5	45	1z0-071	null	A and B IS CORRECT ANSWER	1
6	45	1z0-071	null	Chat GPT says A, B\nThe two correct answers are:\nA. The names of employees earning the maximum salary will appear first in an unspecified order.\nIn the CASE statement, when the employee's salary matches the maximum salary (MAX(salary)), the value 'A' is assigned. Since 'A' comes before any other string alphabetically, employees with the maximum salary will be listed first. However, the order of employees with the maximum salary is unspecified unless there is a secondary sort defined for this group (which is not in this query).\nB. All remaining employee names will appear in descending order.\nAfter the maximum salary employees are displayed, all other employees will be ordered by their last names in descending order due to the clause ORDER BY last_name DESC.	1
7	45	1z0-071	Selected Answer: DF	DF is correct	2
8	45	1z0-071	null	DF is the correct\ncreate table emp(last_name varchar2(100), salary number);\n\ninsert all \ninto emp values('Shri',5000)\ninto emp values('van',5000)\ninto emp values('ben',15000)\ninto emp values('zoo',15000)\ninto emp values('cat',4000)\nselect * from dual;\n\noutput:\nzoo\nben\nShri\ncat\nvan	4
9	45	1z0-071	Selected Answer: AB	A. The names of employees earning the maximum salary will appear first in an unspecified order: Because if there more than one employ whit the same salary the order is unspecified.\nB. All remaining employee names will appear in descending order. Because there is last_name DESC	2
10	45	1z0-071	Selected Answer: DF	DF is correct	2
11	45	1z0-071	Selected Answer: DE	D/E ARE CORRECT.	1
12	45	1z0-071	Selected Answer: DF	DF is correct, I have checked in DB	2
13	45	1z0-071	null	DF is correct	1
14	45	1z0-071	Selected Answer: DF	DF is correct	2
15	45	1z0-071	null	BE is correct	2
16	45	1z0-071	null	Can someone explain me why D and F are correct?	1
1	46	1z0-071	null	ChatGPT says also C and D:\nTrue Statements:\nC. When creating an external table, data can be selected from another external table or from a table whose rows are stored in database blocks.\nThis statement is correct because external tables can be created based on data in other external tables, as well as regular database tables. This flexibility allows for various data processing scenarios where data can be accessed from multiple sources.\nD. Creating an external table creates a dump file that can be used by an external table in the same or a different database.\nThis statement is also true. The ORACLE_DATAPUMP access driver allows the creation of dump files that can be utilized across different databases. This enables data movement and integration between Oracle databases effectively.	1
2	46	1z0-071	Selected Answer: BD	BD IS CORRET FOR SURE	2
3	46	1z0-071	Selected Answer: CD	https://www.examtopics.com/discussions/oracle/view/22606-exam-1z0-071-topic-2-question-60-discussion/	3
1	47	1z0-071	null	The first query is syntactically incorrect. You cannot use the COUNT function in the WHERE clause.\n\nThe second query is also incorrect. The HAVING clause is used to filter the results of an aggregation, and it should be used after the GROUP BY clause, not after the WHERE clause.\n\nThe third query is also incorrect for the same reason as the second one. The HAVING clause should come after the GROUP BY clause.\n\nThe fourth query is correct and will work as expected. It filters rows where the department_id is not equal to 90 using the WHERE clause, groups the remaining rows by department_id, and then applies the HAVING clause to count the rows within each group and filter out groups where the count is greater than or equal to 3.	7
2	47	1z0-071	null	A will fail because of the use of COUNT(*) in the WHERE clause. In SQL, aggregate functions like COUNT(*) should be used in the HAVING clause, not the WHERE clause. The WHERE clause is applied before the grouping (aggregation), so you can't filter on the result of COUNT(*) until after the data has been grouped.	1
3	47	1z0-071	null	A is the correct answer	1
4	47	1z0-071	null	Ignore semicolon , A will fail .	1
5	47	1z0-071	null	C is wrong Because HAVING Clause come under group by clause	1
6	47	1z0-071	null	A\nif you correct the semicolon to each and every query A the one that is failing with ORA-00934: group function is not allowed here	2
7	47	1z0-071	null	D is the right answer. Works fine and AB and C are incorrect by semicolon	2
8	47	1z0-071	null	Don't pay attention about semicolon and the answer is A.\nOrder of HAVING and GROUP BY doesn't matter. \nWHERE is not required in statement.	2
9	47	1z0-071	null	A B are incorrect answers	1
10	47	1z0-071	null	ABC are incorrect for semicolon and even for HVAING should comes after GROUP BY clause.	1
11	47	1z0-071	null	A IS NOT correct for semicolon and also count is not applied to where clause	1
12	47	1z0-071	null	It's a mess! the first three are incorrect for the semicolon	4
1	48	1z0-071	null	B is not correct because "when found then" isnt valid syntax\nC doesnt have an on clause\nD also has a "when found then" which isnt valid	7
1	49	1z0-071	null	its asking for complete weeks so its B	33
2	49	1z0-071	null	B. \nRounding up gives then employees extra days for their "complete" weeks. B would make more sense.	11
3	49	1z0-071	null	B, Truncate not round for complete week.	2
4	49	1z0-071	null	The correct answer is B.\nC doesn't have sense	1
5	49	1z0-071	null	B. its asking for completed weeks (TRUNC not ROUND) and  order by DESC.	2
6	49	1z0-071	null	Moderator, please change the correct answer to B. Currently it is C which is incorrect as the order needs to be descending.	2
7	49	1z0-071	null	There is no department in the table..\nI also vote for B because of complete weeks, starting from longest period of time	1
8	49	1z0-071	null	The answer should be changed to A or B because both are correct. By no means C is correct, it violates the last requirement LONGEST SERVING ON TOP.	1
9	49	1z0-071	null	b is correct	3
10	49	1z0-071	null	A & B, Both are correct. More precise is B.\nThe requirement “output must be sorted by the number of weeks, starting with the longest”  means the sorting order MUST be DESC on Tenure (High -- Low)\nSince in C & D, the order by tenure will adopt ASC by default, it will be from low -High so lowest tenure will be on top of output and highest tenure at bottom.	1
11	49	1z0-071	null	B is the correct answer	3
12	49	1z0-071	null	Are you kidding me? \nWhy paying for incorrect answers?\nObviously the answer is B!	7
13	49	1z0-071	null	Answer B. Complete weeks with trunc	3
14	49	1z0-071	null	B would be more accurate since it does not give extra days by rounding	2
2	62	1z0-071	null	A for sure	1
20	49	1z0-071	null	Task ask for number of COMPLETE weeks - so TRUNC , not ROUND function should be used\n\nAnswer is B	4
21	49	1z0-071	null	B is correct they said de longuest with means the hightest number of weeks	3
22	49	1z0-071	null	B is the correct because the sorting is DESC	3
23	49	1z0-071	null	B is the correct answer	3
24	49	1z0-071	null	B is the correct one	3
25	49	1z0-071	null	B , trunc retunr the number of complete weeks they have been employed	3
26	49	1z0-071	null	maybe A....\n1.starting with the longest serving employee first. => DESC \n2.complete weeks => ROUND((SYSDATE - hire_date)/7) = ROUND((SYSDATE - hire_date)/7),0) \nRound ((SYSDATE - hire_date)/7)to the nearest whole number.\n\ntrunc => round off\n\nround to the nearest whole number better round off => complete weeks	1
1	50	1z0-071	Selected Answer: BF	B. PRODUCT_PRICE can be used in an arithmetic expression even if it has no value stored in it.\n\nWhy? Because while the result is NULL, the expression itself is valid SQL and won’t cause an error.	1
2	50	1z0-071	Selected Answer: BD	EXPIRY_DATE cannot be used in ALL arithmetic operators\nAs there is no information on whether PRODUCT_ID contains duplicate values, we cannot determine whether PK can be assigned on it.	1
3	50	1z0-071	Selected Answer: BF	You can add NULL to a number it will result in NULL	2
4	50	1z0-071	Selected Answer: BF	BF correct	1
5	50	1z0-071	Selected Answer: BD	We dont know if there's any duplicate values for the id column so how do we know if it can be a PK	1
6	50	1z0-071	Selected Answer: BF	B's correct, so is F	1
7	50	1z0-071	Selected Answer: BF	BF correct, see discussion on same  question: https://www.examtopics.com/discussions/oracle/view/8221-exam-1z0-071-topic-1-question-229-discussion/	1
8	50	1z0-071	null	B is wrong, absence of data means null. An arithmetic operation with a null value always yields null	2
9	50	1z0-071	Selected Answer: BF	BF are correct	2
10	50	1z0-071	null	Expiry_DATE cannot be used in arithmetic expressions -> FALSE.	1
11	50	1z0-071	null	why expiry date can not be used in arithmetic expressions ?	1
1	51	1z0-071	null	Correct answer: C and E	13
2	51	1z0-071	null	AB -> typos\nCE -> fails	5
3	51	1z0-071	null	A - logical typo but still will work\nB - Won't work because if _ is missing oracle does not recognize column (invalid identifier)\nC - Won't work because you can't use aliases in where clause \nD - Works\nE - The same as C\nF - Works \nAnswers : A, C, E\nTested on Oracle live	1
4	51	1z0-071	null	C and E because of the alias used in the where clause	4
5	51	1z0-071	null	BCE fail. Tested all.	4
6	51	1z0-071	null	a, b is typo error hence answer is CE because we cant use column aliase in the where clause\nAnswer CE	2
7	51	1z0-071	null	a,b,c,e will fail. Pick 2 :)	2
8	51	1z0-071	null	A -- no comma separator between column names\n\nB- wrong column name last name it should be Last_Name	2
9	51	1z0-071	null	CE is correct	1
10	51	1z0-071	null	what about B. select first_name, last name\nfrom employees; - Will result in ORA-00904 invalid Identifier	4
11	51	1z0-071	null	Cannot use aliases in WHERE clause:\n\nORA-00904: "ANNUAL_SALARY": invalid identifier	5
1	52	1z0-071	Selected Answer: B	You have to use double quotes to refer to the table names	2
2	52	1z0-071	Selected Answer: B	You have to use double quotes to refer to the table names since you can't create a table named 123 using regular means	1
3	52	1z0-071	null	Why wont Option D work when it works for me.	1
4	52	1z0-071	Selected Answer: B	Object Quoted Names.\nhttps://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Database-Object-Names-and-Qualifiers.html#GUID-75337742-67FD-4EC0-985F-741C93D918DA	1
5	52	1z0-071	null	las 4 me salen ERROR	1
1	53	1z0-071	null	A and B can co-exist. Answer should be ABD.	6
2	53	1z0-071	null	D is worng: https://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_9012.htm\n\nWhen you drop a table, any indexes on the table are dropped and put into the recycle bin along with the table. If subsequent space pressures arise, then the database reclaims space from the recycle bin by first purging indexes. In this case, when you flash back the table, you may not get back all of the indexes that were defined on the table.	6
3	53	1z0-071	Selected Answer: AB	A,B and D	1
4	53	1z0-071	null	ChatGPT find E also correct:\nE. A table belonging to one user cannot have an index that belongs to a different user.\nIndexes must belong to the same schema as the table. This means that if a table is owned by one user (in one schema), an index on that table must be created within the same schema. The system won’t allow you to create an index on a table that belongs to one user while placing the index under another user’s schema.	1
5	53	1z0-071	Selected Answer: AB	D can not be correct. Indexes are sent to the recycle bin as well	1
6	53	1z0-071	null	D is definitely not correct since index are moved to recycle bin not permanently removed	2
7	53	1z0-071	Selected Answer: AB	D is wrong.\nWhen a table is moved to the recycle bin, indexes on that table are also moved to the recycle bin and can be restored at the same time as the table.	1
8	53	1z0-071	Selected Answer: AB	AB exactly	1
9	53	1z0-071	Selected Answer: AB	a and b. I tried E out and you can create an index on someone else's table	3
10	53	1z0-071	Selected Answer: AB	for me ABE	2
11	53	1z0-071	Selected Answer: AB	D is wrong, indexes can be restored	3
12	53	1z0-071	null	A is correct as well, it should be ABD.	1
13	53	1z0-071	Selected Answer: BD	BD are correct	1
14	53	1z0-071	null	ABD it should be	1
1	54	1z0-071	Selected Answer: CE	Union all works with clob.	6
2	54	1z0-071	Selected Answer: BE	Set operations cannot be performed on BLOB, CLOB, BFILE,\nVARRAY, or nested table columns.\n\nBCE is the Answer	6
3	54	1z0-071	null	B,C & E All correct	3
4	54	1z0-071	null	CB\nThe set operators are not valid on columns of type BLOB, CLOB, BFILE, VARRAY, or nested table.\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/The-UNION-ALL-INTERSECT-MINUS-Operators.html#GUID-B64FE747-586E-4513-945F-80CB197125EE	1
5	54	1z0-071	Selected Answer: CE	Should be C and E. Tried it out !	3
6	54	1z0-071	null	B:  this option is wrong. \nwe can use UNION ALL with 2 tables having  columns with CLOB datatype. But we cannot use UNION,INTERSECT and MINUS SET operators as it performs removal of duplicate and sorting implicitly and could not work with CLOB.	1
7	54	1z0-071	null	B should be included into the TRUE answer:\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/The-UNION-ALL-INTERSECT-MINUS-Operators.html#GUID-B64FE747-586E-4513-945F-80CB197125EE\nThe set operators are subject to the following restrictions:\n\nThe set operators are not valid on columns of type BLOB, CLOB, BFILE, VARRAY, or nested table.\n\nThe UNION, INTERSECT, and MINUS operators are not valid on LONG columns.\nIf the select list preceding the set operator contains an expression, then you must provide a column alias for the expression in order to refer to it in the order_by_clause.\nYou cannot also specify the for_update_clause with the set operators.\nYou cannot specify the order_by_clause in the subquery of these operators.\nYou cannot use these operators in SELECT statements containing TABLE collection expressions.	1
8	54	1z0-071	null	CE is the answer\n\nNone of the set operator can be used with CLOB -False\nThe set operator which is excluding duplicate rows (intersect,minus,union) will fail to compare the LOB data type.\nUnion all operator doesn't throw any error if it contains LOB datatype	2
9	54	1z0-071	null	https://docs.oracle.com/database/121/SQLRF/queries004.htm#SQLRF52341	1
10	54	1z0-071	null	BCE per link.	2
11	54	1z0-071	null	BCE it is for sure	2
12	54	1z0-071	null	Checking provided link, valid are BCE	1
1	55	1z0-071	null	for Book.seq currval-  is there a logical error despite the statement does execute?	1
2	55	1z0-071	null	How not null and primary key can be set on the same column as primary key = not null + unique key ? I checked it is possible but technically it should not work in that way	1
3	55	1z0-071	null	Can any one explain A,D are the correct answers	1
4	55	1z0-071	null	CURRVAL might have a null value so option C may not work.	1
1	56	1z0-071	null	multiple row subqueries return multiple row with one column . then how D could be the answer.	1
2	56	1z0-071	null	A is wrong due to word ALWAYS. it is not necessary multiple row sub query always return multiple rows, it can return one row also depends on DB. \nBCD is correct	4
3	56	1z0-071	Selected Answer: BCD	BCD, \nhttps://www.w3resource.com/sql/subqueries/multiplee-row-column-subqueries.php	2
4	56	1z0-071	Selected Answer: ABC	A Must to be also true because it severals rows which are values	2
1	57	1z0-071	null	AEF is 100% correct.	1
2	57	1z0-071	Selected Answer: AEF	AEF for me	2
3	57	1z0-071	Selected Answer: ADE	why not ADE?\nwill E work? when we add a new column with default value, will it use that default value automatically for all the existing rows? im not sure, I know that it will do so for new ones though.\nas for D, shouldnt it be possible? as dates are stored as numeric value in the DB from what I know..	1
4	57	1z0-071	null	AEF\nB is wrong an additional column will appear at the end\nC is wrong default value will affect rows that will be inserted after creating default constraint	4
1	58	1z0-071	null	why D is not correct ?	1
2	58	1z0-071	null	I thought that the option "A" for this question would apply the same reasoning as the question 50, where the option that said "PRODUCT_PRICE can be used in an arithmetic expression even if it has no value stored in it." was justified by saying "it doesn't make sense, it's not advisable, but it can be done".	3
3	58	1z0-071	null	Inner join can be done on different tables . Same table is called self join	4
4	58	1z0-071	null	How is E wrong?	1
1	59	1z0-071	Selected Answer: BDG	Not C. Look out for *only*	3
2	59	1z0-071	Selected Answer: BDG	BDG is correct	1
3	59	1z0-071	null	BDG are correct	3
1	60	1z0-071	Selected Answer: BE	It could not be A, because string doesn't match NLS format (RR not RRRR for year).\nE is correct in my opinion because CONCAT can work only with strings, you need to use TO_CHAR for both arguments (date and number).	1
2	60	1z0-071	null	ABC are correct	3
3	60	1z0-071	Selected Answer: BE	A and C can't work because it doesn't match the NLS date format, D works fine by implicit conversion , so it's BE	2
4	60	1z0-071	null	why is E wrong?	1
5	60	1z0-071	Selected Answer: AB	AB are correct, I tested it.	3
6	60	1z0-071	Selected Answer: CD	C. invoice_date > '01-02-2019': This statement uses implicit conversion. The date string is implicitly converted to a DATE type using the default date format.\n\nD. qty_sold = '0554982': This statement requires explicit conversion. You need to explicitly convert the string to a NUMBER to compare it with the QTY_SOLD column.	1
7	60	1z0-071	null	Can anyone please explain the correct answers? not quite getting the sense... thank you.	1
1	61	1z0-071	Selected Answer: ABF	✅ B. Outer joins can be used when there are multiple join conditions on two tables.\n➡️ True – You can absolutely have multiple conditions in an outer join using AND, and it works across columns.\n\nA & F are obvious.	1
2	61	1z0-071	Selected Answer: ABF	Full Outer join returns rows from both tables regardless of match. Inner join only return matched rows	1
3	61	1z0-071	Selected Answer: ABF	From chagpt\n\nA. Option A is true. A full outer join returns both matched rows and unmatched rows from the joined tables. Matched rows are those that satisfy the join condition, while unmatched rows are those that do not have a matching row in the other table.\n\nB. Option B is true. Outer joins can be used when there are multiple join conditions on two tables. This allows for more complex join conditions and provides flexibility in joining tables based on multiple criteria.\n\nF. Option F is true. An inner join returns only the matched rows from the joined tables. It filters out the unmatched rows, resulting in a result set that contains only the rows that satisfy the join condition.	1
4	61	1z0-071	null	What exactly is the Oracle syntax here?	1
5	61	1z0-071	null	QUESTION\nUNMATCHED COLUMN ARE THEY NOT PRODUCED BY LEFT AND RIGHT OUTER JOINS	1
1	62	1z0-071	null	1. The ORDER BY clause uses the column of the first SELECT query.\n2. By default, the first column of the first SELECT query is used to sort the ouput in ascending order.\n3. The ORDER BY clause accepts the column name or an alias.\n4. You can use ORDER BY clause only once in a compound query.\n5. The ORDER BY clause does not recognize the column names of the second SELECT query. To avoid confusion over column names, it is common practice to ORDER BY column positions.	2
3	62	1z0-071	null	@cspro2410\n\nA)If your running both select without order by means it will union and return only 2 columns and after giving order by 1,2 it will run successfully. This is because 1,2 represents two columns.\nB)In here it will union and it return one column only but in order by its given 1,2 so will fail\nC)Here it will union and it return one column but order by is happening on 3rd column\nD)Here union and it return two columns but order by happening on 3rd,4th column \n\nso a is correct	4
4	62	1z0-071	null	why C is incorrect ?	1
1	63	1z0-071	null	A,B and E by chatGpt	1
2	63	1z0-071	null	B & D is correct only. \nE is not	1
3	63	1z0-071	null	IN E, the column alias avg_salary from the sub query is used in the WHERE clause of the main query. Is that allowed?	2
1	64	1z0-071	Selected Answer: ACG	ACG are correct	1
2	64	1z0-071	Selected Answer: ACF	HERE QUES 3 AND 64 ARE SAME CONCEPT,  U PROVIDEd answer for question 3 is oracle joins is better than ansi join, now you are saying different annwer	1
3	64	1z0-071	null	ACG.\nE is incorrect, because the natural join exists only in SQL:1999 (ANSI)	1
4	64	1z0-071	Selected Answer: ACG	ACG is correct	1
5	64	1z0-071	null	E is also correct. The newer Oracle syntax does support Natural Join. https://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqljnaturaljoin.html	1
1	65	1z0-071	Selected Answer: DE	D. COALESCE(expr1, expr2, ..., exprN) returns the first non-null expression from the list and stops evaluating after that.\n\nE. In NVL2(expr1, expr2, expr3), if expr1 is not null, then expr2 is returned, otherwise expr3. So, the first expression can influence the result, but isn’t returned.	1
2	65	1z0-071	Selected Answer: DE	A can perform implicit expression : wrong\nD:  First expression of NVL2 is never returned, it's only used for evaluation: true	1
3	65	1z0-071	Selected Answer: DE	https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/NVL.html	1
4	65	1z0-071	null	A is not necessarily be true. DB applies implicit conversation which sometimes will not work. https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/NVL.html	1
5	65	1z0-071	Selected Answer: DE	First expression of NVL2 is never returned, it's only used for evaluation.	3
6	65	1z0-071	Selected Answer: DE	A: NVL, does implicit conversion. Could have expressions of different datatype	4
7	65	1z0-071	null	A:  NVL must have expressions of same datatype\nmy inputs-   here in option used must have hence it is not right\nSELECT NVL(ENAME, 0) FROM EMP;   -- Here Ename is Varchar2 and we are passing 0 Number data type as second parameter.  In this scenario, NVL working for 2 different datatypes.	1
8	65	1z0-071	null	DE is correct the data types of the nvl are possible to explicitly convert the data type	2
9	65	1z0-071	null	D IS CORRECT\nCOALESCE () BEACUSE Return first not null expression in the expression list.	1
10	65	1z0-071	null	E IS CORRECT \nThe first expression in NVL2 is never returned, it is only used to determine whether expression2 must be returned, or expression3.	1
11	65	1z0-071	Selected Answer: AD	E is not right because \nNVL2 (expr1, expr2, expr3)\nexpr1 is the source value or expression that may contain null\nexpr2 is the value returned if expr1 is not null\nexpr3 is the value returned if expr1 is null\n\nF is not right because\nThe COALESCE() function returns the first non-null value in a list.	1
12	65	1z0-071	Selected Answer: AD	AD is correct, if not then please correct me.	1
13	65	1z0-071	Selected Answer: DE	DE is correct: \nD. COALESCE stops evaluating the list of expressions when it finds the first non-null value. TRUE\nhttps://www.oracletutorial.com/oracle-comparison-functions/oracle-coalesce/\nE. The first expression in NVL2 is never returned. TRUE\nIf expr1 is not null, then NVL2 returns expr2. If expr1 is null, then NVL2 returns expr3. (https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/NVL2.html)	2
14	65	1z0-071	Selected Answer: AD	A, D is correct	1
15	65	1z0-071	null	It should be AD. \nA: it is true that oracle can make implicit conversions but still the NVL function requires that the two exps be of the same data type. Hence A is correct\nE is wrong because if we specified that we want the same exp to be returned when it's not null it would return its first  exp. Tried this in Toad and got 'h1'\nselect nvl2('h1', 'h1', 4) from dual;	2
16	65	1z0-071	null	it's also true the A, select nvl(1,'pippo') from dual returns ora-01722	1
1	66	1z0-071	Selected Answer: D	D because it is union	1
2	66	1z0-071	Selected Answer: D	Union will get rid of duplicate so only 1 row remaining	1
3	66	1z0-071	Selected Answer: D	It is not union all to return duplicated rows	1
4	66	1z0-071	null	D checked \n\nselect 1 as id, 'john' as first_name from dual\nunion\nselect 1, 'john' as name from dual order by 1;	1
5	66	1z0-071	null	Because both rows are the same, the UNION result gives distinct answers	3
6	66	1z0-071	null	Option-B is the correct choose	2
1	67	1z0-071	Selected Answer: D	Oracle documentation says:\n“In set operations, two NULLs are considered equal when determining duplicates.”	1
2	67	1z0-071	Selected Answer: A	Important SQL Rule:\nIn Oracle SQL, NULL is not equal to another NULL. That means:\n\nsql\nCopy\nEdit\nNULL = NULL  → FALSE (or unknown, technically)\nThe INTERSECT operator returns only the distinct rows that are equal in both sets.\n\nSince NULL ≠ NULL, even if the rows look the same, Oracle treats them as not equal thus ERROR!	1
3	67	1z0-071	Selected Answer: D	INTERSECT will only keep rows that exists for both tables so only 1 row remaining	1
4	67	1z0-071	Selected Answer: D	Checked	1
5	67	1z0-071	null	D tested \nselect 1 as id, 'john' as first_name, NULL as commission from dual\nintersect\nselect 1, 'john' as name, null from dual order by 3;	2
6	67	1z0-071	Selected Answer: D	It returns 1 row, because the values are the same. I do tested as well	2
7	67	1z0-071	null	tested on 19c, returns 0 rows.	1
1	68	1z0-071	null	the answer is A and B tested	1
2	68	1z0-071	null	how did u extract only text from this text image	1
3	68	1z0-071	null	AB tested	2
4	68	1z0-071	null	why is D wrong?	1
1	69	1z0-071	Selected Answer: BCD	A is not successful DML	2
2	69	1z0-071	Selected Answer: BCD	For A to be true the statement would have to be syntactically valid.	2
11	84	1z0-071	null	B D if B is SELECT NVL('DATE', SYSDAte) FROM DUAL;	1
3	69	1z0-071	null	Should be BCD:\nA - FALSE\n- it is syntax error therefore does not implicitly commit: Oracle Database issues an implicit COMMIT under the following circumstances:\n\nBefore any syntactically valid data definition language (DDL) statement, even if the statement results in an error\n\nAfter any data definition language (DDL) statement that completes without an errorhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/COMMIT.html#GUID-6CD5C9A7-54B9-4FA2-BA3C-D6B4492B9EE2	1
4	69	1z0-071	Selected Answer: BCD	A is wrong, ddl is still in compilation mode, so no ddl considered.	1
5	69	1z0-071	null	A - false since it is syntax error (checked ) if it is run time error then it commits the transaction.  \nB is true The SHUTDOWN TRANSACTIONAL waits for all uncommitted transactions to complete before shutting down the database instance. This saves the work for all users without requesting them to log off.\n\nBCD would be the right answer	1
6	69	1z0-071	Selected Answer: ACD	Chat GPT says A is correct and B is wrong.\nas SHUTDOWN TRANSACTIONAL functionality is that it waits all transactions to end then it shuts down the database, but he says since it was 'successful' then that means that the database already was shut down before the user committed.\nI think there is some logical problem with the answer.. its confusing, how is it successful but there was still a transaction in progress?	1
7	69	1z0-071	null	ALTER TABLE and CREATE INDEX , which do cause a commit.\nOracle performs an implicit commit after any SQL DDL (Data Definition Language) statement (even if this DDL statement fails).\n\nThis includes table / index creation. So no open transaction should exist.	1
8	69	1z0-071	null	I CHECKED making an experiment and A IS CORRECT answer.\nLooks like just CREATE TABLE AS creates a COMMIT (error  was placed later - I used unexisting table as a source)	2
9	69	1z0-071	null	Don't know why A is correct answer	1
10	69	1z0-071	Selected Answer: BCD	BCD is correct.	3
11	69	1z0-071	Selected Answer: BCD	B should be correct, because the session will be killed after the last transaction will be committed or the user will use rollback... A is incorrect because the statement failed with a syntax error	2
12	69	1z0-071	null	why is not B?\nC used SQLPLUS is right but use sql developer ....Maybe not	3
1	70	1z0-071	Selected Answer: DF	Not NULL constraints can only be set at column level not table level. Each table have only have one primary key constraint with multiple foreign key constraints	1
2	70	1z0-071	Selected Answer: DF	D and F are true	1
3	70	1z0-071	Selected Answer: DF	https://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqlj13590.html	2
4	70	1z0-071	null	What does D mean?	1
5	70	1z0-071	null	why A not correct?	2
1	71	1z0-071	null	Selected Answer: AF	1
2	71	1z0-071	Selected Answer: AF	UNIQUE and PRIMARY key constraints will have unique index created automatically	3
1	72	1z0-071	Selected Answer: A	create table channels_order (\nchannel_type varchar2(50),\nmonth date,\ncode varchar2(5),\nsales number);\n\ninsert into channels_order values('internet','2009-09','GB',16569);\ninsert into channels_order values('internet','2009-09','US',124224);\ninsert into channels_order values('internet','2009-10','GB',14539);\ninsert into channels_order values('internet','2009-10','US',137054);\n\ninsert into channels_order values('direct sales','2009-09','GB',85223);\ninsert into channels_order values('direct sales','2009-09','US',638201);\ninsert into channels_order values('direct sales','2009-10','GB',91925);\ninsert into channels_order values('direct sales','2009-10','US',682297);\n\nselect channel_type,month,code,sum(sales) sums from channels_order ch\ngroup by channel_type,rollup(month,code);	1
2	72	1z0-071	null	D is correct, can't say about rollup	1
3	72	1z0-071	Selected Answer: A	A for me	1
4	72	1z0-071	Selected Answer: D	D is the correct answer	1
5	72	1z0-071	Selected Answer: A	Ok, out of curiosity I added the first group to see the result... 16569+124224+14539+137054 = 292386. A difference of 1?? Why? Could it have been a sum of undisplayed decimal values?	1
6	72	1z0-071	Selected Answer: A	As per my understanding from below link I think A is correct.\nhttps://www.oracletutorial.com/oracle-basics/oracle-rollup/#:~:text=The%20ROLLUP%20works%20as%20follows%3A%201%20First%2C%20calculate,to%20left.%203%20Finally%2C%20calculate%20the%20grand%20total.	1
7	72	1z0-071	null	D is the correct answer	2
1	73	1z0-071	Selected Answer: C	Not valid to compare NULL to any value must use IS NOT NULL or IS NULL	2
2	73	1z0-071	Selected Answer: C	C is OK, last comment was a mistake.	2
3	73	1z0-071	Selected Answer: A	AD are the correct answers	1
4	73	1z0-071	null	Distinct should come first after select, also we use is not null \nso it is C.	2
1	74	1z0-071	null	AD are the correct answers	29
2	74	1z0-071	null	A D\ncreate table briks ( brick_id number(38)\n                         , shape varchar2(30)\n                         , color varchar2(30)\n                         , weight number );\n\ncreate table bricks_stage( weight number\n                         , shape varchar2(30)\n                         , color varchar2(30));\n                         \n   --A +                      \n  select brick_id , shape from briks\n  minus\n  select weight, color from bricks_stage;\n  \n --B -\nselect * from briks\n  minus\nselect * from bricks_stage;\n\n-- C -\n  select shape, color from briks\n  minus\n  select weight, color from bricks_stage;\n  \n-- D +\n  select shape, color from briks\n  minus\n  select color, shape from bricks_stage;\n  \n--E   \n  select shape, color, weight from briks\n  minus\n  select * from bricks_stage;	7
3	74	1z0-071	null	A and D are the correct options	1
4	74	1z0-071	null	Answer is A, D is not correct because of the ordering of the columns (datatype mismatch)	1
5	74	1z0-071	null	AD is correct. The Data type and number of columns have to be same.	1
6	74	1z0-071	null	AD for me	2
7	74	1z0-071	null	AD, number of columns and order types should match	2
8	74	1z0-071	null	if D works, why wont E?	1
9	74	1z0-071	null	AD are the correct answers	1
10	74	1z0-071	null	AD should be the correct answer since the data types match with same number of columns	1
11	74	1z0-071	null	AD are the correct answers	1
12	74	1z0-071	null	AD are the correct	2
13	74	1z0-071	null	It is no brainer. AD!	2
12	84	1z0-071	null	Checked should be B D.  E is wrong "inconsistent data type"	1
4	85	1z0-071	Selected Answer: DEF	DEF for me	2
5	85	1z0-071	null	DEF, D says CAN	1
14	74	1z0-071	null	AD is Correct answer.\nUse Minus operator to return all distinct rows selected by the first query, but not present in the second query result set. \nIn Minus operator, the number of columns must be the same and data type of columns being selected by the SELECT statements in queries must belong to the same data type group in all the SELECT statements used in the query. The names of the columns, however, need not be identical.	2
15	74	1z0-071	null	A,D are correct	3
16	74	1z0-071	null	AD ARE CORRECT. The others show errors.	1
17	74	1z0-071	null	why C inccorect?	2
18	74	1z0-071	null	B is wrong\nORA-01789: query block has incorrect number of result columns\nE is wrong\nORA-01790: expression must have same datatype as corresponding expression\n\nAD is the correct answer.	4
19	74	1z0-071	null	AD is correct because the date type must b match	2
20	74	1z0-071	null	AD correct	2
21	74	1z0-071	null	AD IS RIGHT	3
22	74	1z0-071	null	Agree. The posted answer is way-off.	2
1	75	1z0-071	Selected Answer: BE	Inner query is run first then update query is ran	1
2	75	1z0-071	Selected Answer: BE	BE Correct	1
3	75	1z0-071	Selected Answer: BE	BE ARE CORRECT.	1
1	76	1z0-071	null	B is correct answer\nFrom first table it will take 2 records, from second table it will take 3 records. After cross join we will have 6 records (2x3).	6
2	76	1z0-071	Selected Answer: A	Ans is 4 cause each manager from  from emp table  (clark and jones) is matched with both dept table (10,20)---2*2=4	1
3	76	1z0-071	Selected Answer: B	B IS CORRECT.	3
4	76	1z0-071	null	B is correct because in emp table he take all manager rows then in dept he take 10 and 20\nwill be 3*2=6	2
5	76	1z0-071	Selected Answer: B	3 x 2 = 6 so B	2
1	77	1z0-071	Selected Answer: B	CURRENT_TIMESTAMP returns a timestamp data type with time zone	1
2	77	1z0-071	Selected Answer: B	Correct is B	1
3	77	1z0-071	null	LOCALTIMESTAMP returns a TIMESTAMP value while CURRENT_TIMESTAMP returns a TIMESTAMP WITH TIME ZONE value\nB is correct	1
1	78	1z0-071	Selected Answer: C	C is correct because of 3rd condition: 'Be used for calculating interest for the number of days the loan remains unpaid'	1
2	78	1z0-071	Selected Answer: C	C. The data type of each column returned by the second query must be implicitly convertible to the data type of the corresponding column returned by the first query.\nThe data types must be implicitly convertible between corresponding columns. For example:\nA NUMBER column in the first query can correspond to a VARCHAR column in the second query, provided Oracle can implicitly convert the VARCHAR to a NUMBER.\n\nE. The number, but not names, of columns must be identical for all select statements in the query.\nAll queries in a UNION, INTERSECT, or MINUS statement must return the same number of columns, but the column names do not have to match.	1
3	78	1z0-071	Selected Answer: C	C is correct.	1
4	78	1z0-071	null	C is correct because it fulfill all the condition. \n1) store without conversion\n2) store up to 99 years and 11 month\n3) can be use for calculation	1
5	78	1z0-071	Selected Answer: A	The INTERVAL DAY TO SECOND data type is used to store a period of time in terms of days, hours, minutes, and seconds. It does not support storing a loan period of up to 10 years, as it does not have a year component.\nTo meet the requirements of storing a loan period of up to 10 years and supporting date arithmetic without using conversion functions, you should use the INTERVAL YEAR TO MONTH data type instead. This data type allows you to store a period of time in terms of years and months, which aligns with the requirement of storing a loan period.	1
6	78	1z0-071	Selected Answer: C	ChatGPT came back with C (INTERVAL DAY TO SECOND):\n-This data type stores a period of time in terms of days, hours, minutes, and seconds.\n-It supports date arithmetic and can precisely represent the number of days a loan remains unpaid, making it suitable for calculating daily interest.\n-This seems like the most appropriate choice for the given requirements.\n\nBased on the analysis:\nThe most appropriate choice is C. INTERVAL DAY TO SECOND because it fulfills all the requirements.\nOptions A, B, D, and E are not suitable because they either don't consider the number of days specifically (A) or represent specific points in time rather than durations (B, D, E).\n\n--------\nPlease correct me if I'm wrong.	1
7	78	1z0-071	null	ChatGPT comes back with INTERVAL YEAR TO MONTH	1
8	78	1z0-071	Selected Answer: B	B is correct	1
9	78	1z0-071	null	C is correct	1
1	79	1z0-071	Selected Answer: CE	C and E.\n\nA. It is a misleading answer because Oracle does not require 'group match' , this is wrong. \nC. It is Oracle's behavior, second query columns must be 'implicitly convertible' to the first.\n\nSo answers: C and E	1
2	79	1z0-071	Selected Answer: CE	Not A. because "Data type group" isn’t a strict SQL requirement — Oracle uses implicit conversion, not strict groups.	2
3	79	1z0-071	null	A , C and E are correct	1
4	79	1z0-071	null	CE for sure 100%	4
5	79	1z0-071	Selected Answer: AE	AE for me - I don't think they need to match exactly.	2
6	79	1z0-071	Selected Answer: AE	The data types does not need to match exactly	1
7	79	1z0-071	Selected Answer: AE	AE Correct	1
8	79	1z0-071	null	CE is 100% percent is correct	4
9	79	1z0-071	Selected Answer: AE	AE are correct.	1
10	79	1z0-071	null	c is incorrect ->The set operators are not valid on columns of type BLOB, CLOB, BFILE, VARRAY, or nested table.\n\ni think D E are correct\nThe UNION, INTERSECT, and MINUS operators are not valid on LONG columns.\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/The-UNION-ALL-INTERSECT-MINUS-Operators.html#GUID-B64FE747-586E-4513-945F-80CB197125EE	2
1	80	1z0-071	null	According to:\nhttps://docs.oracle.com/cd/B19306_01/server.102/b14200/queries004.htm\n\n"If both queries select values of datatype CHAR of equal length, then the returned values have datatype CHAR of that length. If the queries select values of CHAR with different lengths, then the returned value is VARCHAR2 with the length of the larger CHAR value."\nAND\n"In queries using set operators, Oracle does not perform implicit conversion across datatype groups. "\n\nSo DE.	5
1	85	1z0-071	Selected Answer: DEF	D. It can be an outer join.\nTrue: A self join can indeed be an outer join. For example, you can use a left outer join or a right outer join when joining a table to itself, allowing you to retain unmatched rows from one of the instances of the table.	1
2	85	1z0-071	Selected Answer: BDF	Answer is B, D, F.\nIt cannot be E. 'On' clause Must be used.	1
2	80	1z0-071	Selected Answer: AD	A. In a query containing multiple set operators, INTERSECT always takes precedence over UNION and UNION ALL.\nCorrect:\nIn queries with multiple set operators, the precedence order is:\nINTERSECT\nUNION / UNION ALL\nMINUS\nIf parentheses are not used to explicitly define precedence, INTERSECT is evaluated before UNION or UNION ALL.\nD. CHAR columns of different lengths used with a set operator return a VARCHAR2 whose length equals the longest char value.\nCorrect:\nWhen CHAR columns of varying lengths are combined using a set operator, Oracle returns the result as a VARCHAR2 column whose length matches the longest CHAR value in the result set.	2
3	80	1z0-071	Selected Answer: DE	https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/The-UNION-ALL-INTERSECT-MINUS-Operators.html#GUID-B64FE747-586E-4513-945F-80CB197125EE	4
4	80	1z0-071	Selected Answer: AD	A. In a query containing multiple set operators, INTERSECT always takes precedence over UNION and UNION ALL.\n\nWhen multiple set operators are used in a query, INTERSECT has higher precedence than UNION and UNION ALL. This means that the INTERSECT operation will be evaluated before the other set operators, unless parentheses are used to explicitly define the order of operations.\nD. CHAR columns of different lengths used with a set operator return a VARCHAR2 whose length equals the longest char value.\n\nWhen CHAR columns of different lengths are combined using set operators, the result is a VARCHAR2 column with a length equal to the longest CHAR value in the result set. This is due to how Oracle handles the return type when different CHAR lengths are combined.	1
5	80	1z0-071	Selected Answer: DE	DE are correct	4
6	80	1z0-071	Selected Answer: DE	DE are the correct answer	3
7	80	1z0-071	Selected Answer: DE	DE are correct	2
8	80	1z0-071	Selected Answer: DE	DE are correct	2
9	80	1z0-071	Selected Answer: DE	D E are correct.\nsource: https://docs.oracle.com/cd/B19306_01/server.102/b14200/queries004.htm	2
10	80	1z0-071	null	DE , tested that	1
11	80	1z0-071	Selected Answer: DE	Definitely not BC	1
12	80	1z0-071	Selected Answer: DE	B is incorrect because it is not mandatory to have an alias for each column in the first SELECT\nselect first_name ||''||last_name, employee_id\nfrom hr.employees\nunion\nselect first_name,employee_id\nfrom HR.EMPLOYEES\norder by 1,2;\nC is incorrect because the datatypes : BLOC,CLOB are not valid the set Operators.\n\nDE is the correct answer.	1
13	80	1z0-071	Selected Answer: DE	DE are correct	1
14	80	1z0-071	null	DE are correct	1
15	80	1z0-071	null	I think it’s BD?	1
1	81	1z0-071	Selected Answer: CD	https://www.examtopics.com/discussions/oracle/view/15644-exam-1z0-071-topic-1-question-17-discussion/	1
2	81	1z0-071	null	Why B incorrect?	1
1	82	1z0-071	null	C , D and F are correct	1
2	82	1z0-071	null	CDF CORRECT	1
3	82	1z0-071	Selected Answer: CDF	CDF ARE CORRECT	1
4	82	1z0-071	Selected Answer: CDF	CDF are correct\nhttps://moqups.com/templates/diagrams-flowcharts/erd/	2
1	83	1z0-071	Selected Answer: BF	drop table orders;\ncreate table orders(order_id number , order_date date);\n\ninsert into orders values(1,null);\ninsert into orders values(2,null);\ninsert into orders values(3,'1-jan-2019');\ninsert into orders values(4,'1-feb-2019');\ninsert into orders values(5,'1-mar-2019');\n\n\ncreate table invoices(\ninvoice_id number, order_id number, order_date date);\n\ninsert into invoices values(1,1,null);\ninsert into invoices values(2,2,'01-jan-2019');\ninsert into invoices values(3,3,null);\ninsert into invoices values(4,4,'01-feb-2019');\ninsert into invoices values(5,5,'01-APR-2019');\n\n\nSELECT ORDER_ID , ORDER_DATE FROM ORDERS\nINTERSECT\nSELECT ORDER_ID , ORDER_DATE FROM INVOICES;\n\n\nANSWER IS B,F.	11
2	83	1z0-071	null	This needs an update badly. There is no question, just some tables and a query showing on this site..	10
3	83	1z0-071	Selected Answer: BF	1\t\n4\t01-FEB-19	1
4	83	1z0-071	null	I think the question is what the result of intersect \nThe result will only include rows where both the order_id and order_date match between the ORDERS and INVOICES tables.\n\nSo, order ID 1& 4 has exact match -------- but the 4  1-Fab-2019 is not in result (if you dont consider the Typo in option F) \n\nB seems to be the answer in given circumstances	1
5	83	1z0-071	null	Best answer is B. 01-FEB-2019	1
6	83	1z0-071	null	Just finished this exam. Question: Which three results will be returned?	1
7	83	1z0-071	Selected Answer: BF	La respuesta es la B y la F	1
8	83	1z0-071	null	B and F is answer- below is the result we will get. F option has typo 01-FEB-2019\norderid  order_date\n1\t      (null)\n4\t      01-02-19	1
9	83	1z0-071	null	Question is not there	1
10	83	1z0-071	null	In Oracle, the INTERSECT operator is used to combine the result sets of two or more SELECT statements and returns only the rows that are common to all result sets.	1
11	83	1z0-071	Selected Answer: BF	BF ARE CORRECT	1
12	83	1z0-071	Selected Answer: BF	BF is the answer	1
13	83	1z0-071	null	I already took the exam ant these question ask for 3 answers\nB, E, F	1
14	83	1z0-071	null	Tesded:\n1 null\n4 01/02/19 00:00:00	3
15	83	1z0-071	null	BF is the answer	1
16	83	1z0-071	null	bf only if F is 01-FEB-2019 and not 01-FEB-2015 i am sorry then is B only	2
17	83	1z0-071	null	is t 100% bf went we do created everything	1
18	83	1z0-071	null	bf only if  F is  01-FEB-2019 and not 01-FEB-2015	3
19	83	1z0-071	Selected Answer: BF	bf is correct for sure	2
20	83	1z0-071	null	answer should be BF	2
21	83	1z0-071	null	I think it’s BF ?	2
1	84	1z0-071	null	why isnt C correct?	1
2	84	1z0-071	null	BD is correct provided there is a type on Question B, sysdate	1
3	84	1z0-071	Selected Answer: BD	checked	3
4	84	1z0-071	null	B and D is correct answers.	2
5	84	1z0-071	Selected Answer: BD	checked \nfor E -> ORA-00932: inconsistent datatypes: expected CHAR got DATE	1
6	84	1z0-071	Selected Answer: BD	BD are correct	2
7	84	1z0-071	Selected Answer: BD	BD is the answer	2
8	84	1z0-071	Selected Answer: BD	verified, only BD is correct, E will throw an error ORA-00932	1
9	84	1z0-071	null	E is wrong \nORA-00932: inconsistent datatypes: expected CHAR got DATE\n\nBD is the correct one	1
10	84	1z0-071	null	BD IS 100% IF YOU GO TO CHEK	1
3	85	1z0-071	null	D , E and F	1
6	85	1z0-071	Selected Answer: BCF	not sure why ain't like this	1
1	86	1z0-071	Selected Answer: B	B. It returns the date for the first Monday of the next month.\n\nExplanation:\nLAST_DAY(SYSDATE): This function returns the last day of the current month.\n\nNEXT_DAY(LAST_DAY(SYSDATE), 'MON'): This function returns the next Monday after the date provided (which in this case is the last day of the current month). Since the last day of the current month is used, NEXT_DAY will return the first Monday of the next month.\n\nTO_CHAR(..., 'dd "Monday for" fmMonth rrrr'): This formats the date to display the day (dd), followed by the string "Monday for", followed by the full month name (with fm removing any leading spaces), and finally the year (rrrr).\n\nThus, the query returns the date for the first Monday of the next month formatted as specified.	2
2	86	1z0-071	null	B correct. \nD is wrong. output is "06 Monday for May 2024"	1
3	86	1z0-071	Selected Answer: B	Answer is B. Tested.	3
4	86	1z0-071	Selected Answer: D	There should be 'Monday' instead of 'MON'	2
1	87	1z0-071	Selected Answer: CD	C & D tested fine.	1
2	87	1z0-071	null	C is incorrect because subqueries using aggregate functions typically do not use HAVING clauses; rather, HAVING is used in the outer query to filter the results of aggregates	1
3	87	1z0-071	Selected Answer: CD	CD for me	2
1	88	1z0-071	Selected Answer: AD	AD is correct	2
2	88	1z0-071	Selected Answer: AD	AD is correct	2
3	88	1z0-071	null	AD is correct	2
4	88	1z0-071	null	Option A is correct. Indexes can be created on global temporary tables, allowing for efficient data retrieval and manipulation.\nOption D is correct. If the ON COMMIT clause is specified as transaction-specific (ON COMMIT DELETE ROWS), all rows in the global temporary table are automatically deleted after each COMMIT or ROLLBACK statement. This ensures that the table is cleared for the next transaction.	1
5	88	1z0-071	Selected Answer: AD	A D  are correct: \nD. If the ON COMMIT clause is transaction-specific, all rows in the table are deleted after each COMMIT OR ROLLBACK.\n''all rows in the table are deleted'' = TRUNCATE	2
6	88	1z0-071	null	C isn't correct:\nBy default, Oracle stores the data of the global temporary table in the default temporary tablespace of the table’s owner.\n\nBut you can explicitly assign another tablespace to a global temporary table during table creation using the TABLESPACE clause\n\nhttps://www.oracletutorial.com/oracle-basics/oracle-global-temporary-table/	2
7	88	1z0-071	null	AC is correct\nD is wrong, because :\nThe ON COMMIT clause specifies whether data in the table is transaction-specific or session-specific:\n\nThe ON COMMIT DELETE ROWS clause specifies that the global temporary table is transaction-specific. It means that ORACLE TRUNCATE THE TABLE after each commit.\nThe ON COMMIT PRESERVE ROWS clause specifies that the global temporary table is session-specific, meaning that ORACLE TRUNCATE THE TABLE when you terminate the session, not when you commit a transaction.\nDelete is DML, truncate is DDL	1
8	88	1z0-071	null	I think A,C	1
9	88	1z0-071	null	I Think A, D. \nD -> If the ON COMMIT is transaction specific -> COMMIT, ROLLBACK delete rows.\nNOT C-> Allocation of temporal segments are done on USER TEMP TABLESPACE, at time of use table, no always in the TEMP TABLESPACE of the OWNER.	3
10	88	1z0-071	null	I think are A and C	1
1	89	1z0-071	Selected Answer: ACF	F: Is correct.	1
2	89	1z0-071	null	ACE \nF is incorrect	1
3	89	1z0-071	Selected Answer: ACF	ACF correct	1
4	89	1z0-071	null	why not B?	1
5	89	1z0-071	null	why is E wrong ?	1
6	89	1z0-071	null	Why C is not correct?	1
1	90	1z0-071	null	i am finding 3 that are correct. CEF	7
2	90	1z0-071	null	I think it’s CE ?	5
3	90	1z0-071	Selected Answer: CE	✅ C.\n\nsql\nCopy\nEdit\nINSERT INTO employees \n(employee_id, salary, first_name, hiredate, last_name) \nVALUES (101, 12100, 'John', SYSDATE, 'Smith');\nThis works: all required columns (EMPLOYEE_ID, LAST_NAME) are provided.\n\nThe column order doesn’t have to match the table, as long as it's declared.\n\nDEPARTMENT_ID is nullable, so it's fine to omit.\n\n✅ E.\n\nsql\nCopy\nEdit\nINSERT INTO employees \nSELECT 101, 'John', 'Smith', 12000, (SELECT SYSDATE FROM dual), 10 FROM dual;	1
4	90	1z0-071	Selected Answer: CE	C: Explicitly matches columns with their values.\nE: Uses a SELECT query to populate all columns correctly.\nF: Provides all values in the correct order.	1
5	90	1z0-071	null	CF is correct. \nin F, if have space between ' ' for last Name, it will be accepted. if there is no space, then not null constraint will apply.	2
6	90	1z0-071	null	A, C for me. E is wrong because SELECT 101 is not correct.	1
7	90	1z0-071	Selected Answer: EF	EF is correct for me as ' ' is not null...	1
8	90	1z0-071	Selected Answer: CE	CE definitely works tested	1
9	90	1z0-071	Selected Answer: CD	CD also works	1
10	90	1z0-071	Selected Answer: CF	CF Should be the correct answer	1
11	90	1z0-071	null	C, E worked.  F gave me ora-01400	1
12	90	1z0-071	Selected Answer: CF	E works too	1
13	90	1z0-071	null	CE tested	1
14	90	1z0-071	Selected Answer: CE	CEF are corret. I checked in data base.	2
15	90	1z0-071	null	Why A is wrong?	1
16	90	1z0-071	Selected Answer: CE	C E are correct. F would be ok whith an space between ' '. \nIf you copy and paste the exact alternative from here, it works, but I imagine that the exam doesn't have that space and that's why the're only two correct options.	2
17	90	1z0-071	Selected Answer: CE	CE is the answer	1
18	90	1z0-071	Selected Answer: CE	"F" is a wrong because not null.	1
1	91	1z0-071	Selected Answer: DE	D, E - TRUNCATE only affects rows(data), not table definition.	1
2	91	1z0-071	Selected Answer: DE	DE should be the correct answer	3
3	91	1z0-071	Selected Answer: DE	D y E son correctas.	2
4	91	1z0-071	Selected Answer: DE	The structure of the TEST table is still available. It is dropped only when drop the table	1
5	91	1z0-071	null	I think instead of TRUNCATE command DROP should be use to get option A and C as answers	1
6	91	1z0-071	Selected Answer: DE	DE ARE CORRECT	2
7	91	1z0-071	Selected Answer: DE	DE is the answer	1
8	91	1z0-071	Selected Answer: DE	D and E are the correct answers.	1
9	91	1z0-071	Selected Answer: DE	"D" and "E" are correct.	1
10	91	1z0-071	Selected Answer: DE	DE are correct	2
11	91	1z0-071	Selected Answer: DE	DE are correct	2
12	91	1z0-071	Selected Answer: DE	DE are correct.	2
13	91	1z0-071	Selected Answer: DE	https://docs.oracle.com/database/121/SQLRF/statements_10007.htm#SQLRF01707\n\nDE is correct answer	2
14	91	1z0-071	null	DE is correct\n\nA. The structure of the TEST table is removed.  wrong, only content will get removed\nB. All the indexes on the TEST table are dropped.  indexes will stay\nC. All the constraints on the TEST table are dropped.  wrong\nD. Removed rows can not be recovered using the ROLLBACK command.  true\nE. All the rows in the TEST table are removed. true	2
15	91	1z0-071	Selected Answer: DE	DE are correct	2
16	91	1z0-071	null	DE Correct Answer	1
17	91	1z0-071	null	DE is correct	1
18	91	1z0-071	Selected Answer: DE	DE is correct	1
1	92	1z0-071	Selected Answer: DEF	DEF is the right answer.	1
2	92	1z0-071	Selected Answer: BDF	Synonyms for HR.EMPLOYEES are dropped.\n\nWhen you drop a table, any synonyms that point to that table are automatically dropped because the underlying object no longer exists.	1
3	92	1z0-071	Selected Answer: DEF	DEF for me	3
4	92	1z0-071	Selected Answer: DEF	DEF is correct	1
5	92	1z0-071	Selected Answer: DEF	I think the same as lucemqy and jm9999	1
6	92	1z0-071	Selected Answer: DEF	Views and synonyms are not dropped but invalid	1
7	92	1z0-071	Selected Answer: EF	For me, only EF proved to be true.  The constraint was still listed in user_constraints after issuing the drop.  I think ABC are definitely false and you have to pick 3 so ....	1
8	92	1z0-071	null	D,E,F are correct	1
9	92	1z0-071	null	DEF, I think synonyms and views are invalidated but not dropped	2
10	92	1z0-071	Selected Answer: BCD	B,C,D  are correct	2
1	93	1z0-071	Selected Answer: BCD	A & E doesn't work because\n\nhe ORDER BY clause needs to refer to something that exists in both parts of the union (either a column position or an alias that applies to both parts).	1
2	93	1z0-071	Selected Answer: BCD	You can only order by column names from the first select query	3
3	93	1z0-071	null	Correct answer is BCD.\nThe ORDER BY clause does not recognize the column names of the second SELECT query. So,	2
1	94	1z0-071	Selected Answer: AD	Why E is wrong? Because - * Per official Oracle documentation, you can use 'FORCE' keyword to create view over table that doesn't exists when needed.\n\nhttps://www.oracletutorial.com/oracle-view/oracle-create-view/	1
2	94	1z0-071	Selected Answer: AD	AD is correct	1
3	94	1z0-071	null	C and E also correct?	1
1	95	1z0-071	null	D is incorrect, there is a missing single quote before the (||) operator	1
2	95	1z0-071	Selected Answer: BD	A. SELECT 'The first_name is " || first_name || " FROM (select 'user' first_name from dual);  --O/P = ORA-00923: FROM keyword not found where expected\nB. SELECT 'The first_name is ''' || first_name || '''' FROM (select 'user' first_name from dual);  --O/P = The first_name is 'user'\nC. SELECT 'The first_name is ''' || first_name || ''' FROM (select 'user' first_name from dual);  --O/P = ORA-00923: FROM keyword not found where expected\nD. SELECT 'The first_name is ' || first_name || '' FROM (select 'user' first_name from dual); --O/P = The first_name is user\nE. SELECT 'The first_name is \\" || first_name || '\\" FROM (select 'user' first_name from dual);  --O/P = ORA-24450: Cannot pre-process OCI statement	1
3	95	1z0-071	Selected Answer: BD	BD for me	1
4	95	1z0-071	Selected Answer: BD	BD is correct checked	1
5	95	1z0-071	null	Can someone explain why B,D is correct ?	3
6	95	1z0-071	null	it depends on quotation mark, since we can not copy from this question normally you have to guess where are double qoutes and where are single ones, but if it like that:\n\nSELECT 'The first_name is ' " || first_name || ' ' " FROM temp;   (column name  || first_name || ' ' )\nSELECT 'The first_name is ' " || first_name || ' " FROM temp;    (column name  || first_name || ' )\nSELECT 'The first_name is ' || first_name || ' ' FROM temp;    ( The first_name is Jhon )\n\nthen 3 answers are right: BCD	1
7	95	1z0-071	Selected Answer: BD	BD checked	1
8	95	1z0-071	null	Why its BD ? explain the reason logically & don't tell me I tested it.\nIn the exam there will be no tool to test anything if something changed so we need to understand the logic please.	1
9	95	1z0-071	Selected Answer: BD	BD is the answer	1
10	95	1z0-071	Selected Answer: BD	Who chose the correct answer?	2
11	95	1z0-071	null	I tried... none works.... anybody can explain even just a bit?	2
12	95	1z0-071	Selected Answer: BD	tested it	1
13	95	1z0-071	null	*Tested in SQL* - BD are correct.	1
14	95	1z0-071	Selected Answer: BD	BD is the correct answer	2
15	95	1z0-071	Selected Answer: BD	BD are correct	2
16	95	1z0-071	null	BD is correct regarding to try in SQL	2
17	95	1z0-071	null	BD are correct	2
18	95	1z0-071	Selected Answer: BD	BD are correct	2
19	95	1z0-071	null	BD correct answers	2
20	95	1z0-071	null	B,D are correct	2
1	96	1z0-071	Selected Answer: BC	From Oracle documentation: You can view all tables with columns marked UNUSED in the data dictionary views USER_UNUSED_COL_TABS, DBA_UNUSED_COL_TABS, and ALL_UNUSED_COL_TABS.\n\nSource: https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/ALTER-TABLE.html	1
2	96	1z0-071	null	C and D	1
3	96	1z0-071	Selected Answer: CE	CE is correct you can see number of unused columns but not their names in the data dictionary	1
4	96	1z0-071	null	B C E are all correct according to Oracle "SET UNUSED Clause"\nhttps://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/ALTER-TABLE.html#GUID-552E7373-BF93-477D-9DA3-B2C9386F2877	2
5	96	1z0-071	Selected Answer: CE	CE ARE CORRECT.	1
6	96	1z0-071	null	All are wrong except E	1
7	96	1z0-071	null	Correct answer B,E	1
7	103	1z0-071	null	C is correct look the question the where condition each time it is executed in a session but only prompts for the table name the first time it is executed.	1
8	103	1z0-071	Selected Answer: D	D is the answer	2
9	103	1z0-071	null	D is the answer	2
1	158	1z0-071	Selected Answer: A	A definitely A it does not ignore NULL values	2
1	97	1z0-071	Selected Answer: BD	A: Incorrect: INITCAP changes the first character of the extracted last name to uppercase and the rest to lowercase. However, this does not work for "MC" because INITCAP would change it to "Mc."\nB:Correct: This extracts the last name and matches it directly against "Mc%" (case-sensitive). This works because "Mc" is explicitly matched.\nD: Correct: UPPER ensures that both the extracted last name and the pattern are converted to uppercase, making the comparison case-insensitive. This matches both "Mc" and "MC."	1
2	97	1z0-071	Selected Answer: AD	AD is correct LIKE is case sensitive	1
3	97	1z0-071	null	AD tested 100% guarantee	1
4	97	1z0-071	Selected Answer: AD	AD ARE CORRECT	1
5	97	1z0-071	Selected Answer: AD	AD is the answer	1
6	97	1z0-071	Selected Answer: AD	A and D are correct, B is wrong.	1
7	97	1z0-071	Selected Answer: AD	B is wrong	1
8	97	1z0-071	Selected Answer: AD	Tried all, AD are correct.\nB is incorrect as it only returns McCain and not MCEwan due to Mc and MC mismatch.	4
9	97	1z0-071	null	B is correct. \nD is incorrect as it will also generate the last name starts with small letter m.	1
10	97	1z0-071	Selected Answer: AD	AD are correct	2
11	97	1z0-071	null	AD are correct	1
12	97	1z0-071	null	AD is the correct answer	3
1	98	1z0-071	Selected Answer: B	B for me	1
2	98	1z0-071	Selected Answer: B	Definitely B!	1
3	98	1z0-071	null	B is right solution	2
4	98	1z0-071	Selected Answer: B	B IS CORRECT	1
5	98	1z0-071	Selected Answer: B	B IS CORRECT	3
6	98	1z0-071	null	B IS CORRECT	1
7	98	1z0-071	Selected Answer: B	B is the answer	2
8	98	1z0-071	Selected Answer: B	B is correct	1
9	98	1z0-071	Selected Answer: B	B is correct	2
10	98	1z0-071	Selected Answer: B	B is correct	3
11	98	1z0-071	Selected Answer: B	B is correct	2
12	98	1z0-071	null	B is correct	2
13	98	1z0-071	Selected Answer: B	B for sure	2
14	98	1z0-071	null	Definitely B	2
1	99	1z0-071	Selected Answer: AD	AD is the right answer.	1
2	99	1z0-071	null	Selected Answer: AD \nfor me	1
3	99	1z0-071	Selected Answer: AD	For me	1
4	99	1z0-071	null	AD for sure.	1
5	99	1z0-071	Selected Answer: AD	AD is the correct answer	2
6	99	1z0-071	Selected Answer: AD	AD ARE CORRECT	2
1	100	1z0-071	Selected Answer: B	The correct answer is B which is 6 rows\n\nExplanation:\nThe CROSS JOIN operation combines each row from the first table with each row from the second table. Since the BRICKS table has 4 rows, the result of the CROSS JOIN will have 4 * 4 = 16 rows.\n\nThe WHERE clause filters out rows where b1.weight is not less than b2.weight. This means that only rows where the weight of the first brick is less than the weight of the second brick will be included in the result. There are 6 such combinations: (5,10), (5,15), (5,20), (10,15), (10,20), and (15,20). So the final result will have 6 rows.	8
2	100	1z0-071	Selected Answer: B	B is the correct answer.	1
3	100	1z0-071	Selected Answer: B	Option B is correct	1
4	100	1z0-071	null	checked in DB B is correct	1
5	100	1z0-071	null	Option B is correct	1
6	100	1z0-071	null	return 6 rows\noption B tested	1
7	100	1z0-071	Selected Answer: C	C is correct	1
8	100	1z0-071	Selected Answer: C	I think its 16	1
1	101	1z0-071	Selected Answer: D	Explanation:\nThe given query is using an interval literal with a value of '100' and a unit of 'MONTH'. When using the interval literal syntax, the specified value represents the number of intervals of the given unit.\n\nIn this case, the query is requesting an interval of 100 months. Since there are 12 months in a year, the interval '100' months is equivalent to 8 years and 4 months.\n\nThe output format for intervals in Oracle is '+YY-MM', where YY represents the number of years and MM represents the number of months.\n\nTherefore, the output will be '+08-04', indicating an interval of 8 years and 4 months.\n\nThe correct answer is D. +08-04.	11
2	101	1z0-071	Selected Answer: D	D is the right answer. Interval Year to month.	1
3	101	1z0-071	Selected Answer: D	D is the correct answer	1
4	101	1z0-071	Selected Answer: D	D respuesta revisada y correcta	1
5	101	1z0-071	Selected Answer: D	try\nSELECT INTERVAL '100' MONTH as DURATION FROM DUAL;	1
6	101	1z0-071	Selected Answer: D	D is the answer	1
7	101	1z0-071	Selected Answer: A	In my test, it returned an error, even though I adjusted the quotes.	1
8	101	1z0-071	null	it's gets an error when I try it on https://livesql.oracle.com/apex	2
9	101	1z0-071	Selected Answer: D	beware of alias	1
10	101	1z0-071	null	D is correct	2
1	102	1z0-071	Selected Answer: B	Answer is B	2
2	102	1z0-071	Selected Answer: B	Answer is 200	1
3	102	1z0-071	Selected Answer: B	Respuesta revisada	1
4	102	1z0-071	null	can someone explain why the answer is 200?	2
5	102	1z0-071	null	B is the correct tested	2
6	102	1z0-071	Selected Answer: B	B is correct, run it in SQL Developer	2
7	102	1z0-071	null	I have run it in oracle and the answer is 200.	1
8	102	1z0-071	Selected Answer: A	A is the right one : \nThe ROUND(156.00, -2) function call rounds the number 156.00 to the nearest hundredth, resulting in the value 200.\n\nThe TRUNC(200, -1) function call truncates the number 200 to the nearest ten, resulting in the value 150.\n\nTherefore, the final result of the SQL query is 150.	2
9	102	1z0-071	null	TRUNC does nothing here. The rounding of -2 gives closest order of 100, 156->200. Then 200 is truncated to 200	2
1	103	1z0-071	Selected Answer: D	D is the correct answer	1
2	103	1z0-071	Selected Answer: D	D is the answer	3
3	103	1z0-071	Selected Answer: D	D is the correct answer	2
4	103	1z0-071	Selected Answer: D	D\n&prompts always, && prompts once as it created a session variable	4
5	103	1z0-071	Selected Answer: D	D is the correct answer	2
6	103	1z0-071	Selected Answer: D	D is correct	2
1	117	1z0-071	Selected Answer: ADE	ADE is the right answer.	1
1	104	1z0-071	Selected Answer: ABE	C and F are wrong, oracle documentation says:\nUnlike unusable indexes, an invisible index is maintained during DML statements.\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/admin/managing-indexes.html#GUID-3A66938F-73C6-4173-844E-3938A0DBBB54	2
2	104	1z0-071	Selected Answer: ABE	ABE correct	1
3	104	1z0-071	Selected Answer: ABE	ABE correct	1
4	104	1z0-071	null	BEF for me	1
5	104	1z0-071	Selected Answer: ABE	These are correct	2
6	104	1z0-071	Selected Answer: ABE	invisible indexes are maintained, unusable indexes are not. C and F are wrong	1
7	104	1z0-071	null	F is wrong but C is correct:\nhttps://docs.oracle.com/cd/E18283_01/server.112/e17120/indexes004.htm\nso either ACE or BCE	1
8	104	1z0-071	null	F is wrong. it is not maintained by DML.	2
9	104	1z0-071	null	ABE are correct	2
10	104	1z0-071	null	Answer is ABE.\nF is wrong, unused index is not mentained	3
1	105	1z0-071	null	Answer D, since in GROUP BY clause must used column names instead positioned numbers like here, like GROUP BY deptno - works fine	1
2	105	1z0-071	null	D \nORA-00979: not a GROUP BY expression	1
3	105	1z0-071	null	why D? A is correct	1
1	106	1z0-071	null	https://oracle-base.com/articles/11g/virtual-columns-11gr1	5
2	106	1z0-071	Selected Answer: AE	AE is the right answer.	1
3	106	1z0-071	null	Correct answer is: AB\nA. Virtual columns can be indexed just like regular columns. This is useful when queries frequently filter or sort data based on the virtual column, as indexing improves performance.\n\nB. Virtual columns can be used in the expression of another virtual column. This allows for more complex derived data to be generated from other columns, including other virtual columns.	1
4	106	1z0-071	null	E is false. Although virtual columns can be used in a WHERE clause of queries to filter data, they cannot be used in the WHERE clause of an UPDATE or DELETE statement because these statements modify data, and virtual columns are not physically stored.	1
5	106	1z0-071	Selected Answer: AE	AE They can be indexed and used in where clause of UPDATE and DELETE statements	1
6	106	1z0-071	Selected Answer: AE	more details about virtual columns: https://www.gpsos.es/2021/03/virtual-columns-in-oracle-use-and-limitations/?lang=en	3
1	107	1z0-071	Selected Answer: BD	BD is right answer due to internal nls date format and explicit format parameter.	1
2	107	1z0-071	Selected Answer: BD	Answers are: B & D.	1
3	107	1z0-071	null	BD Works	1
4	107	1z0-071	null	BD IS CORRECT	1
5	107	1z0-071	null	B wouldnt work right bc it doesnt match the nls_parameter thing?.\nD works tho	2
1	108	1z0-071	Selected Answer: AE	AE is the correct answer	1
2	108	1z0-071	Selected Answer: AE	AE is correct	1
3	108	1z0-071	Selected Answer: AE	A. The DELETE statement executes successfully even if the subquery selects multiple rows. This is because the EXISTS condition only checks for the existence of at least one row in the subquery, regardless of how many rows are returned.\n\nE. The subquery is executed for every row in the EMPLOYEES table. This is because the subquery is a correlated subquery, which means that it references a column from the outer query (e.employee_id). As a result, the subquery must be executed once for each row in the EMPLOYEES table to determine whether the EXISTS condition is true or false for that row.	2
4	108	1z0-071	null	A,D.\nSubquery isn't query before outer query.	1
5	108	1z0-071	null	AB are correct.	1
6	108	1z0-071	null	Why is B wrong?	2
1	109	1z0-071	null	i think BCE are correct	17
2	109	1z0-071	null	As per the rule Primary and Composite Key can not contain Null value Then why  B option is right\nI think A is right	1
3	109	1z0-071	null	but how did we know that the manager is referencing the empno column ?!	3
4	109	1z0-071	null	BCE is Correct \n\nA. The SALARY column must have a value.  .............FALSE\nB. The DEPTNO column in the EMP table can contain NULLS..........TRUE\nC. The COMMISION column can contain negative values. ....TRUE\nD. The DEPTNO column in the EMP table can contain the value 1...... TRUE WITH CONDITION. (If dept table primary key has 1 values)\nE. The MANAGER column is a foreign key referencing the EMPNO column........ TRUE\nF. The DNAME column has a unique constraint. FALSE\nG. An index is created automatically in the MANAGER column....FALSE	2
5	109	1z0-071	Selected Answer: CDE	I think B is wrong : The DEPTNO column in the EMP table can contain NULLS no because it refers to a PK so not possible.	2
6	109	1z0-071	Selected Answer: BCE	BCE, D is wrong because DEP_NO has a constraint in the department table that prevents it from having a value less than 10, very tricky, those who answered D might get surprises after the exam.	1
7	109	1z0-071	null	BDE Is correct but why is C wrong?	1
8	109	1z0-071	Selected Answer: BCE	BCE is correct	1
9	109	1z0-071	Selected Answer: BCE	BCE are correct.\nD is wrong because DEPTNO in EMP table is referencign DEPTNO in DEPT and there is check constraint which demands DEPTNO in DEPT to be greater than 9	1
10	109	1z0-071	Selected Answer: BDE	BDE is the correct answer	1
11	109	1z0-071	null	why E ?	1
12	109	1z0-071	null	BCE - is the answer	1
13	109	1z0-071	Selected Answer: CE	deptno is a pk so cannot be null	1
14	109	1z0-071	Selected Answer: BCE	BCE seems correct	1
15	109	1z0-071	Selected Answer: CDE	CDE seems to be right option	1
1	110	1z0-071	Selected Answer: BC	BC is right answer.	1
2	110	1z0-071	Selected Answer: BC	BC is correct	1
3	110	1z0-071	Selected Answer: BC	Should be BC	1
4	110	1z0-071	Selected Answer: BC	BC cuz google says:\n'System privileges allow a user to perform a particular database operation or class of database operations. For example, to create a table, the user needs the create table privilege.'\n'Objects have privileges associated with them, such as insert, update and delete a table.'	1
5	110	1z0-071	Selected Answer: BC	To create a relational table in your own schema, you must have the CREATE TABLE system privilege. To create a table in another user's schema, you must have the CREATE ANY TABLE system privilege.\nA) is wrong because external table creates a file only if it's created with 'CREATE AS SELECT' statement	3
2	117	1z0-071	Selected Answer: ADE	ADE is the correct answer	3
6	110	1z0-071	Selected Answer: AC	Should be AC since CREATE TABLE does not require system privilege just object privilege. CREATE ANY TABLE require system privilege	1
1	111	1z0-071	Selected Answer: A	A is the right answer.	1
2	111	1z0-071	Selected Answer: D	I'd give it D	1
3	111	1z0-071	null	Tested on Oracle live sql.\nA is correct query for the output\nB comm nulls are at the top - wrong\nC Turmer, Allen, Ward, Martin at the bottom - wrong\nD Only Turner at the bottom - wrong	1
4	111	1z0-071	Selected Answer: A	A for me	1
5	111	1z0-071	null	D is not correct, because Turner is last in the table. A is correct answer	3
6	111	1z0-071	null	D also correct answer,, Tested and its giving expected output	3
1	112	1z0-071	Selected Answer: F	F -for sure\nC - is second closest if it was customer_name LIKE 'Ma%' but not when it is 'Ma*' as shown	1
2	112	1z0-071	Selected Answer: EF	EF is correct	1
3	112	1z0-071	Selected Answer: EF	EF since like is case sensitive	1
4	112	1z0-071	null	EF is correct	2
5	112	1z0-071	null	EF are correct	1
6	112	1z0-071	Selected Answer: EF	D is false - it will return all names (checked with SQL Developer)	2
7	112	1z0-071	null	D and F, %a% will return all names with letter a	1
8	112	1z0-071	null	EF is correct	4
1	113	1z0-071	Selected Answer: BD	BD is correct	1
2	113	1z0-071	Selected Answer: BD	BD is the correct answer	1
3	113	1z0-071	null	Not sure why D is correct.  Could someone explain please.  Thanks	1
1	114	1z0-071	Selected Answer: CE	CE is right answer.	1
2	114	1z0-071	Selected Answer: CE	C and E are the most accurate	2
3	114	1z0-071	Selected Answer: CE	C and E.\n\n\nhttps://docs.oracle.com/cd/B28359_01/server.111/b28318/schema.htm#CNCPT111\nA schema is a collection of logical structures of data, or schema objects. A schema is owned by a database user and has the same name as that user. Each user owns a single schema. Schema objects can be created and manipulated with SQL and include the following types of objects:	1
4	114	1z0-071	Selected Answer: CD	Answer should be C and D.\n\nC is ACID which Oracle SQL always do\n\nhttps://docs.oracle.com/cd/B13789_01/server.101/b10759/statements_8003.htm\n\nCREATE USER my_user IDENTIFIED BY my_password DEFAULT TABLESPACE tbspace1 QUOTA UNLIMITED ON tbspace1;\n\nGRANT schema1, schema2 TO my_user;	1
1	115	1z0-071	Selected Answer: B	B is right answer.	1
2	115	1z0-071	Selected Answer: B	B is correct	1
3	115	1z0-071	Selected Answer: B	Answer is B \n\nORA-02266: unique/primary keys in table referenced by enabled foreign keys	1
4	115	1z0-071	Selected Answer: B	So answer should be B	1
5	115	1z0-071	null	The answer is B\nHere is explanation : In this option it does not mean you can never truncate a table \nit says if foreign key activated and would be violated you can NEVER. The keyword is IF <<<<	1
6	115	1z0-071	Selected Answer: C	C CAN work if we have CASCADE, B is wrong cuz it says NEVER, the documentation states:\n'You cannot truncate the parent table of an enabled foreign key constraint. You must disable the constraint before truncating the table. An exception is that you can truncate the table if the integrity constraint is self-referential.'	1
7	115	1z0-071	Selected Answer: C	C is correct since you can delete using cascade option \nB is incorrect since it says never but you can by disable the constraint	3
8	115	1z0-071	Selected Answer: B	B is correct. Truncate is faster than delete	1
9	115	1z0-071	null	Very confusing.  It seems truncate is always faster than delete.  And for B and C, B is false if you use cascade in the command and constraint was created with on delete cascade.  Similarly with C, if constraint was created with on delete cascade then you can delete those rows.	1
10	115	1z0-071	Selected Answer: B	You cannot truncate the parent table of an enabled foreign key constraint. You must disable the constraint before truncating the table.\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/TRUNCATE-TABLE.html	1
11	115	1z0-071	Selected Answer: B	B is correct	2
12	115	1z0-071	null	C is correct,\nWe can trucate table contains referential integrity, one by drop the constraint/ while adding constraint we can include on delete cascade . Truncate table colors cascade; this statement will run successfully.\n\nReference https://www.examtopics.com/discussions/oracle/view/15064-exam-1z0-071-topic-1-question-268-discussion/	2
13	115	1z0-071	null	This needs to be updated!	1
14	115	1z0-071	null	Option B is true. When using the TRUNCATE statement, if there are foreign key constraints referencing the table to be truncated, you will not be able to truncate the table. Truncating a table removes all the data in the table, and if there are dependent foreign key constraints, truncating the table would violate those constraints. In such cases, you would need to either disable or drop the foreign key constraints before truncating the table.	1
15	115	1z0-071	null	B -You cannot truncate the parent table of an enabled foreign key constraint. You must disable the constraint before truncating the table. An exception is that you can truncate the table if the integrity constraint is self-referential.	1
16	115	1z0-071	null	C.\nA and D: False --> Truncate is better and has better performance than delete and Drop except for very small tables.\nB False --> You can truncate a table with a FK on Cascade.  You can disable FK and then Truncate (except if FK is self-refential).	4
17	115	1z0-071	Selected Answer: B	D is wrong . B is correct \nhttps://docs.oracle.com/database/121/SQLRF/statements_10007.htm#SQLRF01707	2
18	115	1z0-071	Selected Answer: B	I think B is correct (but not sure 100%)	1
19	115	1z0-071	null	i think C is correct if the referential integrity constraint has the ON DELETE CASCADE option	3
20	115	1z0-071	null	I believe D should read for large tables, Truncate is faster than delete	2
1	116	1z0-071	Selected Answer: DE	DE is right answer.	1
2	116	1z0-071	Selected Answer: DE	DE \nCase is a statement DECODE is a function	2
3	116	1z0-071	null	DE are correct.\nCASE is a expression not a function.\nhttps://docs.oracle.com/cd/B13789_01/appdev.101/b10807/13_elems004.htm#:~:text=The%20CASE%20statement%20evaluates%20a,first%20one%20that%20is%20TRUE%20.	1
4	116	1z0-071	null	case is statement while decode is a function	2
5	116	1z0-071	Selected Answer: DE	DE are correct	3
6	116	1z0-071	null	DE are correct	1
7	116	1z0-071	null	Should be DE ?	2
1	118	1z0-071	Selected Answer: AB	D is not correct because it will prompt the user once, and only once for all queries, not once for every query.	1
2	118	1z0-071	null	D too\nselect &&a, &&a from dual;\nselect &&a from dual;	2
3	118	1z0-071	Selected Answer: AB	AB is correct\nhttps://docs.oracle.com/en/database/oracle/oracle-database/21/sqpug/using-substitution-variables-sqlplus.html#GUID-0BEEC1D7-876B-495C-9327-17037652D3D2	1
4	118	1z0-071	null	A.B correct.\n\nreference for B\nIf a single ampersand prefix is used with an undefined variable, the value you enter at the prompt is not stored. Immediately after the value is substituted in the statement the variable is discarded and remains undefined. If the variable is referenced twice, even in the same statement, then you are prompted twice.	1
1	119	1z0-071	Selected Answer: A	A is right answer.	1
2	119	1z0-071	null	A Correct \n\nselect department_id, listagg(last_name, ',') within group (order by last_name) from employees group by department_id;	1
3	119	1z0-071	null	B, C, D will throw error. \nA is the only correct option	1
4	119	1z0-071	Selected Answer: A	tried it in sql developer	1
1	120	1z0-071	null	Checked: A, B\n\nCheck:\nCREATE TABLE COLORS_120\n(\n    RGB_HEX_VALUE   VARCHAR2(100)\n,   COLOR_NAME      VARCHAR2(100)\n);\n\n\n\nCREATE TABLE BRIKS_120\n(\n    BRICK_ID    NUMBER\n,   COLOR_RGB_HEX_VALUE     VARCHAR2(100)\n);\n\n\nINSERT INTO COLORS_120\nSELECT 'FF0000','red' FROM DUAL\nUNION ALL\nSELECT '00FF00','green' FROM DUAL\nUNION ALL\nSELECT '0000FF','blue' FROM DUAL;\n\n\nINSERT INTO BRIKS_120\nSELECT 1,'FF0000' FROM DUAL\nUNION ALL\nSELECT 2,'00FF00' FROM DUAL\nUNION ALL\nSELECT 3,'FFFFFF' FROM DUAL;\n\n\nA;\nSELECT * \nFROM BRIKS_120 b\nRIGHT JOIN COLORS_120 c\nON b.COLOR_RGB_HEX_VALUE = c.RGB_HEX_VALUE;\n\nB;\nSELECT * \nFROM BRIKS_120 b\nFULL JOIN COLORS_120 c\nON b.COLOR_RGB_HEX_VALUE = c.RGB_HEX_VALUE;\n\nC;\nSELECT * \nFROM  c\nFULL JOIN BRIKS_120 b\nUSING(RGB_HEX_VALUE);\n\nD;\nSELECT * \nFROM COLORS_120 c\nLEFT JOIN BRIKS_120 b\nON b.COLOR_RGB_HEX_VALUE = c.RGB_HEX_VALUE\nWHERE b.brick_id > 0\n;\nE;\nSELECT * \nFROM BRIKS_120 b\nLEFT JOIN COLORS_120 c\nON b.COLOR_RGB_HEX_VALUE = c.RGB_HEX_VALUE;	13
2	120	1z0-071	Selected Answer: AB	AB is right answer.	1
3	120	1z0-071	Selected Answer: AB	A, B is correct. tried.	1
4	120	1z0-071	Selected Answer: BC	tried it . A,B,C correct	1
5	120	1z0-071	Selected Answer: AB	Not possible to use the using clause as the names of the columns are not the same. For me AB is the correct answer.	1
6	120	1z0-071	Selected Answer: AB	AB is the correct answer	1
7	120	1z0-071	null	How can the answer key say DE?  Not even close.	1
8	120	1z0-071	null	A and B are correct.	1
9	120	1z0-071	null	Why D incorrect?	1
10	120	1z0-071	Selected Answer: AB	AB are correct ones	1
11	120	1z0-071	Selected Answer: AB	AB are the answers	2
12	120	1z0-071	Selected Answer: AB	AB are correct	1
13	120	1z0-071	null	AB is correct	1
14	120	1z0-071	Selected Answer: AB	AB ARE THE ANSWERS	4
1	121	1z0-071	Selected Answer: AB	AB is right answer.	1
2	121	1z0-071	Selected Answer: AB	AB is correct	2
3	121	1z0-071	Selected Answer: AB	Checked in Oracle	2
1	122	1z0-071	Selected Answer: A	* LOCALTIMESTAMP returns the local time with the time zone offset included (-05:00 )	1
2	122	1z0-071	Selected Answer: C	C - because Localtimestamp is from the session which we've set to -5	1
3	122	1z0-071	null	Correct Answer is B	1
1	123	1z0-071	null	When I tested this one, BD were true and E returned grant succeeded.  However when I tested to see if those table privileges had actually been granted by E, the recipient had none of those abilities.	2
2	123	1z0-071	null	A, D \nA. User FIN_CLERK can grant SELECT on SCOTT.EMP to user FIN_MANAGER - This is true because user FINANCE has been granted SELECT privilege on SCOTT.EMP with the GRANT OPTION, and user FINANCE subsequently granted SELECT on SCOTT.EMP to user FIN_CLERK. The GRANT OPTION allows the privilege to be further granted to other users.\n\nD. Revoking SELECT on SCOTT.EMP from user FINANCE will also revoke the privilege from user FIN_CLERK - This is true because when a privilege is revoked from a user who was granted the privilege with the GRANT OPTION, and who subsequently granted that privilege to other users, then the privilege is also revoked from the other users.	2
3	123	1z0-071	null	BDE.  B is right, because dropping a user implies to REVOKE all OBJECT PRIVILEGES granted by this user.  Pay attention in the difference between object privileges and system privileges.  System privileges must be revoked directly from user who has them.	3
4	123	1z0-071	Selected Answer: DE	This is from official Oracle course: "If a user leaves the company and you revoke his or her privileges, you must re-grant any privileges that this user granted to other users. If you drop the user account without revoking privileges from it, the system privileges granted by this user to other users are not affected by this action."	2
5	123	1z0-071	null	why E is not correct?	1
1	124	1z0-071	Selected Answer: BE	BE is correct answer.	1
2	124	1z0-071	Selected Answer: AE	B. The owner of an object acquires all object privileges on that object by default.\nis False – The owner does not "acquire" privileges; ownership itself implies full control without needing to grant privileges.	1
3	124	1z0-071	Selected Answer: BE	BE is the correct answer	1
1	125	1z0-071	Selected Answer: BE	BE is the correct answer	1
2	125	1z0-071	null	BE tested	1
3	125	1z0-071	Selected Answer: BE	Tested.\nA. not a GROUP BY expression\nC.D boths are not a single-group group function	1
4	125	1z0-071	Selected Answer: BE	BE tested	1
5	125	1z0-071	null	I think answer B is the only correct answer because In SQL, a group function operates on a set of rows and returns a single value for each group. Group functions include AVG, COUNT, MAX, MIN, and SUM. These functions cannot be nested within one another. For example, in query A, the AVG function is nested within the MAX function which is not allowed. Similarly, in query C, D and E, the MAX function is nested within the AVG function which is also not allowed. \nWhat do you think?	4
6	125	1z0-071	null	C works.	1
1	126	1z0-071	Selected Answer: CE	CE is right answer.	1
2	126	1z0-071	Selected Answer: CE	C and E are correct.	1
1	127	1z0-071	Selected Answer: CD	CD is right answer.	1
2	127	1z0-071	Selected Answer: CD	CD correct	1
3	127	1z0-071	Selected Answer: CD	Between includes the upper and lower bounds	1
1	128	1z0-071	Selected Answer: BC	A. select last_name, salary from employees\nfetch first 3 rows only \norder by salary;\n- results in an error\n---------------------------------------------\nB. select last_name, salary from ( select * from employees order by salary)\nwhere rownum <= 3;\n- works\n-------------------------------------------------------\nc. select last_name, salary from employees\norder by salary\n  fetch first 3 rows only ;\n- works\n----------------------------------------------------------------\nD. select last_name, salary from employees where rownum <= 3 order by salary;\n- returns the first 3 rows and orders the 3 rows based on salary so its incorrect\n-------------------------------------------------------\nE. select last_name, salary from employees where rownum <= 3 order by (select salary from employees);\n- subquery returns more than one row so results in error	5
2	128	1z0-071	null	D is wrong\nafter order  by rownum might not anymore be sequential.	1
3	128	1z0-071	Selected Answer: D	D is the correct answer	1
1	129	1z0-071	Selected Answer: A	union all includes duplicates	2
1	130	1z0-071	Selected Answer: ADE	ADE correct for me	1
2	130	1z0-071	Selected Answer: ADE	Believe ADE	2
3	130	1z0-071	Selected Answer: ADE	ADE are the correct answers	1
4	130	1z0-071	Selected Answer: ADE	ADE are correct:\nA - TRUE; cash values are lost if instance shuts down\nB - FALSE; Transaction can be rolled back if not COMMITed yet, but sequence number was already used and cannot be reused\nC - FALSE; user can create sequence and therefore has all privileges to this object, including DROP\nD - TRUE; CYCLE parameter can be set and values can be looped\nE - TRUE; there is a list of activities that can influence the gaps generation, like failed INSERT or DELETE; COMMIT or INSERT; ROLLBACK etc.\nF - FALSE; from ORACLE documentation "Sequence numbers are generated independently of tables, so the same sequence can be used for one or for multiple tables"	2
5	130	1z0-071	Selected Answer: AEF	The whole idea of SEQUANCE is to provide unique keys so D cannot be correct. \nAbout F - why not?! This is something called in the code. But even as default value, there is no check for unique value accross all tables into the database.	1
6	130	1z0-071	Selected Answer: ADE	ADE are correct	2
7	130	1z0-071	null	ADE ARE CORRECT	1
8	130	1z0-071	Selected Answer: ADE	Correct Answer: ADE	3
1	131	1z0-071	Selected Answer: CD	A. wrong, missing update in when matched clause,\nB. wrong, missing ON clause.\nC. correct\nD. correct	4
2	131	1z0-071	Selected Answer: CD	checked	2
1	132	1z0-071	Selected Answer: BD	BD correct -> Data type has to be the same for NVL but not for NVL2	1
2	132	1z0-071	Selected Answer: BD	BD tested	2
3	132	1z0-071	Selected Answer: BD	NVL2 requires 3 arguments and it doesnt have to be the same data type\nNVL requires 2 arguments and it must be the same datatype or something that is implicitly  converted	2
1	133	1z0-071	null	D is the correct answer, but what is the correct answer in a real exam?	2
2	133	1z0-071	Selected Answer: D	D is the correct answer	2
3	133	1z0-071	null	D is correct.	1
4	133	1z0-071	null	D \nORA-01402: view WITH CHECK OPTION where-clause violation	2
5	133	1z0-071	Selected Answer: D	D is correct. B won't delete anything..	1
6	133	1z0-071	Selected Answer: D	D is the correct\n\nhttps://www.oracletutorial.com/oracle-view/oracle-with-check-option/	3
7	133	1z0-071	Selected Answer: D	D is correct	3
8	133	1z0-071	null	D is   correct	2
9	133	1z0-071	Selected Answer: D	D is the correct answer	3
10	133	1z0-071	null	i vote for D	4
1	134	1z0-071	Selected Answer: CD	The answers are correct.	1
1	135	1z0-071	null	Correct answers are B , D and F \nsee : https://dbaclass.com/article/ora-12984-cannot-drop-partitioning-column/#google_vignette	1
2	135	1z0-071	Selected Answer: BDF	Correct answers	2
1	136	1z0-071	Selected Answer: CEF	CEF is right answer.	1
2	136	1z0-071	Selected Answer: ACF	E. Is incorrect. Data pumps doesn't focus on DML.	1
3	136	1z0-071	null	E can't be the correct answer?!	1
4	136	1z0-071	Selected Answer: CEF	https://www.examtopics.com/discussions/oracle/view/20181-exam-1z0-071-topic-2-question-45-discussion/	1
1	137	1z0-071	Selected Answer: C	A. Aggregate functions can be nested to any number of levels. -> Can be nested upto one level only.\nB. The AVG function implicitly converts NULLS to zero. -> AVG function ignores NULLS.\nC. The MAX and MIN functions can be used on columns with character data types. -> True\nD. Aggregate functions can be used in any clause of a SELECT statement. -> It can't be used with where clause.	3
2	137	1z0-071	Selected Answer: C	tested on a sample data	3
1	138	1z0-071	Selected Answer: ACF	A C F are correct	1
2	138	1z0-071	Selected Answer: AEF	AEF Correct	1
3	138	1z0-071	Selected Answer: ABF	A, F we all agree:\nB because when remote database is accessible via a database link, multitable INSERTS are widely used.	1
4	138	1z0-071	Selected Answer: AEF	AEF correct	1
5	138	1z0-071	Selected Answer: ACF	A. Multitable INSERT statements can insert each computed row into more than one table. This is achieved by specifying multiple INTO clauses in the INSERT statement, each corresponding to a different table. Here's an example:\nINSERT ALL INTO table1 (column1, column2) VALUES (value1, value2) INTO table2 (column3, column4) VALUES (value3, value4) SELECT * FROM source_table;\nIn this example, the computed rows from the source_table are inserted into both table1 and table2.\nC. Multitable INSERT statements can be performed on external tables using SQL*Loader. External tables allow you to access data in external files as if it were in a regular database table. Here's an example:\nINSERT ALL INTO table1 (column1, column2) VALUES (value1, value2) INTO table2 (column3, column4) VALUES (value3, value4) SELECT * FROM external_table;\nIn this example, the data from the external_table is inserted into both table1 and table2.\nF. Multitable INSERT statements can be performed on relational tables. Relational tables	1
6	138	1z0-071	null	ACG is TRUE.	1
7	138	1z0-071	Selected Answer: AEF	https://www.examtopics.com/discussions/oracle/view/9427-exam-1z0-071-topic-1-question-236-discussion/	1
1	139	1z0-071	null	Answers are B, E, F.	1
2	139	1z0-071	null	EF are correct. I tried	1
3	139	1z0-071	null	C is not correct. if no row is returned, it will not throw an error. DEF is ok	2
4	139	1z0-071	null	CDF is correct.	1
1	140	1z0-071	Selected Answer: EF	E and F are correct, tested both and they show 4 digits year. B is incorrect because is missing the single quotes in TO_CHAR(SYSDATE, MM/DD/YYYY)	1
2	140	1z0-071	Selected Answer: EF	E and F are the correct answers: tested and confirmed:\nSELECT TO_DATE(TO_CHAR(SYSDATE, 'MM/DD/YYYY'), 'MM/DD/YYYY') FROM DUAL;\nSELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6), 'dd-mon-yyyy') FROM DUAL;	2
3	140	1z0-071	null	B is not correct, because the date format 'MM/DD/YYYY' should be enclosed in single quotes, otherwise it's a syntax error.	3
4	140	1z0-071	null	B and E tested	1
5	140	1z0-071	null	E & B will show year forma in 4 digits only if you consider B has no typing error..the string has to be quoted. SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY') FROM DUAL; \nIn answer it is written MM/DD/YYYY without quotes.	1
6	140	1z0-071	null	D have no fm so best is E F	1
7	140	1z0-071	Selected Answer: EF	Why F is not correct in my editor it gives a result ? I think the answer is (BEF)	1
8	140	1z0-071	Selected Answer: BE	B & E is correct answer. Tested.	1
9	140	1z0-071	Selected Answer: BE	BE is correct	1
10	140	1z0-071	Selected Answer: BE	Just need quotes around format string in B	2
11	140	1z0-071	null	B\nonly if you correct it SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY') FROM DUAL;\nand E	1
12	140	1z0-071	null	B and e	1
13	140	1z0-071	null	sorry i am kind of confused...why do they have to be converted to character?	1
14	140	1z0-071	null	Weird.\nImported all in to Oracle apex and got the following results:\nSELECT TO_DATE(SYSDATE, 'RRRR-MM-DD') FROM DUAL;    ---- \tORA-01843: not a valid month\n\nSELECT TO_CHAR(SYSDATE, MM/DD/YYYY) FROM DUAL;   ----- Error at line 1/31: ORA-00904: "YYYY": invalid identifier. This answer is missing single quotes  around the format, otherwise it would be correct.\n\nSELECT TO_DATE(ADD_MONTHS(SYSDATE, 6), 'dd-mon-yyyy') FROM DUAL;   ------  ORA-01843: not a valid month\n\nSELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6)) FROM DUAL;    ------ 09/15/2023 and thus is correct.  \nSELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6), 'dd-mon-yyyy') FROM DUAL;  ------ 15-sep-2023 and thus is also correct.\n\nSELECT TO_DATE(TO_CHAR(SYSDATE, 'MM/DD/YYYY'), 'MM/DD/YYYY') FROM DUAL; ------- 03/15/2023 and thus is also correct?|\n\nThis question is just a mess...	1
15	140	1z0-071	Selected Answer: BE	BE is correct	1
16	140	1z0-071	Selected Answer: BE	BE is correct	3
17	140	1z0-071	null	BE is correct	3
18	140	1z0-071	null	Checked it should be B and E	4
1	141	1z0-071	Selected Answer: AD	AD is correct	1
2	141	1z0-071	Selected Answer: AE	The answers are A and E.\nD is incorrect. If you place a savepoint at the beginning of a transaction and rollback to it, it undoes the entire transaction after the savepoint.	1
3	141	1z0-071	null	C is not correct, because you can only commit the entire transaction, not portions of it based on savepoints. Savepoints allow you to roll back to a specific point, but not selectively commit changes between two points.	1
4	141	1z0-071	Selected Answer: AD	AD is correct	1
5	141	1z0-071	null	AD is correct	1
6	141	1z0-071	Selected Answer: AB	AB should be the correct answer	1
7	141	1z0-071	Selected Answer: AD	https://www.examtopics.com/discussions/oracle/view/20279-exam-1z0-071-topic-2-question-52-discussion/	1
1	142	1z0-071	Selected Answer: ABF	ABF is the correct answer	1
2	142	1z0-071	Selected Answer: ABF	100% ABF	2
3	142	1z0-071	null	ABF is correct	1
4	142	1z0-071	Selected Answer: ABF	ABF is correct	1
5	142	1z0-071	Selected Answer: ABF	ABF is correct	1
6	142	1z0-071	Selected Answer: ABF	ABF is the answer	2
1	143	1z0-071	Selected Answer: AE	E. when the typo '.' is replaced with a comma ','	1
2	143	1z0-071	Selected Answer: AE	in E there is a mistake and should be "," instead of ".", the E should be correct answer.	1
3	143	1z0-071	Selected Answer: AE	Answers are: A & E - both tested.	1
4	143	1z0-071	null	A & D is correct. \nbelow works\nselect * from emp WHERE hire_date > To_Char(ADD_MONTHS(SYSDATE, 6), 'dd mm yyyy');	2
5	143	1z0-071	null	E is wrong. the string in quotes seems like a date after = but DB will only consider it as a string, not a date.	1
6	143	1z0-071	Selected Answer: AE	I thin AE is correct	1
7	143	1z0-071	Selected Answer: AE	AE correct	1
8	143	1z0-071	Selected Answer: AE	Only A works. Assuming that in E there is a mistake and should be "," instead of ".", the E should be correct answer.	1
9	143	1z0-071	Selected Answer: AE	checked	2
1	144	1z0-071	Selected Answer: B	B is correct , return 0 row	1
2	144	1z0-071	null	still it will return 1 row . checked. OPTION C	1
3	144	1z0-071	Selected Answer: B	As the condition is always false -> no row.	1
4	144	1z0-071	Selected Answer: B	Where condition is not correct	1
5	144	1z0-071	Selected Answer: B	No row is returned check in Oracle	1
6	144	1z0-071	Selected Answer: B	The where condition is never valid, so no rows.	1
7	144	1z0-071	null	Checked, B is correct.	2
8	144	1z0-071	Selected Answer: B	B is correct	2
9	144	1z0-071	Selected Answer: B	B is the correct answer	3
1	145	1z0-071	Selected Answer: CD	Update, insert, references can be set on column lvl	3
2	145	1z0-071	Selected Answer: CD	https://www.examtopics.com/discussions/oracle/view/20185-exam-1z0-071-topic-2-question-48-discussion/	1
1	146	1z0-071	null	I executed commands, correct are CE.	1
2	146	1z0-071	null	B&D can be eliminated straight away by looking at the ORDER BY AESC because the question states that the highest date should be first which means DESC should be used with the column PURCHASE_DATE\n\nRule out A because of syntax error in OR operator usage \n\nC & D is correct	1
3	146	1z0-071	Selected Answer: CE	CE is correct	2
4	146	1z0-071	Selected Answer: CE	A gives error because of > 1000	1
5	146	1z0-071	null	CE is correct A have incorrect syntax	2
6	146	1z0-071	null	CE is correct.\nA - where condition should have 'price' as well for 1000\nB - where condition 'between 500 and 1000' does not satisfy what is asked; 'order by' clause's default is ascending\nD - where condition 'price IN (500,1000)' and order by ASC is wrong	2
2	158	1z0-071	Selected Answer: A	INTERSECT DOES NOT IGNORE NULLS	1
7	146	1z0-071	Selected Answer: CE	Price needs to be repeated after the OR statement, so C,E correct. A results in error	1
8	146	1z0-071	Selected Answer: CE	A results in an error and to get the most recent you need to order by desc	1
9	146	1z0-071	Selected Answer: CE	A is not valid .\nCE is the correct	2
1	147	1z0-071	Selected Answer: ABF	ABF is correct based on this erd : https://www.examtopics.com/assets/media/exam-media/02818/0021800001.jpg	1
2	147	1z0-071	null	ERD MISSING	1
3	147	1z0-071	null	https://www.examtopics.com/assets/media/exam-media/02818/0021800001.jpg	1
4	147	1z0-071	Selected Answer: ABF	See answer below. ERD is missing	2
5	147	1z0-071	Selected Answer: ABF	ERD is missing \nCheck https://www.examtopics.com/discussions/oracle/view/9455-exam-1z0-071-topic-1-question-249-discussion/https://www.examtopics.com/discussions/oracle/view/9455-exam-1z0-071-topic-1-question-249-discussion/	1
1	148	1z0-071	null	DEF correct,\nNull is sorted last in ascending and first in descending by default	2
2	148	1z0-071	Selected Answer: DEF	The three statements that are true about an ORDER BY clause are:\n\nD. By default, an ORDER BY clause sorts rows in ascending order. E. An ORDER BY clause can perform a binary sort. F. An ORDER BY clause can perform a linguistic sort.\n\nAn ORDER BY clause is used to sort the rows returned by a query in a specified order. By default, if no sort order is specified, the rows are sorted in ascending order.\n\nAn ORDER BY clause can perform different types of sorts, including binary and linguistic sorts. A binary sort sorts the data based on the binary representation of the values being sorted. A linguistic sort sorts the data based on a specific linguistic definition, taking into account language-specific rules for character and string comparison.	2
3	148	1z0-071	Selected Answer: DEF	Shouldn't it be DEF?\nA - FALSE; by default sorting is ASC\nB - FALSE; In both syntax and execution ORDER BY is always after HAVING\nC - FALSE; NULLS FIRST can be used to sort NULL values first\nD - TRUE; \nE, F - TRUE; parameter NLS_SORT can be changed between BINARY and linguistic_definition.\nhttps://docs.oracle.com/database/121/REFRN/GUID-04243CDA-43CA-4AF8-B59D-6FB841B307BE.htm#REFRN10127	4
1	149	1z0-071	Selected Answer: ABC	ninguna, la pregunta es  GREATER THAN 20000, y todas son  >=	1
2	149	1z0-071	Selected Answer: ABF	ABF is the correct answer	2
3	149	1z0-071	Selected Answer: ABF	ABF is the correct answer	3
1	150	1z0-071	Selected Answer: AE	both SYSDATE AND HIRE_DATE AR OF TYPE date, SO SUBTRACTING IS VALID. rest are invalid.	1
2	150	1z0-071	Selected Answer: DE	missing 5 in the D query, otherwise these 2 are correct, CURRENT_DATE - hire_date and SYSDATE- hire_date return both results in days so we have to divide by 365	1
3	150	1z0-071	null	Eliminate ABC because of fact /12 .. in order to get year it should be /365.	1
4	150	1z0-071	Selected Answer: DE	DE should be the correct answer	1
5	150	1z0-071	null	CE tested\n\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (SYSDATE - hire_date) / 12 > 5;\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (SYSTIMESTAMP - hire_date) / 12 > INTERVAL '5' YEAR;\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (CURRENT_DATE - hire_date) / 12 > 5;\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (CURRENT_DATE - hire_date) / 365 >\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (SYSDATE - hire_date) / 365 > 5;\nSELECT FIRST_NAME, hire_date FROM hr.employees WHERE (SYSTIMESTAMP - hire_date) / 365 > INTERVAL '1825' DAY;	1
6	150	1z0-071	Selected Answer: DE	DE is correct (even though D seems to be with typo). \nF is not correct as default precision of DAY is 2 - should be INTERVAL '1845' DAY(4)	4
7	150	1z0-071	Selected Answer: EF	I think EF.\nD is with typo?	1
8	150	1z0-071	null	I think EF.\nD is with typo?	2
9	150	1z0-071	Selected Answer: DE	DE is correct	4
1	151	1z0-071	Selected Answer: CD	CD is the correct answer	2
2	151	1z0-071	Selected Answer: CD	100% C and D	2
3	151	1z0-071	null	CD are correct	1
4	151	1z0-071	Selected Answer: CD	C D are correct	1
5	151	1z0-071	Selected Answer: CD	CD is correct, checked in SQL Dev.	1
6	151	1z0-071	Selected Answer: CD	A - ORA-00904 ERROR.\nB - ORA-00923 ERROR.\nC - Hello! We're ready\nD - Hello! We're ready\nE - ORA-00923\n\nSo correct: CD. I'm not sure what kind of Oracle Compiling tools use the people from other comments, but these are definitely the correct answers using Oracle Developer...	3
7	151	1z0-071	null	DE is correct answer	1
1	152	1z0-071	Selected Answer: ADF	I do believe B is also right, as the command shows the PRIMARY KEY constraint too	1
2	152	1z0-071	null	ADF is correct	1
3	152	1z0-071	Selected Answer: ADF	Update this please	2
4	152	1z0-071	null	ADF tested	2
5	152	1z0-071	Selected Answer: ADF	ADF are right ones	1
6	152	1z0-071	Selected Answer: ADF	I think ADF	1
7	152	1z0-071	null	A, D, F is right	4
1	153	1z0-071	Selected Answer: AC	E. is so WRONG. look up to believe - referential integrity constraints cannot be defined on views in Oracle.	1
2	153	1z0-071	Selected Answer: CE	CE is the correct answer	1
3	153	1z0-071	Selected Answer: CE	checked. CE is correct	2
4	153	1z0-071	null	Answer is CE\nhttps://www.examtopics.com/discussions/oracle/view/22610-exam-1z0-071-topic-2-question-68-discussion/	1
1	154	1z0-071	Selected Answer: CE	CE are correct	1
2	154	1z0-071	null	Just finished the exam, the other two answers are supposed to say matched, not watched.	2
3	154	1z0-071	Selected Answer: CE	CE are correct	1
4	154	1z0-071	Selected Answer: CE	CE are correct	1
5	154	1z0-071	Selected Answer: CE	CE are correct	1
6	154	1z0-071	Selected Answer: CE	I suggest C,E\nhttps://docs.oracle.com/database/121/SQLRF/statements_9017.htm#SQLRF01606	3
1	155	1z0-071	Selected Answer: CE	D & E are correct.	1
2	155	1z0-071	null	The answer is DE.	1
1	156	1z0-071	Selected Answer: CD	C. The EXPIRY_DATE column data type can be changed to TIMESTAMP.\n\nThis is true. In Oracle, you can modify the data type of a DATE column to a TIMESTAMP data type using the ALTER TABLE statement, as long as there are no incompatible data types involved.\nD. The PROD_ID column can be renamed.\n\nThis is true. Oracle allows you to rename columns in a table using the ALTER TABLE statement with the RENAME COLUMN clause.	1
3	158	1z0-071	Selected Answer: A	tested in sql dev	2
2	156	1z0-071	null	ORA-01439: column to be modified must be empty to change datatype\nD is ok cos the same group of datatype	2
3	156	1z0-071	null	All are true for empty table\nCREATE TABLE K (ID NUMBER(2) NOT NULL,NAME VARCHAR2(20),EXPIRY_dATE DATE NOT NULL)\n\nALTER TABLE K MODIFY NAME DEFAULT 'TEST'\nALTER TABLE K MODIFY EXPIRY_dATE TIMESTAMP\nALTER TABLE K RENAME COLUMN ID TO PROD_ID\nALTER TABLE K MODIFY PROD_ID VARCHAR2(2)	1
4	156	1z0-071	Selected Answer: CD	100% C AND D\nHAVE A TRY:\nCREATE TABLE PRODUCTS_156 \n    (\n    PROD_ID NUMBER(2) NOT NULL, \n    PROD_NAME VARCHAR2(20), \n    EXPIRY_DATE DATE\n    );\nINSERT INTO PRODUCTS_156\nVALUES (1, 'Product 1', TO_DATE('2023-12-31', 'YYYY-MM-DD'));\nALTER TABLE PRODUCTS_156 MODIFY EXPIRY_DATE TIMESTAMP;\nalter table products_156 rename column prod_id to product_id;\nalter table products_156 modify product_id varchar(2); \n(CHANGE DATA TYPE NOT ALLOWED WITH EXISTING DATA IN THE TABLE).	2
5	156	1z0-071	Selected Answer: CD	CD is correct in that case	1
6	156	1z0-071	Selected Answer: CD	in case of empty table correct will be C,E,D. But in case of existing data in the table correct will be C,D. Impossible to change datatype. System raise an error: "ORA-01439: column to be modified must be empty to change datatype"	3
7	156	1z0-071	null	C works well when i run sql statement.	1
8	156	1z0-071	null	drop table products_156;\nCREATE TABLE PRODUCTS_156 (PROD_ID NUMBER(2) NOT NULL, PROD_NAME VARCHAR2(20), EXPIRY_DATE DATE);\nALTER TABLE PRODUCTS_156 MODIFY EXPIRY_DATE TIMESTAMP; /*C OK*/\nalter table products_156 modify prod_id varchar(2);  /*E OK*/\nalter table products_156 rename column prod_id to product_id; /*D OK*/\ndesc products_156;\nNombre      ¿Nulo?   Tipo         \n----------- -------- ------------ \nPRODUCT_ID  NOT NULL VARCHAR2(2)  \nPROD_NAME            VARCHAR2(20) \nEXPIRY_DATE          TIMESTAMP(6)	1
1	157	1z0-071	Selected Answer: A	A. It fails unless the expression is modified to SUBSTR(TO_CHAR(SYSDATE), 1, 5).\n\nThis statement is correct because the SUBSTR function needs a string as input, and SYSDATE must be converted to a string using TO_CHAR. The correct syntax would be SUBSTR(TO_CHAR(SYSDATE, 'DD-MON-YYYY'), 1, 5) if you wanted to extract the first 5 characters from the formatted date.	1
2	157	1z0-071	Selected Answer: D	D works -> implicit conversion!	2
3	157	1z0-071	Selected Answer: D	D tried it and worked	1
4	157	1z0-071	Selected Answer: D	D, implicit conversion works	2
5	157	1z0-071	Selected Answer: D	Correct answer is D - it executes successfully, my result: 27-02	3
6	157	1z0-071	Selected Answer: D	select sysdate from dual;\n--Result : 2/20/2023 10:32:16 AM\n\nselect substr(sysdate,1,5) as "xxx"\nfrom dual;\n--Result: 20-FE	3
4	158	1z0-071	Selected Answer: A	https://www.examtopics.com/discussions/oracle/view/8224-exam-1z0-071-topic-1-question-239-discussion/	1
5	158	1z0-071	null	A must be correct\n\nselect null as nulltest from dual\nintesect \nselect null as nulltest1 from dual\nit shows one row	1
1	159	1z0-071	Selected Answer: BCE	C because each DML starts a new transaction.	1
2	159	1z0-071	null	The Transaction END with Comitt or DDL The new Transaction starts with INSERT, UPDATE, DEL, MERGE (Not even select TESTED) OR A transaction can be start manually by begin transaction command (which is irrelevent in context of this question).	1
3	159	1z0-071	null	A. after successfully executing a CREATE TABLE statement followed by a CREATE INDEX statement CREATE WILL END THE TRANSACTION BUT AGAIN CREATE INDEX WILL NOT START NEW TRANSACTION. FALSE\nB. after successfully executing a TRUNCATE statement followed by a DML statement. TRUNC WILL END TRANS... AND LET SUPPOSE DML IS NOT SELECT IN THIS CASE SO THIS IS A POSSIBLE TRUE. TRUE\nC. after successfully executing a DML statement following a failed DML statement. DML WILL NOT END TRANSATION AT ALL. FALSE\nD. after successfully executing a CREATE TABLE AS SELECT statement followed by a SELECT FOR UPDATE statement. CREATE IS DDL WHICH IS IMPLICIT COMIT AND SELECT FOR UPDATE IS A START OF NEW TRANSACTION. TRUE\nE. after successfully executing a COMMIT or ROLLBACK followed by a DML statement. SO COMIT END TRANSACTION AND DML CAN POTENTIALLY START NEW TRANSACTION (OTHER THAN SELECT). TRUE\nF. after successfully executing a COMMIT or ROLLBACK followed by a SELECT statement. TRANSACTION ENDS HOWEVER ONLE SELECT, LET SAY SELEC * FROM EMP WILL NOT START A NEW TRANSACTION. FALSE\nTRUE ---- BDE	3
4	159	1z0-071	Selected Answer: BDE	BDE is correct	2
5	159	1z0-071	Selected Answer: BDE	BEST ANSWERS	2
6	159	1z0-071	null	BDE is correct, tested all on DB.\nF is incorrect as SELECT is a limited DML statement which means it can only access data in the database, it cannot manipulate data.	2
7	159	1z0-071	Selected Answer: BDE	I would said BDE because STATUS means that the Transaction must be active so not yet completed	1
8	159	1z0-071	null	I would say BDE	1
9	159	1z0-071	null	I think new transaction can't start in the following case.\nC.after successfully executing a DML statement following a failed DML statement\n\nand \nI didn't find the difference between E and F.Can I get any reference link?	1
1	160	1z0-071	Selected Answer: AD	A and D are correct.	1
1	161	1z0-071	Selected Answer: AE	Answers A & E are correct.	1
1	162	1z0-071	Selected Answer: AD	I think AD is correct	2
2	162	1z0-071	null	Tested twice. AC	1
3	162	1z0-071	Selected Answer: AD	No error for me on D, worked fine.	1
4	162	1z0-071	Selected Answer: AD	A D are correct	2
5	162	1z0-071	Selected Answer: AC	D i am getting an error ORA-01722: invalid number	1
6	162	1z0-071	Selected Answer: AD	A D are correct	2
7	162	1z0-071	null	Not sure about this one - A, B, E compile successfully and got the same results for all of them.\nC is not an implicit conversion, D throws an error 'invalid NUMBER'.	1
8	162	1z0-071	null	AD must be correct.\nC is not an implicit conversion	3
1	163	1z0-071	null	A & B are correct! \nC & E are incorrect because CURRENT_TIMESTAMP reflects the session time zone, not\nDBTIMEZONE	1
2	163	1z0-071	Selected Answer: AB	AB should be the correct answer	2
3	163	1z0-071	Selected Answer: AB	A seems 100%.  B is correct if you consider timestamp as the overarching data type of timestamp with time zone and timestamp with local time zone.  However if D says current_date then I like AD over AB.	2
4	163	1z0-071	Selected Answer: AD	A - Is correct\nD - Should be either CURRENT_TIMESTAMP or CURRENT_DATE	1
1	164	1z0-071	Selected Answer: A	A is correct	1
2	164	1z0-071	null	%  is zero or more char so ...	1
3	164	1z0-071	Selected Answer: A	A is correct	2
4	164	1z0-071	Selected Answer: A	Definitely A	1
5	163	1z0-071	null	select tzname, tz_offset(tzname) from v$timezone_names;\n\nselect tzname, tz_offset(tzname) from v$timezone_names\nwhere tzname = 'America/Anchorage';\n\nalter session set time_zone='America/Anchorage';\n\nselect sessiontimezone, current_timestamp, dbtimezone, systimestamp  from dual;\n\nselect current_time from dual;\n\nA → OK.\nB → NOOK: Returns TIMESTAMP WITH TIME ZONE.\nC → NOOK: No, in the SESSIONTIMEZONE..\nD → CURRENT_TIME doesn’t exist.\nE → NOOK: No, in the SESSIONTIMEZONE.\nF → NOOK.  SYSTIMESTMP returns date based on DBSTIMEZONE.	3
5	164	1z0-071	Selected Answer: A	A is correct.	2
6	164	1z0-071	Selected Answer: A	A is correct	1
7	164	1z0-071	Selected Answer: A	A is correct	1
8	164	1z0-071	Selected Answer: A	A is correct	2
9	164	1z0-071	null	I think A should be correct .\nA. city LIKE ‘D__%’	2
1	165	1z0-071	Selected Answer: BE	BE is correct	2
2	165	1z0-071	Selected Answer: BE	B E are correct	2
3	165	1z0-071	null	B - can SELECT FOR UPDATE be used with DISTINCT? I receive ORA-01786 error when testing	1
1	166	1z0-071	null	fail A -  because in the subquery exist condition referenced to main table but not subquery table. By other words, in the subquery not exist limitation for fetching rows and subquery return more than one row	7
2	166	1z0-071	null	A is not correct, failed with "ORA-01427: single-row subquery returns more than one row"	1
3	166	1z0-071	Selected Answer: A	A -failed with "ORA-01427: single-row subquery returns more than one row"	1
4	166	1z0-071	null	A fails	2
5	166	1z0-071	null	AD Both similar results. A should be preferred	1
6	166	1z0-071	null	Correct Answer is A. Tested.	1
7	166	1z0-071	null	alic_alex, I am sorry but where did you see the EXIST condition in A?	2
8	166	1z0-071	Selected Answer: A	A is correct	1
9	166	1z0-071	Selected Answer: A	is the A \nthe correct A is \nselect count(*)\nfrom hr.employees e\nwhere e.salary < (select a.salary from hr. employees a where a.employee_id=110);	2
10	166	1z0-071	Selected Answer: A	Answer by alic_alex explains it well.	1
11	166	1z0-071	Selected Answer: A	A fails due to the wrong condition in subquery	1
12	166	1z0-071	null	i would say A	1
13	166	1z0-071	Selected Answer: C	A,B,D give the same result. But C is different\nI suggest C	1
1	167	1z0-071	Selected Answer: C	•\tLEFT OUTER JOIN:\no\tReturns all rows from the employees table, regardless of whether there is a matching row in the managers table.\no\tFor employees without a manager, the columns from the managers table will contain NULL.	1
2	167	1z0-071	Selected Answer: C	C is correct. \nThe manager table needs to be fully preserved.	1
1	168	1z0-071	Selected Answer: B	B and E by chatgpt	1
2	168	1z0-071	null	B and E	1
3	168	1z0-071	Selected Answer: B	Should be B,E but won't allow multiple answers to be voted for.	1
4	168	1z0-071	null	BE is correct	1
5	168	1z0-071	Selected Answer: B	BE is correct	2
6	168	1z0-071	null	BE 100%. \nWhy so many answers are incorrectly marked?	1
7	168	1z0-071	Selected Answer: B	B AND E CORRECT	1
8	168	1z0-071	Selected Answer: B	BE is correct	1
9	168	1z0-071	null	BE is correct. A is false, a Foreign Key column can contain Null values.	1
10	168	1z0-071	Selected Answer: B	BE is the correct answer.	2
11	168	1z0-071	Selected Answer: E	AE is good	1
1	169	1z0-071	Selected Answer: BC	B and C. \nB) there is a typo, should be = 0 not - 0. \nC) LOOR(quantity / 10) = TRUNC(quantity / 10) return the same value, indicating quantity is a multiple of 10.	1
2	169	1z0-071	null	D: returns 0 if the Quantity is less than 10, not just some tens.	1
3	169	1z0-071	Selected Answer: BC	B. SELECT * FROM order_items WHERE MOD(quantity, 10) = 0;\n\nThis is correct. The MOD function returns the remainder of a division operation. If MOD(quantity, 10) equals 0, it means that quantity is evenly divisible by 10, i.e., quantity is a multiple of 10.\nC. SELECT * FROM order_items WHERE FLOOR(quantity / 10) = TRUNC(quantity / 10);\n\nThis is correct. FLOOR(quantity / 10) and TRUNC(quantity / 10) will both give the same result when quantity is a multiple of 10, because the division of a multiple of 10 by 10 will always be an integer. This ensures that quantity is a multiple of 10.	1
4	169	1z0-071	Selected Answer: D	D is correct for sure, I think that B has a typo.	1
5	169	1z0-071	null	B has a typo , should be = 0	2
6	169	1z0-071	Selected Answer: BD	BD is correct	2
7	169	1z0-071	Selected Answer: CD	C, D IS CORRECT	1
1	170	1z0-071	Selected Answer: AB	AB is correct	1
2	170	1z0-071	Selected Answer: AC	A: using index clause\nC: once index created, use is automatic with query	1
3	170	1z0-071	Selected Answer: AB	c. No, that statement is not necessarily true. If a query filters on an indexed column, the optimizer will decide whether or not to use the index based on factors such as the selectivity of the filter and the size of the table. In some cases, a full table scan may be more efficient than using an index.	2
4	170	1z0-071	Selected Answer: AB	AB are correct	1
5	170	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/9439-exam-1z0-071-topic-1-question-300-discussion/	1
1	171	1z0-071	null	/*A NOOK*/\nselect date'2019-01-01' + interval '0.5' day from dual;\n\n/*01867. 00000 -  "the interval is invalid"\n*Cause:    The character string you specified is not a valid interval.\n*Action:   Please specify a valid interval.*/\n\n/*B OK*/\nselect date'2019-01-01' + interval '720' MINUTE from dual;\n\n/*C NOOK*/\nselect date'2019-01-01' + interval '11:60' HOUR TO MINUTE from dual;\n\n/*ORA-01851: los minutos deben estar comprendidos entre 0 y 59\n01851. 00000 -  "minutes must be between 0 and 59"*/\n\n/*D NOOK*/\nselect date'2019-01-01' + interval '12:00' HOUR TO SECOND from dual;\n\n/*ORA-01867: el intervalo no es válido\n01867. 00000 -  "the interval is invalid"\n*Cause:    The character string you specified is not a valid interval.*/\n\n/*E OK*/\nselect date'2019-01-01' + interval '0 12' DAY TO HOUR from dual;\n\n/*F OK*/\nselect date'2019-01-01' + interval '12' HOUR from dual;	8
2	171	1z0-071	null	The correct answer is \nBEF	1
3	171	1z0-071	Selected Answer: BEF	BEF is true	1
4	171	1z0-071	Selected Answer: BEF	b e f are true	1
5	171	1z0-071	Selected Answer: BEF	BEF are correct ones	1
6	171	1z0-071	Selected Answer: BEF	BEF are correct	1
1	172	1z0-071	Selected Answer: AD	AD is correct	1
2	172	1z0-071	Selected Answer: AD	AD correct see discussion linked below	1
3	172	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/9425-exam-1z0-071-topic-1-question-230-discussion/	1
1	173	1z0-071	Selected Answer: CE	CE is correct answer	2
2	173	1z0-071	Selected Answer: CE	CE correct\n\nsee the reference below\nhttps://docs.oracle.com/cd/B14117_01/server.101/b10759/queries009.htm	1
3	173	1z0-071	Selected Answer: CE	CE are correct.\nhttps://www.examtopics.com/discussions/oracle/view/14717-exam-1z0-071-topic-1-question-293-discussion/	1
4	173	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/14717-exam-1z0-071-topic-1-question-293-discussion/	1
1	174	1z0-071	Selected Answer: C	You cannot truncate the parent table of an enabled foreign key constraint. You must disable the constraint before truncating the table. An exception is that you can truncate the table if the integrity constraint is self-referential.	1
2	174	1z0-071	Selected Answer: C	Answer is C. The key word is 'if' foreign contstraints will be be violated. Meaning, the TRUNCATE 'will' violate the foreign constraints.	1
3	174	1z0-071	Selected Answer: B	B correct answer should be B	1
4	174	1z0-071	Selected Answer: B	the exception to C is if the constraint is self referential which contradicts the user of 'never' in the statement	1
5	174	1z0-071	Selected Answer: B	https://www.examtopics.com/discussions/oracle/view/15064-exam-1z0-071-topic-1-question-268-discussion/	2
6	174	1z0-071	Selected Answer: B	The correct answer is B\n(Truncate operations drop and re-create the table, which is much faster than deleting rows one by one, particularly for large tables)	1
1	175	1z0-071	Selected Answer: B	TESTED : Correct answer is B\n\nNOCACHE          --> NEXTVAL =2;\nINCREMENT BY 10  --> NEXTVAL =11;\nSTART WITH 11    --> ORA ERROR - CANNOT ALTER SEQUENCE STARTING NUMBER\nMINVALUE 11      --> ORA ERROR - MINVALUE CANNOT BE MADE TO EXCEED THE CURRENT VALUE\nCYCLE 11         --> ORA ERROR - SQL COMMAND NOT PROPERLY ENDED	1
2	175	1z0-071	Selected Answer: B	I think B is correct	2
3	175	1z0-071	null	Tested twice. B	1
4	175	1z0-071	Selected Answer: B	Tested.	2
5	175	1z0-071	null	I creating sequence - create sequence customer_seq cache 10;\nWhat I get from alter sequence customer_seq:\nA. NOCACHE – NEXTVAL 1\nB. INCREMENT BY 10 - NEXTVAL 10.\nC. START WITH 11 - ORA-02283: cannot alter starting sequence number \nD. MINVALUE 11 - ORA-04007: MINVALUE cannot be made to exceed the current value \nE. CYCLE 11 - ORA-00933: SQL command not properly ended	2
6	175	1z0-071	Selected Answer: C	CORRECT C, FALSE B	1
1	176	1z0-071	Selected Answer: AC	AC is the answer checked	1
2	176	1z0-071	Selected Answer: AC	AC is correct	1
1	177	1z0-071	Selected Answer: D	PROMPT Enter table name &&x -\n\nThe && (double ampersand) ensures that the value for the variable x is stored in the session after it is entered.\nThe PROMPT statement is used to display a message for the user to input the value.\nSELECT employee_id FROM &x WHERE last_name = 'King';\n\nThe &x (single ampersand) refers to the variable x that was already defined by the && mechanism in the previous step. It does not prompt again because the variable is already stored.	1
2	177	1z0-071	Selected Answer: C	C. PROMPT Enter table name &x -\nSELECT employee_id FROM &&x WHERE last_name = ‘King’;\n\nAn & prefix to an undefined substitution variable, which is referenced twice in the same query, will prompt for a value twice.	1
3	177	1z0-071	Selected Answer: D	C prompted twice, while D prompted only once.	3
4	177	1z0-071	Selected Answer: D	D, && performs an implicit DEFINE while & doesn't\nI thought & always prompts, even if there was && before it, but this question just made me realize this, as all other answers are wrong, including C.	1
5	177	1z0-071	Selected Answer: D	D is correct	1
6	177	1z0-071	Selected Answer: D	Test results:\nA and C: prompted twice\nB: did not prompt\nD: prompted once the first time and then no prompt on rerun\nBest answer: D	1
7	177	1z0-071	Selected Answer: C	C is correct	1
8	177	1z0-071	Selected Answer: C	C is correct	2
9	177	1z0-071	Selected Answer: C	Correct C	1
10	177	1z0-071	Selected Answer: C	C is the right answer tested	2
11	177	1z0-071	Selected Answer: D	D is correct.\nB will never show a prompt window.	1
12	177	1z0-071	null	Tested D.	3
1	178	1z0-071	null	create table customers \n(cust_last_name varchar2(10))\n\nselect * from customers;\n\ninsert into customers\nvalues ('Anderson')\n    \ninsert into customers\nvalues('Ausson')\n\nselect replace (replace(cust_last_name,'son',''),'An','O') from customers; -- +\nselect replace (trim(trailing 'son' from cust_last_name),'An','O') from customers; -- trim should have only one character\nselect replace (substr (cust_last_name,-3),'An','O') from customers; -- both values are 'son'\nselect initcap(replace(trim('son' from cust_last_name),'An','O')) from customers; -- trim should have only one character	2
2	178	1z0-071	Selected Answer: A	A is the answer	1
3	178	1z0-071	null	A is the answer	1
1	179	1z0-071	Selected Answer: EF	EF should be the correct answer	1
2	179	1z0-071	null	E;F tested	4
3	179	1z0-071	Selected Answer: EF	Tested  column aliases cannot before the concatination unless you want to also inclunde them which means you need to add another ||	3
4	179	1z0-071	Selected Answer: EF	EF are correct.\nA is incorrect as there are single & double commas instead of single commas only. Others are obviously wrong.	2
5	179	1z0-071	null	E, F are right.	4
1	180	1z0-071	Selected Answer: BC	BC is correct	1
2	180	1z0-071	Selected Answer: BC	https://www.examtopics.com/discussions/oracle/view/10416-exam-1z0-071-topic-1-question-292-discussion/	1
1	181	1z0-071	Selected Answer: AE	Answer are A & E.	1
2	181	1z0-071	null	CE is the correct answer\nhttps://docs.oracle.com/cd/B28359_01/server.111/b28318/datadict.htm#CNCPT1220	1
1	182	1z0-071	null	only D, \nB not  in case cust_credit_limit =1000.45	2
2	182	1z0-071	Selected Answer: BD	BD is correct	1
3	182	1z0-071	Selected Answer: BD	BD is the correct answer	1
4	182	1z0-071	null	What is the point of using round?	2
5	182	1z0-071	null	For option B, what if cust_credit_limit = 999.6?	3
6	182	1z0-071	null	BD correct, since E didnt not search for the last name start with A/B, the condition is looking for lastname='A'	1
7	182	1z0-071	Selected Answer: BD	BD tested	4
8	182	1z0-071	Selected Answer: BD	B D are correct	2
9	182	1z0-071	Selected Answer: BD	BD is correct	3
10	182	1z0-071	Selected Answer: BD	BD must be right	3
1	183	1z0-071	Selected Answer: CD	CD correct	1
2	183	1z0-071	Selected Answer: CD	CD is correct	1
1	184	1z0-071	Selected Answer: AB	AB is the correct answer	1
2	184	1z0-071	Selected Answer: AB	https://www.examtopics.com/discussions/oracle/view/20447-exam-1z0-071-topic-2-question-55-discussion/	2
3	184	1z0-071	null	correct A,B,C - https://docs.oracle.com/database/121/SQLRF/expressions014.htm#SQLRF52093	1
1	185	1z0-071	null	B,E\ncreate table products (prod_id char(2), prod_name char(4), exp_date timestamp(6));\n\ncreate table new_products (prod_id char(4), prod_name varchar2(10), exp_date DATE);\n\n/*A NOOK 01789. 00000 -  "query block has incorrect number of result columns"*/\nSELECT prod_id FROM products \nUNION ALL \nSELECT prod_id, prod_name FROM new_products;\n\n/*B OK.*/\nSELECT prod_id, exp_date FROM products\nUNION ALL \nSELECT prod_id, NULL FROM new_products;\n\n/*C NOOK 01789. 00000 -  "query block has incorrect number of result columns"*/\nSELECT * FROM products\nMINUS \nSELECT prod_id FROM new_products;\n\n/*D NOOK 01790. 00000 -  "expression must have same datatype as corresponding expression"*/\nSELECT prod_id, prod_name FROM products\nINTERSECT \nSELECT 100, prod_name FROM new_products;\n\n/*E OK*/\nSELECT * FROM products \nUNION \nSELECT * FROM new_products;	6
2	185	1z0-071	Selected Answer: BE	BE correct	1
3	185	1z0-071	Selected Answer: BE	BE is correct D is not correct since the data types does not match	1
4	185	1z0-071	null	B, E is correct; but D also executes successfully!!	1
5	185	1z0-071	Selected Answer: BE	BE correct.  Please update these answers	2
6	185	1z0-071	Selected Answer: BE	BE tested	2
7	185	1z0-071	null	BE correct	2
8	185	1z0-071	Selected Answer: BE	BE Correct. Tested\nThanks Santi.	3
1	186	1z0-071	Selected Answer: ADE	Answers are: A, D, E.	1
1	187	1z0-071	Selected Answer: AC	A - is correct, because INSERT FIRST evaluates conditions in order and inserts a row into the first matching target only. So a source row never gets inserted into more than one table with INSERT FIRST.\nC - is correct because it describes what INSERT ALL does. One row from the source can be \ninserted into multiple target tables.\nE - "is not Correct" --> The word “always” makes this statement false. Also, Multitable INSERT statements use a SELECT to generate source rows. And the SELECT can be a subquery, but it can also be a direct table or view.	1
2	187	1z0-071	Selected Answer: CE	CD is correct	1
3	187	1z0-071	Selected Answer: CE	CE are correct\nB I think is correct as well?	3
1	188	1z0-071	null	--B WRONG\n--select avg(salary) from emp group by dept_id having avg(salary) > 1000;\n--C WRONG\n--select last_name from emp where upper(last_name) like 'A%';\n--D WRONG\n--Having is Used for Agg Functions. Single-row functions do not require grouping.	2
2	188	1z0-071	Selected Answer: A	For me A is correct.	1
3	188	1z0-071	null	B is the Answer.	1
4	188	1z0-071	Selected Answer: A	Example:  select employee_id from employees where salary >\n    (select avg(salary) from employees);	1
5	188	1z0-071	null	A\n\nselect EmployeeId, sum(amount)\nfrom Sales\ngroup by Employee\nwhere EmployeeId in (\n    select max(EmployeeId) from Employees)	2
6	188	1z0-071	Selected Answer: B	B is correct\nBut I think C as well is correct	1
7	188	1z0-071	null	I thought aggregate functions cannot be used in the WHERE clause?	4
1	189	1z0-071	Selected Answer: BC	keyword SAVEPOINT is optional thus B,C	1
2	189	1z0-071	Selected Answer: BC	BC is correct as the word savepoint is optionnal.	2
3	189	1z0-071	Selected Answer: BC	BC is correct	1
4	189	1z0-071	Selected Answer: BC	BC is the correct answer since SAVEPOINT is optional in ROLLBACK there's no such thing as COMMIT TO SAVEPOINT	1
5	189	1z0-071	Selected Answer: BD	BD is correct answer.	1
6	189	1z0-071	null	All savepoints of the current transaction are deleted if you execute a COMMIT , or a ROLLBACK that does not name a savepoint.	1
7	189	1z0-071	Selected Answer: BC	Voted for BC.\nSAVEPOINT word is optional, A rollbacks whole transaction, E is invalid as there's not such thing in COMMIT synthax.	1
8	189	1z0-071	Selected Answer: BC	E is invalid.\n\nBC is correct	2
1	190	1z0-071	Selected Answer: DE	DE is correct	6
2	190	1z0-071	null	D and E is correct.\nA produce an error\nB and C select highest salary based on department\nD and E select highest salary in the table	2
3	190	1z0-071	Selected Answer: DE	I think DE is correct.	1
4	190	1z0-071	null	DE is correct answer. Tested	1
5	190	1z0-071	Selected Answer: DE	DE is the correct answer	1
6	190	1z0-071	null	how is it not C & D? E doesn't make sense?	2
7	190	1z0-071	null	DE tested	2
8	190	1z0-071	Selected Answer: BC	E is wrong, you cant have Max(Max) an aggregate of aggregate \nMaybe B,C,E are correct but \nA,E are wrong	1
9	190	1z0-071	Selected Answer: DE	DE are correct answers	2
1	191	1z0-071	Selected Answer: D	D is correct	2
2	191	1z0-071	null	Admins, why so many questions are marked incorrectly?	2
3	191	1z0-071	Selected Answer: D	D should be the correct answer	1
4	191	1z0-071	null	D tested	1
5	191	1z0-071	Selected Answer: D	D is correct	1
6	191	1z0-071	Selected Answer: D	D correct answer	1
7	191	1z0-071	Selected Answer: D	D correct	1
8	191	1z0-071	Selected Answer: D	C is invalid and returns the error : \nORA-00979: not a GROUP BY expression	2
1	192	1z0-071	Selected Answer: A	A, B, D, and E require explicit data type conversion.	1
2	192	1z0-071	Selected Answer: A	A is the correct answer	2
3	192	1z0-071	Selected Answer: A	https://www.examtopics.com/discussions/oracle/view/13453-exam-1z0-071-topic-1-question-296-discussion/	1
4	192	1z0-071	null	All executed without error.	2
5	192	1z0-071	Selected Answer: A	D is executed without conversion.\n\nA is the correct	1
1	193	1z0-071	Selected Answer: CDF	C,D,F correct \n\nhttps://docs.oracle.com/cd/E18283_01/server.112/e17120/tables013.htm	5
2	193	1z0-071	Selected Answer: CDF	Index cannot be created on external table	2
3	193	1z0-071	Selected Answer: CDE	CDF are true	1
4	193	1z0-071	null	CDF are true	2
5	193	1z0-071	null	I think C, D, F.	3
8	208	1z0-071	null	E is the correct answer	1
2	221	1z0-071	Selected Answer: BCD	BCE should be correct	1
1	194	1z0-071	Selected Answer: C	UPDATE is DML and not a DDL, it does not implicitly commit the transaction.\nC. The DELETE command will wait for HR’s transaction to end then delete the row.\nALICE’s DELETE command will wait for HR’s transaction to complete (either commit or rollback) and then delete the row.	1
2	194	1z0-071	Selected Answer: A	- When HR executes the UPDATE statement, Oracle places a row-level lock (also known as a TM lock) on the row with employee_id = 109.\nThis lock prevents other sessions, including ALICE's, from modifying or deleting the same row until HR's transaction is either committed or rolled back.\n- ALICE’s DELETE command will detect the lock on the row with employee_id = 109 and wait for HR’s transaction to complete.\n- Once HR commits the update, the row is no longer locked. However:\n    -Oracle’s Read Consistency Rule ensures that ALICE's session operates under the "view" of the data at the point in time when ALICE started her session (or query).\n    -Since the row has been modified after ALICE’s session began, ALICE's DELETE will fail with an ORA-08177: Cannot serialize access for this transaction error, because the row has been changed by another committed transaction.	1
3	194	1z0-071	Selected Answer: D	D is correct. Alice needs Session previlages (not just Select).	1
4	194	1z0-071	Selected Answer: D	I'm seeing a lot of debate here about the security, but what about data lock? nothing indicates that the HR committed the update, thus; shouldn't the row be locked?	2
5	194	1z0-071	Selected Answer: D	C gives ORA-41900	1
6	194	1z0-071	Selected Answer: D	D is correct. ALICE needs SELECT privileges also	2
7	194	1z0-071	Selected Answer: C	Tested, C is correct,  i updated row as sys user and deleted as test user, it was stuck in scrip runner, as soon as I commited in sys session delete did happen in test user session	2
8	194	1z0-071	Selected Answer: D	https://www.examtopics.com/discussions/oracle/view/22160-exam-1z0-071-topic-2-question-65-discussion/	1
1	195	1z0-071	Selected Answer: CDE	are correct, check with chat gpt	1
2	195	1z0-071	null	The correct answer is CDE	1
3	195	1z0-071	null	DE for sure true.	1
4	195	1z0-071	null	https://forums.oracle.com/ords/apexds/post/dml-operations-on-multiple-views-3747	1
5	195	1z0-071	Selected Answer: CDE	Should be C, D, E\nhttps://www.examtopics.com/discussions/oracle/view/20172-exam-1z0-071-topic-2-question-37-discussion/	1
6	195	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/20172-exam-1z0-071-topic-2-question-37-discussion/	1
7	195	1z0-071	null	According to some forums I have checked, they suggest: C D F	1
1	196	1z0-071	Selected Answer: BD	I think BD is correct!	1
2	196	1z0-071	null	BD tested	1
3	196	1z0-071	Selected Answer: BD	BD is correct	1
4	196	1z0-071	Selected Answer: BD	This query will return expected result.	1
5	196	1z0-071	Selected Answer: BD	PLEASE UPDATE THESE ANSWERS, IT IS RIDICULOUS HOW MANY ARE INCORRECT	1
6	196	1z0-071	Selected Answer: BD	BD CORRECT	1
7	196	1z0-071	null	BD correct tested with the HR schema	1
8	196	1z0-071	Selected Answer: CD	CD CORRECT	1
9	196	1z0-071	Selected Answer: BD	BD correct	1
10	196	1z0-071	Selected Answer: BD	BD are correct.	1
11	196	1z0-071	Selected Answer: BD	E is invalid\n\nBD is the correct answer	2
1	197	1z0-071	Selected Answer: A	The answer is A.	1
1	198	1z0-071	Selected Answer: BD	B & D seem to be correct.	1
2	198	1z0-071	Selected Answer: BD	BD correct!	2
1	199	1z0-071	Selected Answer: BD	I will choose BD	6
2	199	1z0-071	Selected Answer: BD	B & D are the most plausable.	1
3	199	1z0-071	Selected Answer: BD	BD is correct	1
4	199	1z0-071	null	BD, tested.	1
5	199	1z0-071	Selected Answer: BD	BD is correct	1
6	199	1z0-071	Selected Answer: BD	Valid answers are BD	3
7	199	1z0-071	Selected Answer: BD	B,D correct	2
8	199	1z0-071	null	I agree BD	3
1	200	1z0-071	Selected Answer: A	A and E are both correct!	1
2	200	1z0-071	null	What makes A incorrect?	1
3	200	1z0-071	Selected Answer: E	I think E is correct	1
4	200	1z0-071	Selected Answer: E	E is correct	1
5	200	1z0-071	null	E Correct.\ncreate table a_test\n(c1 VARCHAR2(10),\nc2 NUMBER(10));\ninsert into a_test values ('123', 123);\nselect * from a_test;\ncommit;\nalter table a_test modify c1 VARCHAR2(5);\nalter table a_test modify c2 NUMBER(12,2);\ndesc a_test;\n\nif \nalter table a_test modify c1 VARCHAR2(2);\nORA-01441: cannot decrease column length because some value is too big	2
6	200	1z0-071	Selected Answer: E	E tested	1
7	200	1z0-071	Selected Answer: E	E is right answer.\nColumn must be empty to change datatype.	4
8	200	1z0-071	Selected Answer: E	E is correct	4
1	201	1z0-071	Selected Answer: AE	AE is correct	2
2	201	1z0-071	Selected Answer: AE	AE correct	2
3	201	1z0-071	Selected Answer: AE	AE Correct	3
4	201	1z0-071	Selected Answer: AE	AE Correct	1
5	201	1z0-071	Selected Answer: AE	A E are correct	1
6	201	1z0-071	null	AE is correct	1
7	201	1z0-071	Selected Answer: AE	AE is correct	3
1	202	1z0-071	Selected Answer: CE	C and E correct. GRANT and TRUNCATE are DDL, ALTER SESSION is a DDL as well but ALTER SESSION does not cause Data Dictionary Changes because these changes are temporary and session-specific, once the session ends, the settings go back to default.	1
2	202	1z0-071	Selected Answer: CE	CE for me.\nA. does not affect data dictionary\nB. It is local change if you would connect again this won't be permanent\nC. Here you affect permision, therefor Data dictionary\nD. Affects nothing because it is just select \nE. Affects Data dictionary \nAs for post in https://forums.oracle.com/ords/apexds/post/does-truncate-table-generate-undo-4231\nSince TABLE TRUNCATE modifies metadata in the Data Dictionary and resets the High Water Mark of the object...	1
3	202	1z0-071	Selected Answer: CE	C and E  correct , GRANT and TRUNCATE are DDL	1
4	202	1z0-071	null	C and E are correct	2
1	211	1z0-071	null	C tested	1
2	211	1z0-071	Selected Answer: C	Only 2 statements will be successfull:\nB - 27, MONTAG FEBRUAR, 2023\nC - MONTAG, 27 FEBRUAR, 2023\n\nCorrect and needed answer is C.	3
5	202	1z0-071	Selected Answer: BC	Based on the documentation\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/21/cncpt/data-dictionary-and-dynamic-performance-views.html#GUID-497B355D-E8D6-4403-B83B-B94A8AE6934D\n\nThe data dictionary contains metadata describing the contents of the database.\n\nFor example, the data dictionary contains information such as the following:\n\nThe definitions of every schema object in the database, including default values for columns and integrity constraint information\n\nThe amount of space allocated for and currently used by the schema objects\n\nThe names of Oracle Database users, privileges and roles granted to users, and auditing information related to users\n\ndoesn't mention anything about truncate.	1
6	202	1z0-071	Selected Answer: BC	B modifies the parameter setting in NLS_SESSION_PARAMETERS.  C modifies ALL_TAB_PRIVS_RECD and ALL_TAB_PRIVS_MADE.  For E, I tried truncating a table with 55000 rows but the truncate had no impact on space related columns in ALL_TABLES.	1
7	202	1z0-071	Selected Answer: CE	CE in my opinion	2
8	202	1z0-071	Selected Answer: CE	C, E correct, GRANT and TRUNCATE are DDL, ALTER SESSION is not.	1
9	202	1z0-071	Selected Answer: CE	CE are correct	1
10	202	1z0-071	null	C, E are correct.\n\nTruncate is DDL and it modifies the data dictionary.\nhttps://forums.oracle.com/ords/apexds/post/why-is-truncate-ddl-and-not-dml-7859\nhttps://forums.oracle.com/ords/apexds/post/does-truncate-table-generate-undo-4231	2
11	202	1z0-071	Selected Answer: BC	B,C correct. \n\nhttps://docs.oracle.com/cd/B10501_01/server.920/a96524/c05dicti.htm	2
1	203	1z0-071	Selected Answer: BCD	E is incorrect for more than one reason!\nBCD	1
2	203	1z0-071	Selected Answer: BCD	answer :CDE	2
3	203	1z0-071	Selected Answer: CDE	CDE is the correct answer	4
4	203	1z0-071	Selected Answer: BCD	BCDE all work as written.  E will fail if you put a comma between order_id and invoice_id	1
5	203	1z0-071	Selected Answer: CDE	Tested	2
6	203	1z0-071	null	answer :CDE	1
7	203	1z0-071	Selected Answer: CDE	CDE CORRECT. PLEASE HAVE A TRY:\n\nCREATE TABLE ORDERS_01\n(\n\tORDER_ID NUMBER(38),\n\tORDER_DATE DATE\n);\nCREATE TABLE INVOICES_01\n(\n\tINVOICE_ID NUMBER(38),\n\tINVOICE_DATE DATE\n);\n\nSELECT * FROM ORDERS_01\nORDER BY order_id\nINTERSECT\nSELECT * FROM INVOICES_01\nORDER BY invoice_id;\n\nSELECT * FROM ORDERS_01\nUNION ALL\nSELECT * FROM INVOICES_01 ORDER BY ORDER_ID;\n\nSELECT order_id, order_date FROM ORDERS_01\nUNION ALL\nSELECT invoice_id, invoice_date FROM INVOICES_01 \nORDER BY order_id;\n\nSELECT * FROM ORDERS_01\nMINUS\nSELECT * FROM INVOICES_01\nORDER BY 1;\n\nSELECT order_id invoice_id, order_date FROM ORDERS_01\nMINUS\nSELECT invoice_id, invoice_date FROM INVOICES_01\nORDER BY invoice_id;\n\nSELECT * FROM ORDERS_01\nORDER BY order_id\nUNION\nSELECT * FROM INVOICES_01;\n\nSELECT order_id, order_date FROM ORDERS_01\nINTERSECT\nSELECT invoice_id, invoice_date FROM INVOICES_01\nORDER BY invoice_id;	2
8	203	1z0-071	Selected Answer: BCD	BCD are correct	1
9	203	1z0-071	null	I have checked that E is working, but I don't  understand why.	1
10	203	1z0-071	Selected Answer: CDE	CDE are correct.\nB is wrong as this is subquery without SELECT * in the beginning.	2
11	203	1z0-071	null	Answer is BCD\nE is wrong because 1) The first select has 3 columns and second select has only 2 columns which is wrong. 2) The first select selects column invoice_id from the second table which is wrong . 3) Order by invoice_id is wrong.	1
12	203	1z0-071	null	CDE:\nPruebas:\n/*A NOOK*/\nSELECT * FROM orders ORDER BY order_id\nINTERSECT \nSELECT * FROM invoices ORDER BY invoice_id;\n\n\n/*B NOOK*/\n(SELECT * FROM orders\nUNION ALL \nSELECT * FROM invoices) ORDER BY order_id;\n\n\n/*C OK*/\nSELECT order_id, order_date FROM orders\nUNION ALL \nSELECT invoice_id, invoice_date FROM invoices ORDER BY order_id;\n\n\n/*D OK*/\n\nSELECT * FROM orders \nMINUS \nSELECT * FROM invoices ORDER BY 1;\n\n/*E OK*/\nSELECT order_id invoice_id, order_date FROM orders\nMINUS\nSELECT invoice_id, invoice_date FROM invoices ORDER BY invoice_id;\n\n\n/*F. NOOK */\nSELECT * FROM orders ORDER BY order_id\nUNION\nSELECT * FROM invoices;\n\n\n/*G. NOOK*/\nSELECT order_id, order_date FROM orders\nINTERSECT \nSELECT invoice_id, invoice_date FROM invoices ORDER BY invoice_id;	2
1	204	1z0-071	Selected Answer: CD	CD is correct	2
2	204	1z0-071	Selected Answer: CD	CD is correct NULLIF can't have NULL in the first expression	1
3	204	1z0-071	Selected Answer: CD	CD ES CORRECTO YA ESTA VALIDADO	2
4	204	1z0-071	Selected Answer: CD	CD.\nFor NULLIF you cannot specify the literal NULL for expr1 (1st parameter).	1
5	204	1z0-071	Selected Answer: CD	A is not valid\nThe correct answer is CD	3
1	205	1z0-071	Selected Answer: A	A is correct	6
2	205	1z0-071	null	The answer is A. You need the NVL, otherwise the COUNT won't know what to count. Remember, NULL means unknown.	2
3	205	1z0-071	Selected Answer: A	A is correct	1
4	205	1z0-071	Selected Answer: A	A is correct	1
5	205	1z0-071	null	A is correct. Need to convert to not NULL first.	1
6	205	1z0-071	Selected Answer: A	A is correct	1
7	205	1z0-071	Selected Answer: A	A is correct.	3
1	206	1z0-071	Selected Answer: D	The answer is D.\n'Salary = ' can only equate to 1 or 0 lines.	1
2	206	1z0-071	Selected Answer: D	D is correct	1
1	207	1z0-071	Selected Answer: BDE	BDE is correct	1
2	207	1z0-071	Selected Answer: BDE	BDE correct	1
3	207	1z0-071	Selected Answer: BDE	BDE is correct	1
4	207	1z0-071	Selected Answer: BDE	BDE is correct	1
5	207	1z0-071	null	why is option D right? It delete every rows from the table. It does not consider the condition "order_total < 1000."	1
6	207	1z0-071	Selected Answer: BDE	DELETE FROM TABLE_NAME.\n'FROM' IS A OPTION WORD.	1
7	207	1z0-071	Selected Answer: BDE	a column can be dropped  or it can be updated not deleted	1
8	207	1z0-071	Selected Answer: BDE	BDE is correct	1
9	207	1z0-071	Selected Answer: BDE	BDE is the correct answer	3
1	208	1z0-071	Selected Answer: A	A is the correct answer	10
2	208	1z0-071	Selected Answer: A	D is wrong because it’s using the alias in the were clause, but the where clause is executed first	1
3	208	1z0-071	Selected Answer: A	A is the correct	1
4	208	1z0-071	Selected Answer: A	A is correct	1
5	208	1z0-071	Selected Answer: A	A you can't use alias in where clause	1
6	208	1z0-071	Selected Answer: A	A should be correct	2
7	208	1z0-071	null	100% A CORRECT.\nTHE STATEMENT WILL EXECUTE THE 'WHERE' CONDITION FIRST BEFORE SELECT STATEMENT.	1
1	209	1z0-071	Selected Answer: BD	BD is the correct answer.\n\n\nYou can test this :\n\nCreate table hr.test_employees\n(emp_id number (5) primary key,\nEname varchar2(15) not null,\nEmail  varchar2(40) unique,\nAddress long,\nResume clob,\nDepartment_id number(4) constraint emp_dept_id_fx  references hr.departments(department_id)\n );	8
2	209	1z0-071	null	Only one LONG column is allowed per table. refer:\nhttps://docs.oracle.com/cd/A58617_01/server.804/a58241/ch5.htm#418225	1
3	209	1z0-071	Selected Answer: BD	BD correct answer	1
4	209	1z0-071	Selected Answer: BD	Must be BD NOT NULL must be declared at column level and only one Long column is allowed	1
5	209	1z0-071	null	BD only one Long per table	1
1	210	1z0-071	null	pls ignore the below information. it is for qsn:209	1
2	210	1z0-071	null	Only one LONG column is allowed per table. refer:\nhttps://docs.oracle.com/cd/A58617_01/server.804/a58241/ch5.htm#418225	1
3	210	1z0-071	Selected Answer: B	B is correct	1
4	210	1z0-071	Selected Answer: B	B is correct	1
5	210	1z0-071	null	B tested	2
6	210	1z0-071	null	Can please explain?	1
7	210	1z0-071	Selected Answer: B	B is correct	4
1	212	1z0-071	Selected Answer: A	Its intresting...BOTH queries return the same result\n\nselect prod_list, prod_name from products where prod_list = any (select prod_list from products)\n\nselect prod_list, prod_name from products where prod_list <> any (select prod_list from products)	2
2	212	1z0-071	null	'A' can not be correct. The subquery will list 10, 20, 30, 40 while the main query will return any product name that is not equal to any of the subquery list (<> ANY). So, A cannot be correct.	1
3	212	1z0-071	Selected Answer: A	Only A is correct	1
4	212	1z0-071	null	E would be correct if it's NOT IN and <> ALL	2
5	212	1z0-071	Selected Answer: A	A is correct	1
6	212	1z0-071	null	Maybe E is supposed to be using IN ..., then it would work.	1
7	212	1z0-071	null	Answer is A and Using NOT IN or <> ANY will not give the same result.\n\ncreate table products ( prod_id number, prod_name varchar2(10), prod_list number)\ninsert into products values( 101, 'Plate', 10);\ninsert into products values( 102, 'Cup', 20);\ninsert into products values( 103, 'Saucer', 30);\ninsert into products values( 104, 'Knife', 40);\ninsert into products values( 105, 'Fork', '');\n\nselect prod_name from products where prod_list not in (select prod_list from products)\nselect prod_name from products where prod_list <> any (select prod_list from products)	1
8	212	1z0-071	Selected Answer: A	A is a correct answer \nUsing NOT IN or <> ANY will not give the same result.	2
1	213	1z0-071	null	The condition from subquery is same for all tables i.e. data from sub query comes with employee_id > 125\n\nif the sal > 2000 then values will insert in Special_sal\nif the sal <2000 then values will insert in SAL_HISOTORY & MGR_HISTORY\n\nCHATGPT IS WRONG 100%.\n\nD is Correct	1
2	213	1z0-071	Selected Answer: D	In INSERT ALL we can have multiple INTO clauses under conditional statements. So both INTO statement will be executed under ELSE condition.	1
3	213	1z0-071	Selected Answer: C	Using chatgpt4, answer given is C. someone pls verify\n\nExpected Outcome Based on Conditions:\nFor employee_id = 100 with salary = 25000:\n\nMeets SAL > 20000, so data is inserted into special_sal.\nData is also inserted into mgr_history because the condition for the mgr_history table insertion doesn't depend on the salary.\nFor employee_id = 110 with salary = 18000:\n\nDoes not meet SAL > 20000, so data is inserted into sal_history.\nData is also inserted into mgr_history regardless of the salary because there's no conditional logic preventing this in the provided statement.\nFor employee_id = 120 with salary = 21000:\n\nMeets SAL > 20000, so data is inserted into special_sal.\nData is also inserted into mgr_history regardless of the salary.	1
4	213	1z0-071	null	C is correct you can CHATGPT	1
5	213	1z0-071	Selected Answer: D	D is correct	2
1	214	1z0-071	null	Answer is BEF\nhttps://oracle-base.com/articles/misc/temporary-tables	5
2	214	1z0-071	Selected Answer: BEF	A GLOBAL TEMPORARY TABLE in Oracle cannot have a PUBLIC SYNONYM. Synonyms, especially public ones, are meant to provide a consistent and global alias to database objects. However, Global Temporary Tables (GTTs) have session-specific or transaction-specific data, and allowing a public synonym for such a table could lead to confusion or conflicts due to its session-dependent behavior.	1
3	214	1z0-071	null	why BDE is the answer? Correct answer is BEF	1
4	214	1z0-071	Selected Answer: BEF	BEF is correct	2
1	215	1z0-071	Selected Answer: CE	I think CE is correct	1
2	215	1z0-071	Selected Answer: CE	CE is correct	1
1	216	1z0-071	Selected Answer: CE	To calculate the number of days between 1st January 2019 and the current date (SYSDATE) in Oracle SQL, the following considerations apply:\n\nSYSDATE is a date data type, so arithmetic operations on dates can directly calculate the difference in days.\nString literals representing dates (like '01-JAN-2019') must be explicitly converted to date values using TO_DATE.\nCorrect Answers:\nC. SELECT ROUND(SYSDATE - TO_DATE('01/JANUARY/2019')) FROM DUAL;\n\nThis query works because TO_DATE('01/JANUARY/2019') converts the string to a date, and subtracting it from SYSDATE gives the number of days. The ROUND function rounds the result to the nearest whole number.\nE. SELECT SYSDATE - TO_DATE('01-JANUARY-2019') FROM DUAL;\n\nThis query also works because it correctly converts '01-JANUARY-2019' to a date and subtracts it from SYSDATE, returning the exact number of days as a decimal.	1
2	216	1z0-071	Selected Answer: CE	C, E is correct	1
3	216	1z0-071	Selected Answer: CE	C is correct if you change the - operator between sysdate and to_date manually. i think there is a mistake.	1
4	216	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/20180-exam-1z0-071-topic-2-question-44-discussion/	1
5	216	1z0-071	Selected Answer: E	The only working query is E all of the others are not working.	1
1	217	1z0-071	Selected Answer: ACF	ACF is correct	1
2	217	1z0-071	null	ACF is correct. E is wrong	1
3	217	1z0-071	Selected Answer: ACE	ACE is correct	1
4	217	1z0-071	Selected Answer: ACF	ACF, I have tested on Oracle DB and it works	2
5	217	1z0-071	null	The correct answer is ACE	1
6	217	1z0-071	null	wrong img table https://www.examtopics.com/assets/media/exam-media/02818/0024900001.png	2
7	217	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/9440-exam-1z0-071-topic-1-question-301-discussion/	1
1	221	1z0-071	null	BCE be correct	1
1	218	1z0-071	Selected Answer: AE	Answer is A, E\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/CREATE-SYNONYM.html	1
2	218	1z0-071	Selected Answer: AE	Resource for Oracle synonyms:\nhttps://www.databasestar.com/oracle-synonym/	1
3	218	1z0-071	Selected Answer: AE	AE is correct	1
1	219	1z0-071	Selected Answer: B	B is correct	1
2	219	1z0-071	Selected Answer: B	B GROUP BY cannot use alias	2
1	220	1z0-071	Selected Answer: CD	C no doubts then its D not E\nThis is a common misconception. If ord_seq.NEXTVAL is used in a DEFAULT clause, users do not need direct privileges on the sequence to insert into the table.\n\nThe database evaluates the default on behalf of the user.	2
2	220	1z0-071	null	C for sure, then I am unsure D or E	1
3	220	1z0-071	null	E is correct only if we assume that user doesn't insert ord_no explicitly. If he does than he doesn't need the select privilege on the sequence.\nIn my oppinion only C is correct.	1
4	220	1z0-071	Selected Answer: CE	Cannot be A because of 'cycle' specification.	1
5	220	1z0-071	null	would be A,E. we can insert ord_no explicitly.	2
3	221	1z0-071	Selected Answer: AC	ACE, B is false, it return only time zone name	2
4	221	1z0-071	Selected Answer: BCE	BCE should be correct	1
5	221	1z0-071	Selected Answer: ABC	To test A, I inserted rows from 2 different session time zones into a table using sysdate.  The individual session time zones for each user session were recorded in the different rows.  E is confusing because while true, that is not the only data that is recorded.	1
6	221	1z0-071	Selected Answer: BCE	I will follow BCE too.	1
7	221	1z0-071	Selected Answer: BCE	https://www.examtopics.com/discussions/oracle/view/8426-exam-1z0-071-topic-1-question-262-discussion/	1
8	221	1z0-071	Selected Answer: BCE	I would say: BCE	2
1	222	1z0-071	Selected Answer: AE	For C, the query optimizer usage is based on the setting of OPTIMIZER_USE_INVISIBLE_INDEXES	2
2	222	1z0-071	null	A, C are correct. \nE. The maintenance of entries in the index during data manipulation operations (INSERT, UPDATE, DELETE) is not impacted by the visibility of the index. Both VISIBLE and INVISIBLE indexes are updated accordingly to maintain data integrity and facilitate efficient data retrieval using indexes.	2
2	223	1z0-071	null	"x > ANY (...)": The value must be greater than the smallest value in the list to evaluate to TRUE.\n"x < ANY (...)": The value must be smaller than the biggest value in the list to evaluate to TRUE.\n\nBDF is correct.	1
3	223	1z0-071	Selected Answer: BDF	BDF is correct	2
4	223	1z0-071	Selected Answer: BDF	BDF for me	1
5	223	1z0-071	null	Both B and C are correct. < ANY means less than ANY, no matter highest or lowest. \nAnother doubtful question	1
6	223	1z0-071	Selected Answer: BDF	BDF is correct	1
7	223	1z0-071	null	I think BDF, because the answer C is the definition of < All not < Any.  \nIf it less than the lowest value, so, it less than all values from the subquery.	1
8	223	1z0-071	Selected Answer: BDF	BDF is correct	3
9	223	1z0-071	Selected Answer: CDF	I think CDF correct	4
1	224	1z0-071	Selected Answer: BE	B. A relationship can be mandatory for both entities.\nExplanation:\nIn an entity relationship, it is possible to define a relationship as mandatory for both entities. For example:\nA "Student" must be enrolled in a "Course" (mandatory for "Student").\nA "Course" must have at least one "Student" (mandatory for "Course").\nThis is known as a mandatory participation constraint.\nE. A table name can be specified just once when selecting data from a table having a self-referencing relationship.\nExplanation:\nIn a self-referencing relationship, a table refers to itself through a foreign key. When querying, you can use a single table name but must use aliases to differentiate between the parent and child references.\n\nSELECT e1.employee_id, e1.name AS manager_name, e2.name AS employee_name\nFROM employees e1\nJOIN employees e2 ON e1.employee_id = e2.manager_id;	1
2	224	1z0-071	Selected Answer: BD	C IS NOT CORRECT WITH ''ONLY''.	1
3	224	1z0-071	Selected Answer: BC	I think many-to-many relationships are implemented using an associative table with foreign keys.	2
4	224	1z0-071	Selected Answer: BD	BD can be correct	1
5	224	1z0-071	Selected Answer: BD	D because A one-to-many relationship in one direction is a many-to-one relationship in the other direction. For example, if a customer can have many orders, then an order can have only one customer.\n\nStatement C, “A many-to-many relationship can be implemented only by using foreign keys,” is not correct because a many-to-many relationship cannot be implemented directly using foreign keys. Instead, it is typically implemented using a junction table (also known as a bridge table or associative table) that sits between the two tables representing the entities in the relationship.	1
1	225	1z0-071	Selected Answer: AD	AD is correct	1
2	225	1z0-071	Selected Answer: AD	AD is correct	1
1	226	1z0-071	null	If you haven't mentioned on commit preserve / Delete, the default behavior of system is to delete all the rows of GTT. So, once commit is complete, rows are deleted. Again, Insert command will copy all the rows from EMP which is 14\nC is correct. Tested as well	2
2	226	1z0-071	Selected Answer: C	C is correct	2
3	226	1z0-071	Selected Answer: C	I think the default for GTT is 'on commit delete rows'.  So after the commit there would be 0 rows but then after the next insert there would be 14.	1
4	226	1z0-071	Selected Answer: B	Tested. \n\ncreate table PRODUCTS\n(PROD_ID NUMBER,\nPROD_NAME VARCHAR2(50),\nPROD_CATEGORY VARCHAR2(50),\nPROD_MIN_PRICE NUMBER,\nPROD_UNIT_OF_MEASURE VARCHAR2(50))\n    \nINSERT into PRODUCTS VALUES(101,'Envoy','Hardware',6000,'Nos.') ;\nINSERT into PRODUCTS VALUES(102,'Y Box','Electronics',9000,'') ;\nINSERT into PRODUCTS VALUES(103,'DVD','Software/Other',2000,'Nos.') ;\nINSERT into PRODUCTS VALUES(104,'Documentation','Software/Other',4000,'') ;\n\nselect * from PRODUCTS\n\ncreate global temporary table t_pro as select * from PRODUCTS\n\ninsert into t_pro select * from PRODUCTS\n\ncommit\n\ninsert into t_pro select * from PRODUCTS\n\nselect count(*) from t_pro	2
1	227	1z0-071	Selected Answer: BC	I would say B and C - as the core features of SQL.\nProviding variable definition, as I would see it, a flavour added to the Oracle SQL dialect.	1
2	227	1z0-071	null	The two SQL features are:\n\nB. Processing sets of data.\n\nSQL is primarily designed for processing sets of data. It allows you to query, insert, update, and delete data in a relational database management system (RDBMS). SQL statements operate on sets of records, and you can use SQL to retrieve, manipulate, and manage data in databases.\n\nE. Providing variable definition capabilities.\n\nSQL supports variable definition capabilities through the use of variables and parameters. You can declare and use variables and parameters within SQL statements to store and manipulate data.	1
3	227	1z0-071	null	My hesitation on this one is E.\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqpug/DEFINE.html	1
1	228	1z0-071	Selected Answer: CD	C. All countries - countries with departments = countries with no departments	1
2	228	1z0-071	null	How are BD correct? Since B, C & D are only selecting country_id and country_name they only return a list of countries with no departments. Could someone please explain this	1
3	228	1z0-071	Selected Answer: BD	BD correct	2
1	229	1z0-071	Selected Answer: ABCF	I think yall intentionally put the wrong answer!  \n\n\nConstraints on Oracle tables include primary key, foreign key, check, and unique constraints. These constraints are used to ensure data integrity and consistency in a database.	1
2	229	1z0-071	Selected Answer: ABEF	ABEF seems correct	1
3	229	1z0-071	Selected Answer: ABEF	ABEF is correct	1
4	229	1z0-071	Selected Answer: ABEF	ABEF are corecct	3
5	229	1z0-071	Selected Answer: BCEF	For my opinion correct answers BCEF	1
6	229	1z0-071	null	maybe it's ABDEF ?	1
7	229	1z0-071	Selected Answer: ABEF	A, B, E, F are true. \nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/constraint.html#GUID-1055EA97-BA6F-4764-A15F-1024FD5B6DFE	4
1	230	1z0-071	Selected Answer: D	D correct , you need permission to create synonym	1
2	230	1z0-071	null	Why A is incorrect?	2
3	230	1z0-071	Selected Answer: D	I think D is correct as you need permission to create synonym	1
4	230	1z0-071	Selected Answer: D	D 2,3 only\nYou need explicit permission to create synonym even in your own schema\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-SYNONYM.html#GUID-A806C82F-1171-478E-A910-F9C6C42739B2	1
5	230	1z0-071	null	B. 2, 3, and 4	1
6	230	1z0-071	Selected Answer: D	D is correct	2
7	230	1z0-071	Selected Answer: D	Tested, you cannot create synonyms nor views without premission even if you are trying to do it for a object in your schema or if you want to use your schema table as a underlying table for view.	2
8	230	1z0-071	null	option D\nSince scott has privileges create session,table and unlimited table space, the user has not rights to create synonym unless he has create synonym privilege given to scott.	2
9	230	1z0-071	Selected Answer: B	User HR has the CREATE ANY TABLE privilege, which allows them to create a table in another user’s schema. In this case, HR successfully creates the products table in SCOTT’s schema.\n\nHowever, HR does not have the INSERT privilege on SCOTT’s products table, so statement 1 will fail.\n\nUser SCOTT has the CREATE SESSION and CREATE TABLE privileges, which allow them to log in to the database and create tables in their own schema. Since the products table is in SCOTT’s schema, SCOTT can query and insert data into the table, so statements 2 and 3 will execute successfully.\n\nSCOTT also has the privilege to create a synonym in their own schema, so statement 4 will execute successfully.	2
1	231	1z0-071	null	With Ties - Query would have returned one more row with an equal salary to the last row's salary if that salary number matches. In this case, it didn't so it returns 5 rows only.	1
2	231	1z0-071	null	A tested.\nHowever, what is the meaning of WITH TIES then. If replacing with ONLY returns the same result.	1
3	231	1z0-071	Selected Answer: A	The WITH TIES returns additional rows with the same sort key as the LAST row fetched.	1
4	231	1z0-071	Selected Answer: A	A is correct	1
5	231	1z0-071	null	Option A tested in DB.\nIf the salary contain like the below example:\nid Salary\n1 12000\n2 15000\n3 16000\n4 16000\n5 17000\n\nin this case, with ties option return extra rows\n\nselect id,salary\nfrom emp\norder by salary\nfetch first 3 rows with ties;\n\no/p:\n1 12000\n2 15000\n3 16000\n4 16000	2
6	231	1z0-071	Selected Answer: A	A tested.\nCREATE TABLE EMP\n(\n    ID NUMBER(10),\n    NAME VARCHAR2(10),\n    SALARY NUMBER(10)\n)\n\nINSERT INTO EMP VALUES (101, 'JOHN', 26000);\nINSERT INTO EMP VALUES (102, 'NEENA', 24000);\nINSERT INTO EMP VALUES (103, 'DEHAAN', 12000);\nINSERT INTO EMP VALUES (104, 'LEX', 17000);\nINSERT INTO EMP VALUES (105, 'BILL', 18000);\nINSERT INTO EMP VALUES (106, 'DANIEL', 26000);\nINSERT INTO EMP VALUES (107, 'BEN', 12000);\nINSERT INTO EMP VALUES (108, 'GEORGE', 25000);\n\nSELECT * FROM EMP\nORDER BY SALARY\nFETCH FIRST 5 ROWS WITH TIES;	1
7	231	1z0-071	Selected Answer: A	A tested	1
8	231	1z0-071	Selected Answer: A	A is correct, checked in DB	1
1	232	1z0-071	Selected Answer: BF	BF correct	2
2	232	1z0-071	Selected Answer: BF	BF tested	1
3	232	1z0-071	Selected Answer: BF	100% BF correct.\nHave a try.\n\nCREATE TABLE rate_list (rate NUMBER(6,2));\n\nINSERT INTO rate_list VALUES (0.999);\nselect * from rate_list;\n\nINSERT INTO rate_list VALUES (-.9);\nselect * from rate_list;\n\nINSERT INTO rate_list VALUES (87654.556);\nselect * from rate_list;\n\nINSERT INTO rate_list VALUES (-10);\nselect * from rate_list;\n\nINSERT INTO rate_list VALUES (-99.99);\nselect * from rate_list;\n\nINSERT INTO rate_list VALUES (0.551);\nselect * from rate_list;	2
4	232	1z0-071	Selected Answer: BF	BF ARE CORRECT	2
5	232	1z0-071	null	B,F tested	2
6	232	1z0-071	null	B and F are correct\nhttps://www.examtopics.com/discussions/oracle/view/8436-exam-1z0-071-topic-1-question-276-discussion/	2
7	232	1z0-071	Selected Answer: BE	B, E is correct	1
1	233	1z0-071	Selected Answer: BD	BD , 15,20,10,15 result	1
2	233	1z0-071	null	15,20,10,15 is result	1
3	233	1z0-071	Selected Answer: BD	BD is correct	2
4	233	1z0-071	null	Answer B,D	1
5	233	1z0-071	Selected Answer: BD	BD tested \nSELECT ROUND (TRUNC (15.193, 1)) "Results" FROM DUAL; \nSELECT ROUND (15.193, -1) "Results" FROM DUAL; \nSELECT TRUNC (15.193, -1) "Results" FROM DUAL;  \nSELECT TRUNC (ROUND (15.193, 1)) "Results" FROM DUAL;	2
6	233	1z0-071	Selected Answer: BD	B, D Correct tested in Oracle	1
7	233	1z0-071	Selected Answer: BD	Checked, B, D is correct	1
1	234	1z0-071	Selected Answer: A	A is correct	1
2	234	1z0-071	Selected Answer: A	A tested	2
1	235	1z0-071	Selected Answer: A	A is correct	2
2	235	1z0-071	Selected Answer: A	A tested	1
1	236	1z0-071	null	B is correct not A	2
2	236	1z0-071	Selected Answer: B	B is correct	2
3	236	1z0-071	Selected Answer: B	Tested, B is correct answer	1
4	236	1z0-071	Selected Answer: B	ORA-00905: missing keyword	1
5	236	1z0-071	Selected Answer: B	B is correct, I get error: “missing keyword”  (no ON condition). All others execute sucessfully.	1
1	237	1z0-071	Selected Answer: BC	Correct Answer: BC Tested\nA->The first select returns ORA-00904 \nD ->Wrong because both statement have d.* in the select list, so both will display departments with no employees\nE-> Wrong like D\nF -> Wrong like A	2
2	237	1z0-071	null	D E tested	1
3	237	1z0-071	null	Actually, I think C & D are the correct answers	4
4	237	1z0-071	null	B & C are the correct answers	3
1	238	1z0-071	Selected Answer: ADF	Answer are: A, D, F.	1
2	238	1z0-071	null	https://docs.oracle.com/cd/B13789_01/server.101/b10759/statements_9016.htm#:~:text=This%20statement%20is%20a%20convenient,in%20the%20same%20MERGE%20statement.	1
1	239	1z0-071	null	primary key  and unique key columns are the same thing so answer could be A as well.	1
2	239	1z0-071	Selected Answer: CDE	Answers, C D E are correct.	1
1	240	1z0-071	Selected Answer: BD	Answers: B & D are correct.	1
1	241	1z0-071	Selected Answer: DE	D & E, are correct.	1
1	242	1z0-071	Selected Answer: ABC	D is object privilege to Directory object	1
2	242	1z0-071	Selected Answer: ABC	A. Query any table in a database.\nTrue. The ability to query any table across the database requires the SELECT ANY TABLE system privilege. This is a system-level permission and not specific to objects within a user's schema.\nB. Execute a procedure in another schema.\nTrue. To execute a procedure in another schema, a user would need the EXECUTE ANY PROCEDURE system privilege. While direct object privileges can be granted to execute a specific procedure, the system privilege is broader and not restricted to a single schema.\nC. Log in to a database instance.\nTrue. Logging in to a database instance requires the CREATE SESSION system privilege. This is a fundamental system privilege that grants the user the ability to connect to the database.\n\nAnswer from GPT4	2
3	242	1z0-071	null	https://docs.oracle.com/cd/A97630_01/server.920/a96540/statements_912a.htm#2073689	1
5	257	1z0-071	Selected Answer: F	A is wrong - only object privileges\n\nhttps://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/GRANT.html	1
4	242	1z0-071	null	D 'WARNING:The privileges needed to access files in a directory object are operating system specific. UTL_FILE directory object privileges give you read and write access to all files within the specified directory.'	2
5	242	1z0-071	null	https://www.examtopics.com/discussions/oracle/view/8222-exam-1z0-071-topic-1-question-235-discussion/	1
6	242	1z0-071	Selected Answer: ACD	ACD is right i think	1
7	242	1z0-071	null	C Log in to database - Create session system privilege	1
8	242	1z0-071	null	B "Execute a procedure in another schema" This is an object privilege	1
9	242	1z0-071	null	A READ ANY TABLE system privilege allows a user to query tables, views, or materialized views in any schema in the database.	1
1	243	1z0-071	Selected Answer: AD	- A: Grants the CREATE SEQUENCE system privilege to both the manager and emp roles.\nIt is valid to specify multiple roles or users in a single GRANT statement.\n- B: CREATE TABLE is a system privilege, and privileges can be granted to roles.\n- C: CREATE ANY SESSION is not a valid privilege in Oracle. It should be CREATE SESSION instead\n- D: This syntax is valid.\n- E: CREATE TABLE is a system privilege, and SELECT is an object privilege.\nSystem and object privileges cannot be granted in the same GRANT statement	1
2	243	1z0-071	Selected Answer: AB	can grant system and object privileges in same grant statement	1
3	243	1z0-071	null	This command grants the CREATE TABLE privilege and SELECT privilege on the HR.EMPLOYEES table to the MANAGER role. This is valid syntax, as it grants both a system privilege and an object privilege to a role.\n That's by A,E is correct	1
4	243	1z0-071	null	A,E is correct answers.	2
1	244	1z0-071	Selected Answer: DE	D and E is correct	2
2	244	1z0-071	Selected Answer: DE	D, E are correct	1
3	244	1z0-071	Selected Answer: DE	DE are correct	1
1	245	1z0-071	null	Logic has to be higher to lower otherwise condition will not address 2nd row D is correct \n\nselect last_name, hire_date,\n\nCase\n    When sysdate - to_yminterval ('20-0') >= hire_date then 'Older than 20 years Employees'\n    When sysdate - to_yminterval ('10-0') >= hire_date then 'Older than 10 years Employees'\n    When sysdate - to_yminterval ('5-0') >= hire_date then 'Older than 5 years Employees'\n    Else 'New Employees'\nEND as "Employees Duration"\nfrom emp\norder by "Employees Duration" desc\n;	2
2	245	1z0-071	Selected Answer: D	Correct answer is D\nSELECT e.last_name, hire_date, sysdate,        \n(CASE WHEN  (sysdate -TO_YMINTERVAL('15-0')) >= hire_date THEN '15 years of service'\nWHEN (sysdate -TO_YMINTERVAL('10-0'))                  >= hire_date THEN '10 years of service'\nWHEN (sysdate - TO_YMINTERVAL('5-0'))                   >= hire_date  THEN '5 years of service'\nELSE '<5 years of service' END) AS years      \nFROM   employees \nORDER BY hire_date	4
3	245	1z0-071	Selected Answer: B	I think answer is B.	1
1	246	1z0-071	null	B. Alter Table XYZ Read only\nD. Alter Table XYZ Rename to ABC\nF. ALTER TABLE employees ADD CONSTRAINT emp_pk PRIMARY KEY (employee_id);\n-----\nE. You cant drop all columns from table with Drop. you can drop multiple.	3
2	246	1z0-071	Selected Answer: BDF	https://stackoverflow.com/questions/64758577/alter-table-sql-oracle-12c#:~:text=Which%20three%20actions%20can%20you,3%2D%20Rename%20a%20table.\n\nAnswer BDF	3
1	247	1z0-071	Selected Answer: DEF	A is incorrect because of the word "always".	1
2	247	1z0-071	Selected Answer: AEF	But based on the scheme ans, id D is correct , then A should be correct!	1
3	247	1z0-071	null	Yes, you can create a table in ORACLE without specifying the length in CHAR column.\nD is right.	1
4	247	1z0-071	null	you can't create a table in ORACLE without specifying the length in CHAR column	1
5	247	1z0-071	null	If you do not specify a qualifier, the value of the NLS_LENGTH_SEMANTICS parameter of the session creating the column defines the length semantics, unless the table belongs to the schema SYS, in which case the default semantics is BYTE.	1
6	247	1z0-071	Selected Answer: DEF	DEF for me,    \nCHAR default is 1 byte, \nwe can use: CREATE TABLE tmp (col CHAR);	3
7	247	1z0-071	Selected Answer: AEF	Answer is A,E,F	2
1	248	1z0-071	Selected Answer: ADE	- UPDATE can be granted only on tables and views\n- ALTER is valid for tables and sequences but not views.\n- REFERENCES can be granted only on tables and views.	1
2	248	1z0-071	Selected Answer: ADE	Select can be given to all.	1
3	248	1z0-071	null	A. TRUE\nB. FALSE. Only Table\nC. True. Can also be  granted on sequences\nD. False. Trick question as alter is system privilege. Alter can be granted on both table and sequences.\nE. TRUE\nF. False. Insert can be granted to table and synonym	2
4	248	1z0-071	null	ACE is correct	1
1	249	1z0-071	Selected Answer: AE	Answer A,E	1
1	250	1z0-071	Selected Answer: CD	Answers C & D are correct.	1
2	251	1z0-071	null	A,D,E is correct. Tested. Feel free to try\n\nSELECT 'abc' AS "customer_id", Sysdate as "date", 10+100 Dues FROM DUAL; {ASS\n\nSELECT 'abc' AS 'customer_id', Sysdate as date, 10+100 'Dues' FROM DUAL; Fail because single quote for alias and not double quote on date. Alias cannot be in a single quote and date must be in a double quote as date is saved as a datatype\n\nSELECT 'abc' AS "customer_id", Sysdate as DATE, 10+100 "Dues" FROM DUAL; FAIL. No double quote for date\n\nSELECT 'abc' AS "customer_id", Sysdate as TRANS_DATE, 10+100 "Dues AMOUNT" FROM DUAL; PASS\n\nSELECT 'abc' CUSTID, Sysdate TRANS_DATE, 10+100 Dues FROM DUAL; PASS	4
3	251	1z0-071	Selected Answer: DE	IT works 1) with as keyword , 2) with double quote 3) with out ANY quote but NOT WITH SINGLE QUOTE. Tested.	1
4	251	1z0-071	Selected Answer: AD	Based on the question, A, E and E are correct.\n\nSingle quotes aren't allowed for column names, and DATE requires double quotes since DATE is a key word.	1
5	251	1z0-071	Selected Answer: AD	A, D, E are correct	3
1	252	1z0-071	Selected Answer: ACD	A,C and D	1
2	252	1z0-071	Selected Answer: BCE	B, First C, and E are correct.	1
3	252	1z0-071	null	CCD\nsecond C alter any table privs	3
4	252	1z0-071	null	But A  is also not correct \n"You can specify WITH GRANT OPTION only when granting to a user or to PUBLIC, not when granting to a role. "	3
5	252	1z0-071	Selected Answer: ACD	ACD for me\n\nE is not correct\nhttp://www.dba-oracle.com/t_with_grant_admin_privileges.htm	1
1	253	1z0-071	Selected Answer: AC	A and C	2
2	253	1z0-071	Selected Answer: AB	AB right	1
3	253	1z0-071	Selected Answer: AC	A, C are correct	2
4	253	1z0-071	null	AC is correct.	2
5	253	1z0-071	Selected Answer: AB	AB for me	2
1	254	1z0-071	Selected Answer: D	You cannot alter view.\nYou can only alter tables or sequences.\n\nSELECT - tables, views, sequences\nALTER - tables, sequences\nall other - tables, views	1
1	255	1z0-071	Selected Answer: DFG	WHY C IS INCORRECT?	1
2	255	1z0-071	null	Answers are DFG in terms of G option ... The PUBLIC role is automatically granted to all users, providing a set of default privileges that every user in the database has.	1
3	255	1z0-071	null	A , D and F	1
4	255	1z0-071	Selected Answer: DFG	Please ignore my previous answer.\n\n\nD:Who Can Grant Schema Object Privileges?\nA user automatically has all object privileges for schema objects contained in his or her schema. A user can grant any object privilege on any schema object he or she owns to any other user or role. If the grant includes the GRANT OPTION (of the GRANT command), the grantee can further grant the object privilege to other users; otherwise, the grantee can use the privilege but cannot grant it to other users.\nhttps://docs.oracle.com/cd/A58617_01/server.804/a58227/ch18.htm\nF:\nhttps://docs.oracle.com/cd/A97630_01/server.920/a96521/privs.htm#:~:text=A%20role%20groups%20several%20privileges,to%20help%20in%20database%20administration.\nG:\nhttps://docs.oracle.com/cd/A97630_01/server.920/a96521/privs.htm#:~:text=Because%20PUBLIC%20is%20accessible%20to,requires%20the%20privilege%20or%20role.	3
5	255	1z0-071	Selected Answer: ADF	A. System privileges always set privileges for an entire database.\nPartially True: System privileges are designed to grant a user abilities that are applicable across the database, such as creating tables or executing any procedure. However, the scope of "entire database" can vary depending on the specific system privilege. Some system privileges are more granular and allow actions on specific types of objects across the database.\n\nD. A user has all object privileges for every object in their schema by default.\nTrue: In Oracle, users inherently have all privileges on objects they own, which includes the ability to select, insert, update, delete, and execute (for procedures and functions), among other actions on those objects.\n\nF. A role can contain a combination of several privileges and roles.\nTrue: This is one of the primary purposes of roles in Oracle Database. They can group together various system and object privileges as well as other roles for easier and more efficient privilege management.\n\nFrom GPT4	1
1	256	1z0-071	null	Sorry, my correct: \n\nA. is incorrect - the WHERE clause does not come after HAVING clause\n\nB. is technically incorrect, as the HAVING clause comes after the GROUP BY, however, in Oracle SQL, this can work and will produce the correct answer.\n\nC: is incorrect - cannot use an aggregated function straight in the WHERE clause\n\nD. Correct.	1
2	256	1z0-071	Selected Answer: D	A. is incorrect - the WHERE clause does not come after HAVING clause\n\nB. is technically incorrect, as the HAVING clause comes after the GROUP BY, however, in Oracle SQL, this cannot work and will produce the correct answer.\n\nC: is incorrect - cannot use an aggregated function straight in the WHERE clause\n\nD. Correct.	1
1	257	1z0-071	Selected Answer: DF	D. It cannot be used to pass on privileges to PUBLIC by the grantee.\nF. It can be used to pass on privileges to other users by the grantee.	1
2	257	1z0-071	Selected Answer: D	WHAT ABOUT D , THAT ALSO CORRECT SEEMS,	1
3	257	1z0-071	null	B is the right answer as per this  website https://docs.oracle.com/cd/B10500_01/server.920/a96521/privs.htm#21327\nthis website has same wording\nSpecifying the GRANT OPTION\nSpecify WITH GRANT OPTION to enable the grantee to grant the object privileges to other users and roles. The user whose schema contains an object is automatically granted all associated object privileges with the GRANT OPTION. This special privilege allows the grantee several expanded privileges:\n\nThe grantee can grant the object privilege to any users in the database, with or without the GRANT OPTION, or to any role in the database.\nIf both of the following are true, the grantee can create views on the table and grant the corresponding privileges on the views to any user or role in the database.\nThe grantee receives object privileges for the table with the GRANT OPTION.\nThe grantee has the CREATE VIEW or CREATE ANY VIEW system privilege.	1
4	257	1z0-071	Selected Answer: BF	Specify WITH GRANT OPTION to enable the grantee to grant the object privileges to other users and roles. The user whose schema contains an object is automatically granted all associated object privileges with the GRANT OPTION. This special privilege allows the grantee several expanded privileges:\n\n    The grantee can grant the object privilege to any users in the database, with or without the GRANT OPTION, or to any role in the database.\n    If both of the following are true, the grantee can create views on the table and grant the corresponding privileges on the views to any user or role in the database.\n        The grantee receives object privileges for the table with the GRANT OPTION.\n        The grantee has the CREATE VIEW or CREATE ANY VIEW system privilege.\n\nThe GRANT OPTION is not valid when granting an object privilege to a role. Oracle prevents the propagation of object privileges through roles so that grantees of a role cannot propagate object privileges received by means of roles.	2
6	257	1z0-071	Selected Answer: AF	A. It can be used for system and object privileges. This option allows the grantee to further grant the privilege or role to another user or role, unless the role is a GLOBAL role, which includes both system and object privileges .\n\nF. It can be used to pass on privileges to other users by the grantee. When a user is granted privileges or a role with the WITH GRANT OPTION, they can then grant those same privileges or roles to other users or roles. This does not apply to roles, as roles cannot be granted WITH GRANT OPTION .	1
1	258	1z0-071	Selected Answer: B	Aggregate Functions Rule: You cannot nest aggregate functions like MAX(AVG()) or AVG(MAX()).	1
1	259	1z0-071	Selected Answer: B	https://docs.oracle.com/cd/A84870_01/doc/server.816/a76989/ch26.htm\n\nThis example selects the current value of the employee sequence:\n\nSELECT empseq.currval \n    FROM DUAL;	1
1	260	1z0-071	Selected Answer: AB	A. SALES1 is created with 55,000 rows.\n  The `WHERE 1=1` condition is always true, so it selects **all rows** from `sales`.  \n  Since `sales` has **55,000 rows**, `sales1` will also have **55,000 rows**.\n\nB. SALES1 has NOT NULL constraints on any selected columns which had those constraints in the SALES table.\n  Oracle preserves `NOT NULL` constraints** during CTAS. These are the **only constraints** that are automatically copied over.  \n  Other constraints like `PRIMARY KEY`, `UNIQUE`, `CHECK`, and `FOREIGN KEY` are **not** retained.	1
1	261	1z0-071	Selected Answer: AD	A and D are correct.	1
1	263	1z0-071	Selected Answer: CE	C and E are right answers. (Original query is cross join/cartesian product).	1
2	263	1z0-071	null	C and E	2
3	263	1z0-071	Selected Answer: CE	Answers are C and E.	1
1	265	1z0-071	Selected Answer: AB	B. USING can never be used with a full outer join. Use ON instead for full outer jon.	1
2	265	1z0-071	Selected Answer: AC	No, la cláusula USING no puede usarse directamente en un NATURAL JOIN en Oracle. El NATURAL JOIN realiza la unión basándose en todas las columnas con el mismo nombre y tipo de dato entre las tablas, sin necesidad de especificar la condición de unión explícitamente. La cláusula USING se utiliza en un JOIN convencional para especificar las columnas que se utilizarán en la unión, pero no reemplaza la necesidad de especificar la condición de unión.	1
3	265	1z0-071	Selected Answer: AC	A. It is used to specify an equijoin of columns that have the same name in both tables.\nC. It can never be used with a natural join.	1
4	265	1z0-071	Selected Answer: AC	CORRECT ANS IS A,C.	1
1	266	1z0-071	Selected Answer: CD	ANS IS C D E,   CAUSE, CURRECT TIME STAMP IS INCULDED WITH CURRENT DATA WHICH BASED ON THE SECESSION TIME.	1
1	268	1z0-071	Selected Answer: BCE	B, C and E are correct.	1
1	269	1z0-071	Selected Answer: DEF	D. CREATE INDEX price_idx ON products (price);\nE. ALTER TABLE products DROP UNUSED COLUMNS;\nF. ALTER TABLE products SET UNUSED (expiry_date);	1
2	269	1z0-071	Selected Answer: CDE	WE CAN DROP THE UNUSED COLUMNS SINCE IT DOESNOT CHANGE THE STRUCTURE THE DATA STRUCTURE	2
3	269	1z0-071	Selected Answer: CDE	Since the columns are already set as unused u can drop them. \nU cant set the columns to unused for a read only table	1
1	270	1z0-071	Selected Answer: ADFG	A, D, F and G are correct.	1
1	272	1z0-071	Selected Answer: CD	Answer is CD\n\nE is wrong.\n  Oracle does **not have an `INDEX` object privilege**. You can’t grant someone the ability to index a table via an `INDEX` privilege—it doesn’t exist. Only `CREATE ANY INDEX` or CREATE INDEX applies.	1
2	272	1z0-071	Selected Answer: DE	o create an index on a table in another schema in your own schema, you must either own the table or have been granted the INDEX object privilege on that table, or possess the CREATE ANY INDEX system privilege​\ndocs.oracle.com\n. In our scenario the table isn’t owned by the user, so the user needs either the object privilege (GRANT INDEX ON table_name TO user) or the CREATE ANY INDEX privilege. Having either of those will satisfy the privilege requirement to create the index. (If the user already has CREATE ANY INDEX, that covers it; if not, the table’s owner can grant the INDEX privilege on that specific table.)	1
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (name, company) FROM stdin;
1z0-071	Oracle
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (number, exam, text) FROM stdin;
1	1z0-071	Examine the description of the PROMOTIONS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0000200001.png\nYou want to display the unique promotion costs in each promotion category.\nWhich two queries can be used? (Choose two.)
2	1z0-071	Examine the description of the PRODUCTS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0000300001.png\nWhich three queries use valid expressions? (Choose three.)
3	1z0-071	What is true about non-equijoin statement performance? (Choose two.)
4	1z0-071	Which two are true? (Choose two.)
5	1z0-071	Which three statements are true about Oracle synonyms? (Choose three.)
6	1z0-071	Which two are true? (Choose two.)
7	1z0-071	Examine these SQL statements which execute successfully:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0000600001.png\nWhich two statements are true after execution? (Choose two.)
8	1z0-071	Examine this SQL statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0000700001.png\nWhich two are true? (Choose two.)
9	1z0-071	Which two statements are true about TRUNCATE and DELETE? (Choose two.)
10	1z0-071	The STORES table has a column START_DATE of data type DATE, containing the date the row was inserted.\nYou only want to display details of rows where START_DATE is within the last 25 months.\nWhich WHERE clause can be used?
11	1z0-071	Which three are true about scalar subquery expressions? (Choose three.)
12	1z0-071	Examine this query:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0000900001.png\nWhich two methods should you use to prevent prompting for a hire date value when this query is executed? (Choose two.)
13	1z0-071	You need to allow user ANDREW to:\n1. Modify the TITLE and ADDRESS columns of your CUSTOMERS table.\n2. GRANT that permission to other users.\nWhich statement will do this?
14	1z0-071	You own table DEPARTMENTS, referenced by views, indexes, and synonyms.\nExamine this command which executes successfully:\nDROP TABLE departments PURGE;\nWhich three statements are true? (Choose three.)
15	1z0-071	Which three statements are true about Structured Query Language (SQL)? (Choose three.)
16	1z0-071	Which two statements are true about Oracle synonyms? (Choose two.)
17	1z0-071	Which is true about the ROUND, TRUNC and MOD functions?
18	1z0-071	Which two are true about transactions in the Oracle Database? (Choose two.)
19	1z0-071	Examine the description of the MEMBERS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001200001.png\nExamine the partial query:\nSELECT city, last_name AS lname FROM members ...;\nYou want to display all cities that contain the string AN. The cities must be returned in ascending order, with the last names further sorted in descending order.\nWhich two clauses must you add to the query? (Choose two.)
20	1z0-071	Examine this partial command:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001300001.png\nWhich two clauses are required for this command to execute successfully? (Choose two.)
21	1z0-071	Which two are true about unused columns? (Choose two.)
22	1z0-071	Which two are true about the precedence of operators and conditions? (Choose two.)
23	1z0-071	In your session, the NLS_DATE_FORMAT is DD-MM-YYYY.\nThere are 86400 seconds in a day.\nExamine this result:\nDATE -\n-----------\n02-JAN-2020\nWhich statement returns this?
24	1z0-071	Examine the data in the INVOICES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001600001.png\nExamine the data in the CURRENCIES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001600002.png\nWhich query returns the currencies in CURRENCIES that are not present in INVOICES?\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001600003.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001600004.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001600005.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0001700001.png
25	1z0-071	The SALES table has columns PROD_ID and QUANTITY_SOLD of data type NUMBER.\nWhich two queries execute successfully? (Choose two.)
26	1z0-071	Which three statements are true about single-row functions? (Choose three.)
27	1z0-071	Which two statements are true about *_TABLES views? (Choose two.)
28	1z0-071	Which two statements are true about conditional INSERT ALL? (Choose two.)
29	1z0-071	Which two statements are true about the COUNT function? (Choose two.)
30	1z0-071	The EMPLOYEES table contains columns EMP_ID of data type NUMBER and HIRE_DATE of data type DATE.\nYou want to display the date of the first Monday after the completion of six months since hiring.\nThe NLS_TERRITORY parameter is set to AMERICA in the session and, therefore, Sunday is the first day of the week.\nWhich query can be used?
31	1z0-071	Which three statements are true about GLOBAL TEMPORARY TABLES? (Choose three.)
32	1z0-071	Which two statements are true about the SET VERIFY ON command? (Choose two.)
188	1z0-071	Which statement is true about using functions in WHERE and HAVING?
33	1z0-071	Examine this list of requirements for a sequence:\n1. Name: EMP_SEQ\n2. First value returned: 1\n3. Duplicates are never permitted.\n4. Provide values to be inserted into the EMPLOYEES.EMPLOYEE_ID column.\n5. Reduce the chances of gaps in the values.\nWhich two statements will satisfy these requirements? (Choose two.)
34	1z0-071	Which three queries execute successfully? (Choose three.)
35	1z0-071	Which two are true about granting object privileges on tables, views, and sequences? (Choose two.)
36	1z0-071	Examine the description of the BOOKS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002200001.png\nThe table has 100 rows.\nExamine this sequence of statements issued in a new session:\nINSERT INTO books VALUES ('ADV112', 'Adventures of Tom Sawyer', NULL, NULL);\nSAVEPOINT a;\nDELETE FROM books;\nROLLBACK TO SAVEPOINT a;\nROLLBACK;\nWhich two statements are true? (Choose two.)
37	1z0-071	Which two statements are true about an Oracle database? (Choose two.)
38	1z0-071	Examine the data in the EMP table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002400001.png\nYou execute this query:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002400002.jpg\nWhy does an error occur?
39	1z0-071	Which two actions can you perform with object privileges? (Choose two.)
40	1z0-071	No user-defined locks are used in your database.\nWhich three are true about Transaction Control Language (TCL)? (Choose three.)
41	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002500001.png\nWhich two queries return rows for employees whose manager works in a different department? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002600001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002600002.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002600003.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002700001.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002700002.png
42	1z0-071	Which three are true about dropping columns from a table? (Choose three.)
43	1z0-071	Which three statements are true about views in an Oracle Database? (Choose three.)
44	1z0-071	You start a session and execute these commands successfully:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002900001.png\nWhich two are true? (Choose two.)
45	1z0-071	Examine this statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0002900002.png\nWhich two statements are true? (Choose two.)
46	1z0-071	Which two are true about external tables that use the ORACLE_DATAPUMP access driver? (Choose two.)
47	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003100001.png\nWhich statement will fail?\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003100002.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003100003.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003100004.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003200001.png
48	1z0-071	Examine the data in the NEW_EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003200002.png\nExamine the data in the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003200003.png\nYou want to:\n1. Update existing employee details in the EMPLOYEES table with data from the NEW_EMPLOYEES table.\n2. Add new employee details from the NEW_EMPLOYEES table to the EMPLOYEES table.\nWhich statement will do this?\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003300001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003300002.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003300003.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003300004.png
49	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003400001.png\nFor each employee in department 90 you want to display:\n1. their last name\n2. the number of complete weeks they have been employed\nThe output must be sorted by the number of weeks, starting with the longest serving employee first.\nWhich statement will accomplish this?\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003400002.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003400003.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003400004.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003500001.png
50	1z0-071	Examine the description of the PRODUCT_DETAILS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003500002.png\nWhich two statements are true? (Choose two.)
51	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003600001.png\nWhich two queries will result in an error? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003600002.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003600003.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003600004.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003600005.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003700001.png\nF.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003700002.png
52	1z0-071	You create a table named 123.\nWhich statement runs successfully?
53	1z0-071	Which two statements are true regarding indexes? (Choose two.)
54	1z0-071	Which two are true about queries using set operators (UNION, UNION ALL, INTERSECT and MINUS)? (Choose two.)
55	1z0-071	BOOK_SEQ is an existing sequence in your schema.\nWhich two CREATE TABLE commands are valid? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003900001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003900002.png\nC. C.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003900003.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003900004.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0003900005.png
56	1z0-071	Which three statements are true about multiple row subqueries? (Choose three.)
57	1z0-071	Which three actions can you perform on an existing table containing data? (Choose three.)
58	1z0-071	Which two statements are true about selecting related rows from two tables based on an Entity Relationship Diagram (ERD)? (Choose two.)
59	1z0-071	Which three statements about roles are true? (Choose three.)
60	1z0-071	The INVOICE table has a QTY_SOLD column of data type NUMBER and an INVOICE_DATE column of data type DATE.\nNLS_DATE_FORMAT is set to DD-MON-RR.\nWhich two are true about data type conversions involving these columns in query expressions? (Choose two.)
61	1z0-071	Which three statements are true about inner and outer joins? (Choose three.)
95	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image6.png\nWhich two statements will run successfully? (Choose two.)
62	1z0-071	Which statement will execute successfully?\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004200001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004300001.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004300002.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004300003.png
63	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004300004.png\nWhich two queries return all rows for employees whose salary is greater than the average salary in their department? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004400001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004400002.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004400003.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004400004.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004400005.png
64	1z0-071	Which three statements are true about the Oracle join and ANSI join syntax? (Choose three.)
65	1z0-071	Which two are true about the NVL, NVL2, and COALESCE functions? (Choose two.)
66	1z0-071	Examine this statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004600001.png\nWhat is returned upon execution?
67	1z0-071	Examine this statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004600002.png\nWhat is returned upon execution?
68	1z0-071	Which two statements execute successfully? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004700001.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004700002.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004700003.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004700004.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004700005.png
69	1z0-071	An Oracle Database session has an uncommitted transaction in progress which updated 5000 rows in a table.\nIn which three situations does the transaction complete thereby committing the updates? (Choose three.)
70	1z0-071	Which two are true about using constraints? (Choose two.)
71	1z0-071	Examine this statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0004900001.png\nOn which two columns of the table will an index be created automatically? (Choose two.)
72	1z0-071	Examine this partial query:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005000001.jpg\nExamine this output:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005000002.png\nWhich GROUP BY clause must be added so the query returns the results shown?
73	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005100001.png\nWhich statement will execute successfully, returning distinct employees with non-null first names?
74	1z0-071	Examine the description of the BRICKS table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005200001.png\nExamine the description of the BRICKS_STAGE table:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005200002.png\nWhich two queries execute successfully? (Choose two.)\nA.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005200003.png\nB.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005200004.png\nC.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005200005.png\nD.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005300001.png\nE.\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005300002.png
75	1z0-071	Table EMPLOYEES contains columns including EMPLOYEE_ID, JOB_ID and SALARY.\nOnly the EMPLOYEE_ID column is indexed.\nRows exist for employees 100 and 200.\nExamine this statement:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005300003.png\nWhich two statements are true? (Choose two.)
76	1z0-071	Examine these two queries and their output:\nSELECT deptno, dname FROM dept;\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005400001.png\nSELECT emame, job, deptno FROM emp ORDER BY deptno;\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005500001.png\nNow examine this query:\nhttps://www.examtopics.com/assets/media/exam-media/04351/0005500002.png\nHow many rows will be displayed?
77	1z0-071	You want to return the current date and time from the user session, with a data type of TIMESTAMP WITH TIME ZONE.\nWhich function will do this?
78	1z0-071	You have been tasked to create a table for a banking application.\nOne of the columns must meet three requirements:\n1) Be stored in a format supporting date arithmetic without using conversion functions\n2) Store a loan period of up to 10 years\n3) Be used for calculating interest for the number of days the loan remains unpaid\nWhich data type should you use?
79	1z0-071	Which two are true about a SQL statement using SET operators such as UNION? (Choose two.)
80	1z0-071	Which two are true about queries using set operators such as UNION? (Choose two.)
81	1z0-071	Examine this business rule:\nEach student can work on multiple projects and each project can have multiple students.\nYou must design an Entity Relationship (ER) model for optimal data storage and allow for generating reports in this format:\nSTUDENT_ID FIRST_NAME LAST_NAME PROJECT_ID PROJECT_NAME PROJECT_TASK\nWhich two statements are true? (Choose two.)
82	1z0-071	Which three are key components of an Entity Relationship Model? (Choose three.)
83	1z0-071	Examine the data in the ORDERS table:\nhttps://img.examtopics.com/1z0-071/image1.png\nExamine the data in the INVOICES table:\nhttps://img.examtopics.com/1z0-071/image2.png\nExamine this query:\nhttps://img.examtopics.com/1z0-071/image3.png
84	1z0-071	Which two will execute successfully? (Choose two.)
85	1z0-071	Which three statements are true about a self join? (Choose three.)
86	1z0-071	You execute this query:\nSELECT TO_CHAR(NEXT_DAY(LAST_DAY(SYSDATE), 'MON'), 'dd "Monday for" fmMonth rrrr')\nFROM DUAL;\nWhat is the result?
87	1z0-071	Which two statements are true about the WHERE and HAVING clauses in a SELECT statement? (Choose two.)
88	1z0-071	Which two are true about global temporary tables? (Choose two.)
89	1z0-071	Which three are true about privileges? (Choose three.)
90	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image4.png\nWhich two statements will insert a row into the EMPLOYEES table? (Choose two.)
91	1z0-071	Examine this command:\nTRUNCATE TABLE test;\nTable truncated.\nWhich two are true? (Choose two.)
92	1z0-071	You issued this command:\nDROP TABLE hr.employees;\nWhich three statements are true? (Choose three.)
93	1z0-071	Examine this statement:\nhttps://img.examtopics.com/1z0-071/image5.png\nIdentify three ORDER BY clauses, any one of which will complete the query successfully. (Choose three.)
94	1z0-071	Which two statements are true about views? (Choose two.)
96	1z0-071	Which two are true about unused columns? (Choose two.)
97	1z0-071	Examine the data in the CUST_NAME column of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image7.png\nYou want to display the CUST_NAME values where the last name starts with Mc or MC.\nWhich two WHERE clauses give the required result? (Choose two.)
98	1z0-071	Which is the default column or columns for sorting output from compound queries using SET operators such as INTERSECT in a SQL statement?
99	1z0-071	Which two statements are true about the ORDER BY clause? (Choose two.)
100	1z0-071	Examine the BRICKS table:\nhttps://img.examtopics.com/1z0-071/image8.png\nYou write this query:\nhttps://img.examtopics.com/1z0-071/image9.png\nHow many rows will the query return?
101	1z0-071	Examine this query:\nSELECT INTERVAL ‘100’ MONTH DURATION FROM DUAL;\nWhat will be the output?
102	1z0-071	Examine this query:\nSELECT TRUNC(ROUND(156.00,-2),-1) FROM DUAL;\nWhat is the result?
103	1z0-071	You want to write a query that prompts for two column names and the where condition each time it is executed in a session but only prompts for the table name the first time it is executed.\nThe variables used in your query are never undefined in your session.\nWhich query can be used?
104	1z0-071	Which three statements are true about indexes and their administration in an Oracle database? (Choose three.)
105	1z0-071	Examine this description of the EMP table:\nhttps://img.examtopics.com/1z0-071/image15.png\nYou execute this query:\nhttps://img.examtopics.com/1z0-071/image16.png\nWhat is the result?
106	1z0-071	Which two are true about virtual columns? (Choose two.)
107	1z0-071	A session's NLS_DATE_FORMAT is set to DD Mon YYYY.\nWhich two queries return the value 1 Jan 2019? (Choose two.)
108	1z0-071	Examine this SQL statement:\nhttps://img.examtopics.com/1z0-071/image17.png\nWhich two are true? (Choose two.)
109	1z0-071	Examine this constraint information:\nhttps://img.examtopics.com/1z0-071/image18.png\nWhich three statements are true? (Choose three.)
110	1z0-071	Which two are true about creating tables in an Oracle database? (Choose two.)
111	1z0-071	Examine this partial statement:\nSELECT ename, sal, comm FROM emp\nNow examine this output:\nhttps://img.examtopics.com/1z0-071/image19.png\nWhich ORDER BY clause will generate the displayed output?
112	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image20.png\nWhich two SELECT statements will return these results: (Choose two.)\nhttps://img.examtopics.com/1z0-071/image21.png
113	1z0-071	The PRODUCT_INFORMATION table has a UNIT_PRICE column of data type NUMBER(8,2).\nEvaluate this SQL statement:\nSELECT TO_CHAR(unit_price, '$9,999') FROM product_information;\nWhich two statements are true about the output? (Choose two.)
114	1z0-071	Which two statements are true about Oracle databases and SQL? (Choose two.)
115	1z0-071	Which statement is true about TRUNCATE and DELETE?
116	1z0-071	Which two statements are true? (Choose two.)
117	1z0-071	Examine these statements executed in a single Oracle session:\nhttps://img.examtopics.com/1z0-071/image22.png\nWhich three statements are true? (Choose three.)
118	1z0-071	Which is true about the & and && prefixes with substitution variables? (Choose all that apply.)
119	1z0-071	Which statement will return a comma-separated list of employee names in alphabetical order for each department in the EMP table?
120	1z0-071	Examine the data in the COLORS table:\nhttps://img.examtopics.com/1z0-071/image27.png\nExamine the data in the BRICKS table:\nhttps://img.examtopics.com/1z0-071/image28.png\nWhich two queries return all the rows from COLORS? (Choose two.)
121	1z0-071	Which two queries execute successfully? (Choose two.)
122	1z0-071	Examine these statements which execute successfully:\nhttps://img.examtopics.com/1z0-071/image34.png\nExamine the result:\nhttps://img.examtopics.com/1z0-071/image35.png\nIf LOCALTIMESTAMP was selected at the same time, what would it return?
123	1z0-071	Examine these statements which execute successfully:\nhttps://img.examtopics.com/1z0-071/image36.png\nWhich two are true? (Choose two.)
124	1z0-071	Which two are true about granting privileges on objects? (Choose two.)
125	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image37.png\nWhich two queries will execute successfully? (Choose two.)
126	1z0-071	Which two statements are true about the rules of precedence for operators? (Choose two.)
127	1z0-071	Examine data in the BRICKS table:\nhttps://img.examtopics.com/1z0-071/image38.png\nExamine the BOXES table:\nhttps://img.examtopics.com/1z0-071/image39.png\nWhich two queries only return CUBE? (Choose two.)
128	1z0-071	Which two statements will return the names of the three employees with the lowest salaries? (Choose two.)
129	1z0-071	Examine this query which executes successfully:\nhttps://img.examtopics.com/1z0-071/image50.png\nWhat will be the result?
130	1z0-071	Which three statements are true about sequences in a single instance Oracle database? (Choose three.)
131	1z0-071	Examine this description of the PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image51.png\nYou successfully execute this command:\nCREATE TABLE new_prices (prod_id NUMBER(2), price NUMBER(8,2))\nWhich two statements execute without errors? (Choose two.)
132	1z0-071	The CUSTOMERS table has a CUST_CREDIT_LIMIT column of data type number.\nWhich two queries execute successfully? (Choose two.)
133	1z0-071	Examine this statement which executes successfully:\nhttps://img.examtopics.com/1z0-071/image56.png\nWhich statement will violate the CHECK constraint?
134	1z0-071	Which two are true about rollbacks? (Choose two.)
135	1z0-071	Which three statements are true about dropping and unused columns in an Oracle database? (Choose three.)
136	1z0-071	Which three actions can you perform by using the ORACLE_DATAPUMP access driver? (Choose three.)
137	1z0-071	Which statement is true about aggregate functions?
138	1z0-071	Which three are true about multitable INSERT statements? (Choose three.)
139	1z0-071	Which three statements are true regarding single row subqueries? (Choose three.)
140	1z0-071	In your session NLS_DATE_FORMAT is set to DD-MON-RR.\nWhich two queries display the year as four digits? (Choose two.)
141	1z0-071	Which two are true about savepoints? (Choose two.)
142	1z0-071	Examine these statements executed in a single Oracle session:\nhttps://img.examtopics.com/1z0-071/image61.png\nWhich three statements are true? (Choose three.)
187	1z0-071	Which two are true about multitable INSERT statements?
143	1z0-071	The ORDERS table has a column ORDER_DATE of data type DATE.\nThe default display format for a date is DD-MON-RR.\nWhich two WHERE conditions demonstrate the correct usage of conversion functions? (Choose two.)
144	1z0-071	Examine this query:\nhttps://img.examtopics.com/1z0-071/image62.png\nWhat is the result?
145	1z0-071	Which two object privileges can be restricted to a subset of columns in a table? (Choose two.)
146	1z0-071	Examine the description of the BOOKS table:\nhttps://img.examtopics.com/1z0-071/image63.png\nExamine these requirements:\n1. Display book titles for books purchased before January 17, 2007 costing less than 500 or more than 1000.\n2. Sort the titles by date of purchase, starting with the most recently purchased book.\nWhich two queries can be used? (Choose two.)
147	1z0-071	View the Exhibit and examine the description of the tables.\nYou execute this SQL statement:\nhttps://img.examtopics.com/1z0-071/image69.png\nWhich three statements are true? (Choose three.)
148	1z0-071	Which three statements are true about an ORDER BY clause? (Choose three.)
149	1z0-071	Examine the description of EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image70.png\nWhich three queries return all rows for which SALARY + COMMISSION is greater than 20000? (Choose three.)
150	1z0-071	Examine the description of EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image71.png\nThe session time zone is the same as the database server.\nWhich two statements will list only the employees who have been working with the company for more than five years? (Choose two.)
151	1z0-071	Which two queries return the string Hello! We're ready? (Choose two.)
152	1z0-071	Which three statements are true about the DESCRIBE command? (Choose three.)
153	1z0-071	Which two statements are true about dropping views? (Choose two.)
154	1z0-071	Which two are true about the MERGE statement? (Choose two.)
155	1z0-071	Which two statements are true regarding non-equijoins? (Choose two.)
156	1z0-071	Examine the description of the PRODUCTS table which contains data:\nhttps://img.examtopics.com/1z0-071/image72.png\nWhich two are true? (Choose two.)
157	1z0-071	Examine this query:\nSELECT SUBSTR(SYSDATE, 1, 5) "Result" FROM DUAL;\nWhich statement is true?
158	1z0-071	Which statement is true about the INTERSECT operator used in compound queries?
159	1z0-071	You currently have an active transaction in your session and have been granted SELECT access to\nV$TRANSACTION.\nExecuting:\nSELECT xid, status FROM v$transaction;\nin your session returns:\nhttps://img.examtopics.com/1z0-071/image73.png\nIn which three situations will re-executing this query still return a row but with a different XID, indicating a new transaction has started? (Choose three.)
160	1z0-071	Which two statements are true about a full outer join? (Choose two.)
161	1z0-071	Which two statements are true about a self join? (Choose two.)
162	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image74.png\nWhich two statements will do an implicit conversion? (Choose two.)
163	1z0-071	Which two statements are true about CURRENT_TIMESTAMP? (Choose two.)
164	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image75.png\nYou want to display details of all customers who reside in cities starting with the letter D followed by at least two characters.\nWhich query can be used?
165	1z0-071	Which two are true about using the FOR UPDATE clause in a SELECT statement? (Choose two.)
166	1z0-071	You must find the number of employees whose salary is lower than employee 110.\nWhich statement fails to do this?
167	1z0-071	Examine this statement which returns the name of each employee and their manager:\nhttps://img.examtopics.com/1z0-071/image80.png\nYou want to extend the query to include employees with no manager. What must you add before JOIN to do this?
168	1z0-071	Which two are true about constraints? (Choose two.)
169	1z0-071	Examine the ORDER_ITEMS table:\nhttps://img.examtopics.com/1z0-071/image81.png\nWhich two queries return rows where QUANTITY is a multiple of ten? (Choose two.)
170	1z0-071	Which two statements are true about indexes and their administration in an Oracle database? (Choose two.)
171	1z0-071	Examine this incomplete query:\nSELECT DATE '2019-01-01' +\nFROM DUAL;Which three clauses can replace  to add 12 hours to the date? (Choose three.)
172	1z0-071	Which two are true about the data dictionary? (Choose two.)
173	1z0-071	Which two statements are true about the DUAL table: (Choose two.)
174	1z0-071	Which statement is true about TRUNCATE and DELETE?
175	1z0-071	Examine these statements and the result:\nhttps://img.examtopics.com/1z0-071/image82.png\nNow examine this command:\nhttps://img.examtopics.com/1z0-071/image83.png\nWhat must replace MISSING CLAUSE for CUSTOMER_SEQ.NEXTVAL to return 11?
176	1z0-071	Examine the description of the ORDER_ITEMS table:\nhttps://img.examtopics.com/1z0-071/image84.png\nExamine this incomplete query:\nhttps://img.examtopics.com/1z0-071/image85.png\nWhich two can replace\nso the query completes successfully?
177	1z0-071	Which set of commands will prompt only once for the name of the table to use in the query?
178	1z0-071	The CUSTOMERS table has a CUST_LAST_NAME column of data type VARCHAR2.\nThe table has two rows whose CUST_LAST_NAME values are Anderson and Ausson.\nWhich query produces output for CUST_LAST_NAME containing Oder for the first row and Aus for the second?
179	1z0-071	Examine the description of the PRODUCT_STATUS table:\nhttps://img.examtopics.com/1z0-071/image86.png\nThe STATUS column contains the values IN STOCK or OUT OF STOCK for each row. Which two queries will execute successfully?
180	1z0-071	Which two statements are true about INTERVAL data types?
181	1z0-071	Which two statements are true about the data dictionary?
182	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image87.png\nYou need to display last names and credit limits of all customers whose last name starts with A or B in lower or upper case, and whose credit limit is below 1000.\nExamine this partial query:\nSELECT cust_last_name, cust_credit_limit FROM customers\nWhich two WHERE conditions give the required result?
183	1z0-071	Which two statements are true about substitution variables?
184	1z0-071	Which two are true about scalar subquery expressions?
185	1z0-071	Examine the description PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image88.png\nExamine the description of the NEW_PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image89.png\nWhich two queries execute successfully?
186	1z0-071	Which three statements are true about Data Manipulation Language (DML)?
189	1z0-071	You execute these commands:\nhttps://img.examtopics.com/1z0-071/image90.png\nWhich two, used independently, can replace\nso the query returns 1?
190	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image91.png\nWhich two queries return the highest salary in the table?
191	1z0-071	Examine this data in the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image92.png\nWhich statement will execute successfully?
192	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image93.png\nNLS_DATE_FORMAT is set to DD-MON-YY.\nWhich query requires explicit data type conversion?
193	1z0-071	Which three statements are true about external tables? (Choose three.)
194	1z0-071	Table HR.EMPLOYEES contains a row where the EMPLOYEE_ID is 109.\nUser ALICE has no privileges to access HR.EMPLOYEES.\nUser ALICE starts a session.\nUser HR starts a session and successfully executes these statements:\nGRANT DELETE ON employees TO alice;\nUPDATE employees SET salary = 24000 WHERE employee_id = 109;\nIn her existing session ALICE then executes:\nDELETE FROM hr.employees WHERE employee_id = 109;\nWhat is the result?
195	1z0-071	Which three statements are true about performing DML operations on a view with no INSTEAD OF triggers defined? (Choose three.)
196	1z0-071	In the PROMOTIONS table, the PROMO_BEGIN_DATE column is of data type DATE and the default date format is DD-MON-RR.\nWhich two statements are true about expressions using PROMO_BEGIN_DATE contained in a query? (Choose two.)
197	1z0-071	You have the privileges to create any type of synonym.\nWhich statement will create a synonym called EMP for the HCM.EMPLOYEE_RECORDS table that is accessible to all users?
198	1z0-071	Which two statements are true about the ORDER BY clause when used with a SQL statement containing a SET operator such as UNION?
199	1z0-071	Which two statements are true about the results of using the INTERSECT operator in compound queries? (Choose two.)
200	1z0-071	Examine these statements:\nhttps://img.examtopics.com/1z0-071/image94.png\nWhich is true about modifying the columns in ALTER_TEST?
201	1z0-071	You and your colleague Andrew have these privileges on the EMPLOYEE_RECORDS table:\n1. SELECT\n2. INSERT\n3. UPDATE\n4. DELETE\nYou connect to the database instance and perform an update to some of the rows in EMPLOYEE_RECORDS, but do not commit yet.\nAndrew connects to the database instance and queries the table.\nNo other users are accessing the table.\nWhich two statements are true at this point? (Choose two.)
202	1z0-071	Which two statements cause changes to the data dictionary? (Choose two.)
203	1z0-071	Examine the description of the ORDERS table:\nhttps://img.examtopics.com/1z0-071/image95.png\nExamine the description of the INVOICES table:\nhttps://img.examtopics.com/1z0-071/image96.png\nWhich three statements execute successfully? (Choose three.)
204	1z0-071	Which two queries execute successfully? (Choose two.)
205	1z0-071	Examine the description of the PRODUCT_INFORMATION table:\nhttps://img.examtopics.com/1z0-071/image97.png\nWhich query retrieves the number of products with a null list price?
206	1z0-071	Examine this partial statement:\nhttps://img.examtopics.com/1z0-071/image98.png\nWhich is true?
207	1z0-071	The ORDERS table has a primary key constraint on the ORDER_ID column.\nThe ORDER_ITEMS table has a foreign key constraint on the ORDER_ID column, referencing the primary key of the ORDERS table.\nThe constraint is defined with ON DELETE CASCADE.\nThere are rows in the ORDERS table with an ORDER_TOTAL of less than 1000.\nWhich three DELETE statements execute successfully? (Choose three.)
208	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image99.png\nFor customers whose income level has a value, you want to display the first name and due amount as 5% of their credit limit. Customers whose due amount is null should not be displayed.\nWhich query should be used?
209	1z0-071	Examine this statement:\nhttps://img.examtopics.com/1z0-071/image100.png\nWhich two things must be changed for it to execute successfully? (Choose two.)
210	1z0-071	Which statement executes successfully?
211	1z0-071	The SYSDATE function displays the current Oracle Server date as:\n21-MAY-19\nYou wish to display the date as -\nMONDAY, 21 MAY, 2019 -\nWhich statement will do this?
212	1z0-071	Examine this query and its output:\nhttps://img.examtopics.com/1z0-071/image101.png\nExamine this query with an incomplete WHERE clause:\nhttps://img.examtopics.com/1z0-071/image102.png\nWhich two are true about operators that can be used in the WHERE clause? (Choose two.)
213	1z0-071	Examine this statement which executes successfully:\nhttps://img.examtopics.com/1z0-071/image103.png\nWhich is true?
214	1z0-071	Which three statements are true about GLOBAL TEMPORARY TABLES? (Choose three.)
215	1z0-071	Examine the description of the BOOKS_TRANSACTIONS table:\nhttps://img.examtopics.com/1z0-071/image104.png\nExamine this partial SQL statement:\nSELECT * FROM books_transactions\nWhich two WHERE conditions give the same result? (Choose two.)
216	1z0-071	You need to calculate the number of days from 1st January 2019 until today.\nDates are stored in the default format of DD-MON-RR.\nWhich two queries give the required output? (Choose two.)
217	1z0-071	Examine this description of the PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image105.png\nRows exist in this table with data in all the columns. You put the PRODUCTS table in read-only mode.\nWhich three commands execute successfully on PRODUCTS? (Choose three.)
218	1z0-071	Which two statements are true about Oracle synonyms? (Choose two.)
219	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image106.png\nYou write this failing statement:\nhttps://img.examtopics.com/1z0-071/image107.png\nWhich clause causes the error?
220	1z0-071	Evaluate these commands which execute successfully:\nhttps://img.examtopics.com/1z0-071/image108.png\nWhich two statements are true about the ORD_ITEMS table and the ORD_SEQ sequence? (Choose two.)
221	1z0-071	Which three statements are true about time zones, date data types, and timestamp data types in an Oracle database? (Choose three.)
222	1z0-071	Which two statements about INVISIBLE indexes are true? (Choose two.)
223	1z0-071	Which three are true about subqueries? (Choose three.)
224	1z0-071	Which two statements are true about Entity Relationships? (Choose two.)
225	1z0-071	Which two are true about self joins? (Choose two.)
226	1z0-071	Examine these statements and results:\nhttps://img.examtopics.com/1z0-071/image109.png\nHow many rows are retrieved by the last query?
227	1z0-071	Which two are SQL features? (Choose two.)
228	1z0-071	Examine the description of the COUNTRIES table:\nhttps://img.examtopics.com/1z0-071/image110.png\nExamine the description of the DEPARTMENTS table:\nhttps://img.examtopics.com/1z0-071/image111.png\nExamine the description of the LOCATIONS table:\nhttps://img.examtopics.com/1z0-071/image112.png\nWhich two queries will return a list of countries with no departments? (Choose two.)
229	1z0-071	Which four statements are true about constraints on Oracle tables? (Choose four.)
230	1z0-071	User HR has CREATE SESSION, CREATE ANY TABLE and UNLIMITED TABLESPACE privileges.\nUser SCOTT has CREATE SESSION, CREATE TABLE and UNLIMITED TABLESPACE privileges.\nHR successfully executes this statement:\nhttps://img.examtopics.com/1z0-071/image117.png\nHR attempts to execute:\n1. INSERT INTO scott.products VALUES (1, 'LAPTOP');\nSCOTT attempts to execute:\n2. SELECT * FROM products;\n3. INSERT INTO scott.products VALUES (2, 'HDD');\n4. CREATE SYNONYM prod FOR products;\nWhich will execute successfully?
231	1z0-071	Examine the contents of the EMP table:\nhttps://img.examtopics.com/1z0-071/image118.png\nExamine this query that executes successfully:\nhttps://img.examtopics.com/1z0-071/image119.png\nWhat is the result?
232	1z0-071	You create a table by using this command:\nCREATE TABLE rate_list (rate NUMBER(6,2));\nWhich two are true about executing statements? (Choose two.)
233	1z0-071	Examine this list of queries:\nhttps://img.examtopics.com/1z0-071/image120.png\nWhich two statements are true? (Choose two.)
234	1z0-071	Examine the data in the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image121.png\nWhich statement will compute the total annual compensation for each employee?
235	1z0-071	Examine the data in the PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image122.png\nExamine these queries:\nhttps://img.examtopics.com/1z0-071/image123.png\nWhich queries generate the same output?
236	1z0-071	Which statement fails to execute successfully?
237	1z0-071	Examine these statements which execute successfully:\nhttps://img.examtopics.com/1z0-071/image128.png\nBoth statements display departments ordered by their average salaries.\nWhich two are true? (Choose two.)
238	1z0-071	Which three are true about the MERGE statement? (Choose three.)
239	1z0-071	Which three statements are true about defining relations between tables in a relational database? (Choose three.)
240	1z0-071	Which two join conditions in a FROM clause are non-equijoins? (Choose two.)
241	1z0-071	Which two statements are true regarding the UNION and UNION ALL operators? (Choose two.)
242	1z0-071	Which three actions can you perform only with system privileges? (Choose three.)
243	1z0-071	1. MANAGER is an existing role with no privileges or roles.\n2. EMP is an existing role containing the CREATE TABLE privilege.\n3. EMPLOYEES is an existing table in the HR schema.\nWhich two commands execute successfully? (Choose two.)
244	1z0-071	Which two statements will convert the string Hello World to ello world? (Choose two.)
245	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image129.png\nExamine these requirements:\n1.\tDisplay the last name, date of hire and the number of years of service for each employee.\n2.\tIf the employee has been employed 5 or more years but less than 10, display “5+ years of service”.\n3.\tIf the employee has been employed 10 or more years but less than 15, display “10+ years of service”.\n4.\tIf the employee has been employed 15 or more years, display “15+ years of service”.\n5.\tIf none of these conditions matches, display “<5 years of service”.\n6.\tSort the results by the HIRE_DATE column.\nWhich statement satisfies all the requirements?
246	1z0-071	Which three actions can you perform by using the ALTER TABLE command? (Choose three.)
247	1z0-071	Which three statements are true about built-in data types? (Choose three.)
248	1z0-071	Which three are true about granting object privileges on tables, views, and sequences? (Choose three.)
249	1z0-071	Examine the description of the CUSTOMERS table:\nhttps://img.examtopics.com/1z0-071/image134.png\nCUSTNO is the PRIMARY KEY.\nYou must determine if any customers’ details have been entered more than once using a different CUSTNO, by listing all duplicate names.\nWhich two methods can you use to get the required result? (Choose two.)
250	1z0-071	Which two statements are true regarding a SAVEPOINT? (Choose two.)
251	1z0-071	Examine the description of the TRANSACTIONS table:\nhttps://img.examtopics.com/1z0-071/image135.png\nWhich two SQL statements execute successfully? (Choose two.)
252	1z0-071	Which three are true about system and object privileges? (Choose three.)
253	1z0-071	Which two statements are true about external tables? (Choose two.)
254	1z0-071	Examine this schema information:\n1. EMPLOYEES.DEPARTMENT_ID has a foreign key referencing DEPARTMENTS.DEPARTMENT_ID.\n2. EMP_VIEW is based on the EMPLOYEES and DEPARTMENTS tables.\n3. EMP_VIEW has columns EMPLOYEE_ID, EMPLOYEE_NAME and DEPARTMENT_NAME.\nYou must add a new column, MANAGER_ID, from the EMPLOYEES table, to the view,  showing each employee’s manager.\nWhich statement will do this?
255	1z0-071	Which three are true about privileges and roles? (Choose three.)
256	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image136.png\nExamine these requirements:\n1. Display the manager id and salary of the lowest paid employee for that manager.\n2. Exclude anyone whose manager is not known.\n3. Exclude any managers where the minimum salary is 6000 or less.\n4. Sort the output by minimum salary with the highest salary shown first.\nWhich statement will do this?
257	1z0-071	Which two are true about the WITH GRANT OPTION clause? (Choose two.)
258	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image141.png\nWhich query is valid?
259	1z0-071	Which statement will return the last sequence number generated by the EMP_SEQ sequence?
260	1z0-071	Examine the description of the SALES table:\nhttps://img.examtopics.com/1z0-071/image142.png\nThe SALES table has 55,000 rows.\nExamine this statement:\nhttps://img.examtopics.com/1z0-071/image143.png\nWhich two statements are true? (Choose two.)
261	1z0-071	Which two statements are true about single row functions? (Choose two.)
262	1z0-071	Examine the data in the ORDERS table:\nhttps://img.examtopics.com/1z0-071/image144.png\nExamine the data in the INVOICES table:\nhttps://img.examtopics.com/1z0-071/image145.png\nExamine this query:\nhttps://img.examtopics.com/1z0-071/image146.png\nWhich three rows will it return? (Choose three.)
263	1z0-071	Examine this query:\nSELECT * FROM bricks, colors -\nWhich two statements are true? (Choose two.)
264	1z0-071	Examine the description of the EMPLOYEES table:\nhttps://img.examtopics.com/1z0-071/image147.png\nExamine this query:\nhttps://img.examtopics.com/1z0-071/image148.png\nWhich line produces an error?
265	1z0-071	Which two are true about the USING clause when joining tables? (Choose two.)
266	1z0-071	Which two statements are true about date/time functions in a session where\nNLS_DATE_FORMAT is set to DD-MON-YYYY HH24:MI:SS? (Choose two.)
267	1z0-071	You execute this command:\nALTER TABLE employees SET UNUSED (department_id);\nWhich two are true? (Choose two.)
268	1z0-071	Which three are true about the CREATE TABLE command? (Choose three.)
269	1z0-071	Examine this description of the PRODUCTS table:\nhttps://img.examtopics.com/1z0-071/image149.png\nRows exist in this table with data in all the columns. You put the PRODUCTS table in read-only mode.\nWhich three commands execute successfully on PRODUCTS? (Choose three.)
270	1z0-071	Which four statements are true regarding primary and foreign key constraints and the effect they can have on table data? (Choose four.)
271	1z0-071	Examine this statement:\nhttps://img.examtopics.com/1z0-071/image150.png\nWhich two are true? (Choose two.)
272	1z0-071	Which two are true to create an index in your own schema for a table owned by another schema? (Choose two.)
\.


--
-- Data for Name: questionslink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionslink (number, exam, link) FROM stdin;
1	1z0-071	https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/
2	1z0-071	https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/
3	1z0-071	https://www.examtopics.com/discussions/oracle/view/82940-exam-1z0-071-topic-1-question-3-discussion/
5	1z0-071	https://www.examtopics.com/discussions/oracle/view/79891-exam-1z0-071-topic-1-question-5-discussion/
6	1z0-071	https://www.examtopics.com/discussions/oracle/view/80096-exam-1z0-071-topic-1-question-6-discussion/
7	1z0-071	https://www.examtopics.com/discussions/oracle/view/85690-exam-1z0-071-topic-1-question-7-discussion/
4	1z0-071	https://www.examtopics.com/discussions/oracle/view/79642-exam-1z0-071-topic-1-question-4-discussion/
8	1z0-071	https://www.examtopics.com/discussions/oracle/view/82816-exam-1z0-071-topic-1-question-8-discussion/
9	1z0-071	https://www.examtopics.com/discussions/oracle/view/79955-exam-1z0-071-topic-1-question-9-discussion/
10	1z0-071	https://www.examtopics.com/discussions/oracle/view/84145-exam-1z0-071-topic-1-question-10-discussion/
11	1z0-071	https://www.examtopics.com/discussions/oracle/view/79964-exam-1z0-071-topic-1-question-11-discussion/
12	1z0-071	https://www.examtopics.com/discussions/oracle/view/94379-exam-1z0-071-topic-1-question-12-discussion/
13	1z0-071	https://www.examtopics.com/discussions/oracle/view/85728-exam-1z0-071-topic-1-question-13-discussion/
14	1z0-071	https://www.examtopics.com/discussions/oracle/view/85230-exam-1z0-071-topic-1-question-14-discussion/
15	1z0-071	https://www.examtopics.com/discussions/oracle/view/116310-exam-1z0-071-topic-1-question-15-discussion/
16	1z0-071	https://www.examtopics.com/discussions/oracle/view/82975-exam-1z0-071-topic-1-question-16-discussion/
17	1z0-071	https://www.examtopics.com/discussions/oracle/view/79980-exam-1z0-071-topic-1-question-17-discussion/
18	1z0-071	https://www.examtopics.com/discussions/oracle/view/82978-exam-1z0-071-topic-1-question-18-discussion/
19	1z0-071	https://www.examtopics.com/discussions/oracle/view/89169-exam-1z0-071-topic-1-question-19-discussion/
20	1z0-071	https://www.examtopics.com/discussions/oracle/view/106362-exam-1z0-071-topic-1-question-20-discussion/
21	1z0-071	https://www.examtopics.com/discussions/oracle/view/96807-exam-1z0-071-topic-1-question-21-discussion/
22	1z0-071	https://www.examtopics.com/discussions/oracle/view/81121-exam-1z0-071-topic-1-question-22-discussion/
23	1z0-071	https://www.examtopics.com/discussions/oracle/view/83008-exam-1z0-071-topic-1-question-23-discussion/
24	1z0-071	https://www.examtopics.com/discussions/oracle/view/92435-exam-1z0-071-topic-1-question-24-discussion/
25	1z0-071	https://www.examtopics.com/discussions/oracle/view/96827-exam-1z0-071-topic-1-question-25-discussion/
26	1z0-071	https://www.examtopics.com/discussions/oracle/view/83010-exam-1z0-071-topic-1-question-26-discussion/
27	1z0-071	https://www.examtopics.com/discussions/oracle/view/83015-exam-1z0-071-topic-1-question-27-discussion/
28	1z0-071	https://www.examtopics.com/discussions/oracle/view/80004-exam-1z0-071-topic-1-question-28-discussion/
29	1z0-071	https://www.examtopics.com/discussions/oracle/view/86448-exam-1z0-071-topic-1-question-29-discussion/
30	1z0-071	https://www.examtopics.com/discussions/oracle/view/108917-exam-1z0-071-topic-1-question-30-discussion/
31	1z0-071	https://www.examtopics.com/discussions/oracle/view/82835-exam-1z0-071-topic-1-question-31-discussion/
32	1z0-071	https://www.examtopics.com/discussions/oracle/view/80842-exam-1z0-071-topic-1-question-32-discussion/
33	1z0-071	https://www.examtopics.com/discussions/oracle/view/82839-exam-1z0-071-topic-1-question-33-discussion/
34	1z0-071	https://www.examtopics.com/discussions/oracle/view/108706-exam-1z0-071-topic-1-question-34-discussion/
35	1z0-071	https://www.examtopics.com/discussions/oracle/view/84521-exam-1z0-071-topic-1-question-35-discussion/
36	1z0-071	https://www.examtopics.com/discussions/oracle/view/106465-exam-1z0-071-topic-1-question-36-discussion/
37	1z0-071	https://www.examtopics.com/discussions/oracle/view/117009-exam-1z0-071-topic-1-question-37-discussion/
38	1z0-071	https://www.examtopics.com/discussions/oracle/view/106467-exam-1z0-071-topic-1-question-38-discussion/
39	1z0-071	https://www.examtopics.com/discussions/oracle/view/86179-exam-1z0-071-topic-1-question-39-discussion/
40	1z0-071	https://www.examtopics.com/discussions/oracle/view/94583-exam-1z0-071-topic-1-question-40-discussion/
74	1z0-071	https://www.examtopics.com/discussions/oracle/view/80069-exam-1z0-071-topic-1-question-74-discussion/
75	1z0-071	https://www.examtopics.com/discussions/oracle/view/110748-exam-1z0-071-topic-1-question-75-discussion/
76	1z0-071	https://www.examtopics.com/discussions/oracle/view/80072-exam-1z0-071-topic-1-question-76-discussion/
77	1z0-071	https://www.examtopics.com/discussions/oracle/view/110366-exam-1z0-071-topic-1-question-77-discussion/
78	1z0-071	https://www.examtopics.com/discussions/oracle/view/111879-exam-1z0-071-topic-1-question-78-discussion/
79	1z0-071	https://www.examtopics.com/discussions/oracle/view/93006-exam-1z0-071-topic-1-question-79-discussion/
80	1z0-071	https://www.examtopics.com/discussions/oracle/view/90051-exam-1z0-071-topic-1-question-80-discussion/
81	1z0-071	https://www.examtopics.com/discussions/oracle/view/106918-exam-1z0-071-topic-1-question-81-discussion/
82	1z0-071	https://www.examtopics.com/discussions/oracle/view/106926-exam-1z0-071-topic-1-question-82-discussion/
83	1z0-071	https://www.examtopics.com/discussions/oracle/view/90052-exam-1z0-071-topic-1-question-83-discussion/
84	1z0-071	https://www.examtopics.com/discussions/oracle/view/90063-exam-1z0-071-topic-1-question-84-discussion/
85	1z0-071	https://www.examtopics.com/discussions/oracle/view/129415-exam-1z0-071-topic-1-question-85-discussion/
86	1z0-071	https://www.examtopics.com/discussions/oracle/view/127882-exam-1z0-071-topic-1-question-86-discussion/
87	1z0-071	https://www.examtopics.com/discussions/oracle/view/131302-exam-1z0-071-topic-1-question-87-discussion/
88	1z0-071	https://www.examtopics.com/discussions/oracle/view/93007-exam-1z0-071-topic-1-question-88-discussion/
89	1z0-071	https://www.examtopics.com/discussions/oracle/view/105341-exam-1z0-071-topic-1-question-89-discussion/
90	1z0-071	https://www.examtopics.com/discussions/oracle/view/90058-exam-1z0-071-topic-1-question-90-discussion/
91	1z0-071	https://www.examtopics.com/discussions/oracle/view/90071-exam-1z0-071-topic-1-question-91-discussion/
92	1z0-071	https://www.examtopics.com/discussions/oracle/view/116900-exam-1z0-071-topic-1-question-92-discussion/
93	1z0-071	https://www.examtopics.com/discussions/oracle/view/117947-exam-1z0-071-topic-1-question-93-discussion/
94	1z0-071	https://www.examtopics.com/discussions/oracle/view/104079-exam-1z0-071-topic-1-question-94-discussion/
95	1z0-071	https://www.examtopics.com/discussions/oracle/view/89220-exam-1z0-071-topic-1-question-95-discussion/
96	1z0-071	https://www.examtopics.com/discussions/oracle/view/110310-exam-1z0-071-topic-1-question-96-discussion/
97	1z0-071	https://www.examtopics.com/discussions/oracle/view/90078-exam-1z0-071-topic-1-question-97-discussion/
98	1z0-071	https://www.examtopics.com/discussions/oracle/view/90079-exam-1z0-071-topic-1-question-98-discussion/
99	1z0-071	https://www.examtopics.com/discussions/oracle/view/110794-exam-1z0-071-topic-1-question-99-discussion/
100	1z0-071	https://www.examtopics.com/discussions/oracle/view/110382-exam-1z0-071-topic-1-question-100-discussion/
101	1z0-071	https://www.examtopics.com/discussions/oracle/view/94747-exam-1z0-071-topic-1-question-101-discussion/
102	1z0-071	https://www.examtopics.com/discussions/oracle/view/100357-exam-1z0-071-topic-1-question-102-discussion/
103	1z0-071	https://www.examtopics.com/discussions/oracle/view/90081-exam-1z0-071-topic-1-question-103-discussion/
104	1z0-071	https://www.examtopics.com/discussions/oracle/view/90082-exam-1z0-071-topic-1-question-104-discussion/
105	1z0-071	https://www.examtopics.com/discussions/oracle/view/101744-exam-1z0-071-topic-1-question-105-discussion/
106	1z0-071	https://www.examtopics.com/discussions/oracle/view/101688-exam-1z0-071-topic-1-question-106-discussion/
107	1z0-071	https://www.examtopics.com/discussions/oracle/view/117081-exam-1z0-071-topic-1-question-107-discussion/
108	1z0-071	https://www.examtopics.com/discussions/oracle/view/102475-exam-1z0-071-topic-1-question-108-discussion/
109	1z0-071	https://www.examtopics.com/discussions/oracle/view/93055-exam-1z0-071-topic-1-question-109-discussion/
110	1z0-071	https://www.examtopics.com/discussions/oracle/view/126129-exam-1z0-071-topic-1-question-110-discussion/
111	1z0-071	https://www.examtopics.com/discussions/oracle/view/119640-exam-1z0-071-topic-1-question-111-discussion/
112	1z0-071	https://www.examtopics.com/discussions/oracle/view/94847-exam-1z0-071-topic-1-question-112-discussion/
113	1z0-071	https://www.examtopics.com/discussions/oracle/view/104197-exam-1z0-071-topic-1-question-113-discussion/
114	1z0-071	https://www.examtopics.com/discussions/oracle/view/136983-exam-1z0-071-topic-1-question-114-discussion/
115	1z0-071	https://www.examtopics.com/discussions/oracle/view/90622-exam-1z0-071-topic-1-question-115-discussion/
116	1z0-071	https://www.examtopics.com/discussions/oracle/view/91209-exam-1z0-071-topic-1-question-116-discussion/
117	1z0-071	https://www.examtopics.com/discussions/oracle/view/126132-exam-1z0-071-topic-1-question-117-discussion/
118	1z0-071	https://www.examtopics.com/discussions/oracle/view/114488-exam-1z0-071-topic-1-question-118-discussion/
119	1z0-071	https://www.examtopics.com/discussions/oracle/view/134130-exam-1z0-071-topic-1-question-119-discussion/
120	1z0-071	https://www.examtopics.com/discussions/oracle/view/91138-exam-1z0-071-topic-1-question-120-discussion/
121	1z0-071	https://www.examtopics.com/discussions/oracle/view/113166-exam-1z0-071-topic-1-question-121-discussion/
122	1z0-071	https://www.examtopics.com/discussions/oracle/view/147819-exam-1z0-071-topic-1-question-122-discussion/
123	1z0-071	https://www.examtopics.com/discussions/oracle/view/95045-exam-1z0-071-topic-1-question-123-discussion/
124	1z0-071	https://www.examtopics.com/discussions/oracle/view/126136-exam-1z0-071-topic-1-question-124-discussion/
125	1z0-071	https://www.examtopics.com/discussions/oracle/view/107164-exam-1z0-071-topic-1-question-125-discussion/
126	1z0-071	https://www.examtopics.com/discussions/oracle/view/149837-exam-1z0-071-topic-1-question-126-discussion/
127	1z0-071	https://www.examtopics.com/discussions/oracle/view/100554-exam-1z0-071-topic-1-question-127-discussion/
128	1z0-071	https://www.examtopics.com/discussions/oracle/view/96939-exam-1z0-071-topic-1-question-128-discussion/
129	1z0-071	https://www.examtopics.com/discussions/oracle/view/100566-exam-1z0-071-topic-1-question-129-discussion/
130	1z0-071	https://www.examtopics.com/discussions/oracle/view/93118-exam-1z0-071-topic-1-question-130-discussion/
131	1z0-071	https://www.examtopics.com/discussions/oracle/view/100572-exam-1z0-071-topic-1-question-131-discussion/
132	1z0-071	https://www.examtopics.com/discussions/oracle/view/100573-exam-1z0-071-topic-1-question-132-discussion/
133	1z0-071	https://www.examtopics.com/discussions/oracle/view/90219-exam-1z0-071-topic-1-question-133-discussion/
134	1z0-071	https://www.examtopics.com/discussions/oracle/view/149671-exam-1z0-071-topic-1-question-134-discussion/
135	1z0-071	https://www.examtopics.com/discussions/oracle/view/136992-exam-1z0-071-topic-1-question-135-discussion/
136	1z0-071	https://www.examtopics.com/discussions/oracle/view/100574-exam-1z0-071-topic-1-question-136-discussion/
137	1z0-071	https://www.examtopics.com/discussions/oracle/view/100575-exam-1z0-071-topic-1-question-137-discussion/
138	1z0-071	https://www.examtopics.com/discussions/oracle/view/100578-exam-1z0-071-topic-1-question-138-discussion/
139	1z0-071	https://www.examtopics.com/discussions/oracle/view/139689-exam-1z0-071-topic-1-question-139-discussion/
140	1z0-071	https://www.examtopics.com/discussions/oracle/view/90220-exam-1z0-071-topic-1-question-140-discussion/
141	1z0-071	https://www.examtopics.com/discussions/oracle/view/100581-exam-1z0-071-topic-1-question-141-discussion/
142	1z0-071	https://www.examtopics.com/discussions/oracle/view/99298-exam-1z0-071-topic-1-question-142-discussion/
143	1z0-071	https://www.examtopics.com/discussions/oracle/view/100583-exam-1z0-071-topic-1-question-143-discussion/
144	1z0-071	https://www.examtopics.com/discussions/oracle/view/99299-exam-1z0-071-topic-1-question-144-discussion/
145	1z0-071	https://www.examtopics.com/discussions/oracle/view/100586-exam-1z0-071-topic-1-question-145-discussion/
146	1z0-071	https://www.examtopics.com/discussions/oracle/view/99300-exam-1z0-071-topic-1-question-146-discussion/
147	1z0-071	https://www.examtopics.com/discussions/oracle/view/100588-exam-1z0-071-topic-1-question-147-discussion/
148	1z0-071	https://www.examtopics.com/discussions/oracle/view/104317-exam-1z0-071-topic-1-question-148-discussion/
149	1z0-071	https://www.examtopics.com/discussions/oracle/view/100669-exam-1z0-071-topic-1-question-149-discussion/
150	1z0-071	https://www.examtopics.com/discussions/oracle/view/100978-exam-1z0-071-topic-1-question-150-discussion/
151	1z0-071	https://www.examtopics.com/discussions/oracle/view/100190-exam-1z0-071-topic-1-question-151-discussion/
152	1z0-071	https://www.examtopics.com/discussions/oracle/view/100139-exam-1z0-071-topic-1-question-152-discussion/
153	1z0-071	https://www.examtopics.com/discussions/oracle/view/104422-exam-1z0-071-topic-1-question-153-discussion/
154	1z0-071	https://www.examtopics.com/discussions/oracle/view/101416-exam-1z0-071-topic-1-question-154-discussion/
155	1z0-071	https://www.examtopics.com/discussions/oracle/view/148643-exam-1z0-071-topic-1-question-155-discussion/
156	1z0-071	https://www.examtopics.com/discussions/oracle/view/99875-exam-1z0-071-topic-1-question-156-discussion/
157	1z0-071	https://www.examtopics.com/discussions/oracle/view/100077-exam-1z0-071-topic-1-question-157-discussion/
158	1z0-071	https://www.examtopics.com/discussions/oracle/view/102300-exam-1z0-071-topic-1-question-158-discussion/
159	1z0-071	https://www.examtopics.com/discussions/oracle/view/99897-exam-1z0-071-topic-1-question-159-discussion/
160	1z0-071	https://www.examtopics.com/discussions/oracle/view/149732-exam-1z0-071-topic-1-question-160-discussion/
161	1z0-071	https://www.examtopics.com/discussions/oracle/view/150397-exam-1z0-071-topic-1-question-161-discussion/
162	1z0-071	https://www.examtopics.com/discussions/oracle/view/102298-exam-1z0-071-topic-1-question-162-discussion/
163	1z0-071	https://www.examtopics.com/discussions/oracle/view/99878-exam-1z0-071-topic-1-question-163-discussion/
164	1z0-071	https://www.examtopics.com/discussions/oracle/view/99898-exam-1z0-071-topic-1-question-164-discussion/
165	1z0-071	https://www.examtopics.com/discussions/oracle/view/104351-exam-1z0-071-topic-1-question-165-discussion/
166	1z0-071	https://www.examtopics.com/discussions/oracle/view/101413-exam-1z0-071-topic-1-question-166-discussion/
167	1z0-071	https://www.examtopics.com/discussions/oracle/view/149735-exam-1z0-071-topic-1-question-167-discussion/
168	1z0-071	https://www.examtopics.com/discussions/oracle/view/99435-exam-1z0-071-topic-1-question-168-discussion/
169	1z0-071	https://www.examtopics.com/discussions/oracle/view/117509-exam-1z0-071-topic-1-question-169-discussion/
170	1z0-071	https://www.examtopics.com/discussions/oracle/view/104356-exam-1z0-071-topic-1-question-170-discussion/
171	1z0-071	https://www.examtopics.com/discussions/oracle/view/99882-exam-1z0-071-topic-1-question-171-discussion/
172	1z0-071	https://www.examtopics.com/discussions/oracle/view/104641-exam-1z0-071-topic-1-question-172-discussion/
173	1z0-071	https://www.examtopics.com/discussions/oracle/view/106598-exam-1z0-071-topic-1-question-173-discussion/
174	1z0-071	https://www.examtopics.com/discussions/oracle/view/100170-exam-1z0-071-topic-1-question-174-discussion/
175	1z0-071	https://www.examtopics.com/discussions/oracle/view/117493-exam-1z0-071-topic-1-question-175-discussion/
176	1z0-071	https://www.examtopics.com/discussions/oracle/view/100786-exam-1z0-071-topic-1-question-176-discussion/
177	1z0-071	https://www.examtopics.com/discussions/oracle/view/99886-exam-1z0-071-topic-1-question-177-discussion/
178	1z0-071	https://www.examtopics.com/discussions/oracle/view/125602-exam-1z0-071-topic-1-question-178-discussion/
179	1z0-071	https://www.examtopics.com/discussions/oracle/view/99888-exam-1z0-071-topic-1-question-179-discussion/
180	1z0-071	https://www.examtopics.com/discussions/oracle/view/113231-exam-1z0-071-topic-1-question-180-discussion/
181	1z0-071	https://www.examtopics.com/discussions/oracle/view/126342-exam-1z0-071-topic-1-question-181-discussion/
182	1z0-071	https://www.examtopics.com/discussions/oracle/view/100765-exam-1z0-071-topic-1-question-182-discussion/
183	1z0-071	https://www.examtopics.com/discussions/oracle/view/100805-exam-1z0-071-topic-1-question-183-discussion/
184	1z0-071	https://www.examtopics.com/discussions/oracle/view/101805-exam-1z0-071-topic-1-question-184-discussion/
185	1z0-071	https://www.examtopics.com/discussions/oracle/view/99890-exam-1z0-071-topic-1-question-185-discussion/
186	1z0-071	https://www.examtopics.com/discussions/oracle/view/149809-exam-1z0-071-topic-1-question-186-discussion/
187	1z0-071	https://www.examtopics.com/discussions/oracle/view/113394-exam-1z0-071-topic-1-question-187-discussion/
188	1z0-071	https://www.examtopics.com/discussions/oracle/view/107303-exam-1z0-071-topic-1-question-188-discussion/
189	1z0-071	https://www.examtopics.com/discussions/oracle/view/99430-exam-1z0-071-topic-1-question-189-discussion/
190	1z0-071	https://www.examtopics.com/discussions/oracle/view/99431-exam-1z0-071-topic-1-question-190-discussion/
191	1z0-071	https://www.examtopics.com/discussions/oracle/view/99432-exam-1z0-071-topic-1-question-191-discussion/
192	1z0-071	https://www.examtopics.com/discussions/oracle/view/99434-exam-1z0-071-topic-1-question-192-discussion/
193	1z0-071	https://www.examtopics.com/discussions/oracle/view/99894-exam-1z0-071-topic-1-question-193-discussion/
194	1z0-071	https://www.examtopics.com/discussions/oracle/view/110354-exam-1z0-071-topic-1-question-194-discussion/
195	1z0-071	https://www.examtopics.com/discussions/oracle/view/100969-exam-1z0-071-topic-1-question-195-discussion/
196	1z0-071	https://www.examtopics.com/discussions/oracle/view/99427-exam-1z0-071-topic-1-question-196-discussion/
197	1z0-071	https://www.examtopics.com/discussions/oracle/view/149810-exam-1z0-071-topic-1-question-197-discussion/
198	1z0-071	https://www.examtopics.com/discussions/oracle/view/131989-exam-1z0-071-topic-1-question-198-discussion/
199	1z0-071	https://www.examtopics.com/discussions/oracle/view/99425-exam-1z0-071-topic-1-question-199-discussion/
200	1z0-071	https://www.examtopics.com/discussions/oracle/view/99423-exam-1z0-071-topic-1-question-200-discussion/
201	1z0-071	https://www.examtopics.com/discussions/oracle/view/99418-exam-1z0-071-topic-1-question-201-discussion/
202	1z0-071	https://www.examtopics.com/discussions/oracle/view/101808-exam-1z0-071-topic-1-question-202-discussion/
203	1z0-071	https://www.examtopics.com/discussions/oracle/view/99912-exam-1z0-071-topic-1-question-203-discussion/
204	1z0-071	https://www.examtopics.com/discussions/oracle/view/99307-exam-1z0-071-topic-1-question-204-discussion/
205	1z0-071	https://www.examtopics.com/discussions/oracle/view/99416-exam-1z0-071-topic-1-question-205-discussion/
206	1z0-071	https://www.examtopics.com/discussions/oracle/view/126316-exam-1z0-071-topic-1-question-206-discussion/
207	1z0-071	https://www.examtopics.com/discussions/oracle/view/99415-exam-1z0-071-topic-1-question-207-discussion/
208	1z0-071	https://www.examtopics.com/discussions/oracle/view/99413-exam-1z0-071-topic-1-question-208-discussion/
209	1z0-071	https://www.examtopics.com/discussions/oracle/view/99412-exam-1z0-071-topic-1-question-209-discussion/
210	1z0-071	https://www.examtopics.com/discussions/oracle/view/99409-exam-1z0-071-topic-1-question-210-discussion/
211	1z0-071	https://www.examtopics.com/discussions/oracle/view/100973-exam-1z0-071-topic-1-question-211-discussion/
212	1z0-071	https://www.examtopics.com/discussions/oracle/view/100902-exam-1z0-071-topic-1-question-212-discussion/
213	1z0-071	https://www.examtopics.com/discussions/oracle/view/126317-exam-1z0-071-topic-1-question-213-discussion/
214	1z0-071	https://www.examtopics.com/discussions/oracle/view/104488-exam-1z0-071-topic-1-question-214-discussion/
215	1z0-071	https://www.examtopics.com/discussions/oracle/view/126318-exam-1z0-071-topic-1-question-215-discussion/
216	1z0-071	https://www.examtopics.com/discussions/oracle/view/132045-exam-1z0-071-topic-1-question-216-discussion/
217	1z0-071	https://www.examtopics.com/discussions/oracle/view/104492-exam-1z0-071-topic-1-question-217-discussion/
218	1z0-071	https://www.examtopics.com/discussions/oracle/view/126321-exam-1z0-071-topic-1-question-218-discussion/
219	1z0-071	https://www.examtopics.com/discussions/oracle/view/126322-exam-1z0-071-topic-1-question-219-discussion/
220	1z0-071	https://www.examtopics.com/discussions/oracle/view/115822-exam-1z0-071-topic-1-question-220-discussion/
221	1z0-071	https://www.examtopics.com/discussions/oracle/view/100976-exam-1z0-071-topic-1-question-221-discussion/
222	1z0-071	https://www.examtopics.com/discussions/oracle/view/117019-exam-1z0-071-topic-1-question-222-discussion/
223	1z0-071	https://www.examtopics.com/discussions/oracle/view/114941-exam-1z0-071-topic-1-question-223-discussion/
224	1z0-071	https://www.examtopics.com/discussions/oracle/view/114106-exam-1z0-071-topic-1-question-224-discussion/
225	1z0-071	https://www.examtopics.com/discussions/oracle/view/126324-exam-1z0-071-topic-1-question-225-discussion/
226	1z0-071	https://www.examtopics.com/discussions/oracle/view/114936-exam-1z0-071-topic-1-question-226-discussion/
227	1z0-071	https://www.examtopics.com/discussions/oracle/view/121476-exam-1z0-071-topic-1-question-227-discussion/
228	1z0-071	https://www.examtopics.com/discussions/oracle/view/127596-exam-1z0-071-topic-1-question-228-discussion/
229	1z0-071	https://www.examtopics.com/discussions/oracle/view/110619-exam-1z0-071-topic-1-question-229-discussion/
230	1z0-071	https://www.examtopics.com/discussions/oracle/view/114107-exam-1z0-071-topic-1-question-230-discussion/
231	1z0-071	https://www.examtopics.com/discussions/oracle/view/110646-exam-1z0-071-topic-1-question-231-discussion/
232	1z0-071	https://www.examtopics.com/discussions/oracle/view/110655-exam-1z0-071-topic-1-question-232-discussion/
233	1z0-071	https://www.examtopics.com/discussions/oracle/view/110676-exam-1z0-071-topic-1-question-233-discussion/
234	1z0-071	https://www.examtopics.com/discussions/oracle/view/114004-exam-1z0-071-topic-1-question-234-discussion/
235	1z0-071	https://www.examtopics.com/discussions/oracle/view/114061-exam-1z0-071-topic-1-question-235-discussion/
236	1z0-071	https://www.examtopics.com/discussions/oracle/view/110749-exam-1z0-071-topic-1-question-236-discussion/
237	1z0-071	https://www.examtopics.com/discussions/oracle/view/134647-exam-1z0-071-topic-1-question-237-discussion/
238	1z0-071	https://www.examtopics.com/discussions/oracle/view/140237-exam-1z0-071-topic-1-question-238-discussion/
239	1z0-071	https://www.examtopics.com/discussions/oracle/view/150346-exam-1z0-071-topic-1-question-239-discussion/
240	1z0-071	https://www.examtopics.com/discussions/oracle/view/150347-exam-1z0-071-topic-1-question-240-discussion/
241	1z0-071	https://www.examtopics.com/discussions/oracle/view/150054-exam-1z0-071-topic-1-question-241-discussion/
242	1z0-071	https://www.examtopics.com/discussions/oracle/view/134809-exam-1z0-071-topic-1-question-242-discussion/
243	1z0-071	https://www.examtopics.com/discussions/oracle/view/150893-exam-1z0-071-topic-1-question-243-discussion/
244	1z0-071	https://www.examtopics.com/discussions/oracle/view/134821-exam-1z0-071-topic-1-question-244-discussion/
245	1z0-071	https://www.examtopics.com/discussions/oracle/view/137516-exam-1z0-071-topic-1-question-245-discussion/
246	1z0-071	https://www.examtopics.com/discussions/oracle/view/137517-exam-1z0-071-topic-1-question-246-discussion/
247	1z0-071	https://www.examtopics.com/discussions/oracle/view/137519-exam-1z0-071-topic-1-question-247-discussion/
248	1z0-071	https://www.examtopics.com/discussions/oracle/view/140061-exam-1z0-071-topic-1-question-248-discussion/
249	1z0-071	https://www.examtopics.com/discussions/oracle/view/137528-exam-1z0-071-topic-1-question-249-discussion/
250	1z0-071	https://www.examtopics.com/discussions/oracle/view/137529-exam-1z0-071-topic-1-question-250-discussion/
251	1z0-071	https://www.examtopics.com/discussions/oracle/view/134934-exam-1z0-071-topic-1-question-251-discussion/
252	1z0-071	https://www.examtopics.com/discussions/oracle/view/139188-exam-1z0-071-topic-1-question-252-discussion/
253	1z0-071	https://www.examtopics.com/discussions/oracle/view/138947-exam-1z0-071-topic-1-question-253-discussion/
254	1z0-071	https://www.examtopics.com/discussions/oracle/view/141750-exam-1z0-071-topic-1-question-254-discussion/
255	1z0-071	https://www.examtopics.com/discussions/oracle/view/137534-exam-1z0-071-topic-1-question-255-discussion/
256	1z0-071	https://www.examtopics.com/discussions/oracle/view/150351-exam-1z0-071-topic-1-question-256-discussion/
257	1z0-071	https://www.examtopics.com/discussions/oracle/view/137535-exam-1z0-071-topic-1-question-257-discussion/
258	1z0-071	https://www.examtopics.com/discussions/oracle/view/153906-exam-1z0-071-topic-1-question-258-discussion/
259	1z0-071	https://www.examtopics.com/discussions/oracle/view/137536-exam-1z0-071-topic-1-question-259-discussion/
260	1z0-071	https://www.examtopics.com/discussions/oracle/view/308965-exam-1z0-071-topic-1-question-260-discussion/
261	1z0-071	https://www.examtopics.com/discussions/oracle/view/150937-exam-1z0-071-topic-1-question-261-discussion/
262	1z0-071	https://www.examtopics.com/discussions/oracle/view/308966-exam-1z0-071-topic-1-question-262-discussion/
263	1z0-071	https://www.examtopics.com/discussions/oracle/view/150980-exam-1z0-071-topic-1-question-263-discussion/
264	1z0-071	https://www.examtopics.com/discussions/oracle/view/308967-exam-1z0-071-topic-1-question-264-discussion/
265	1z0-071	https://www.examtopics.com/discussions/oracle/view/153611-exam-1z0-071-topic-1-question-265-discussion/
266	1z0-071	https://www.examtopics.com/discussions/oracle/view/153613-exam-1z0-071-topic-1-question-266-discussion/
267	1z0-071	https://www.examtopics.com/discussions/oracle/view/308968-exam-1z0-071-topic-1-question-267-discussion/
268	1z0-071	https://www.examtopics.com/discussions/oracle/view/151000-exam-1z0-071-topic-1-question-268-discussion/
269	1z0-071	https://www.examtopics.com/discussions/oracle/view/152050-exam-1z0-071-topic-1-question-269-discussion/
270	1z0-071	https://www.examtopics.com/discussions/oracle/view/151001-exam-1z0-071-topic-1-question-270-discussion/
271	1z0-071	https://www.examtopics.com/discussions/oracle/view/308969-exam-1z0-071-topic-1-question-271-discussion/
272	1z0-071	https://www.examtopics.com/discussions/oracle/view/157775-exam-1z0-071-topic-1-question-272-discussion/
273	1z0-071	https://www.examtopics.com/discussions/oracle/view/116558-exam-1z0-071-topic-1-question-41-discussion/
41	1z0-071	https://www.examtopics.com/discussions/oracle/view/116558-exam-1z0-071-topic-1-question-41-discussion/
42	1z0-071	https://www.examtopics.com/discussions/oracle/view/94986-exam-1z0-071-topic-1-question-42-discussion/
43	1z0-071	https://www.examtopics.com/discussions/oracle/view/117014-exam-1z0-071-topic-1-question-43-discussion/
44	1z0-071	https://www.examtopics.com/discussions/oracle/view/80185-exam-1z0-071-topic-1-question-44-discussion/
45	1z0-071	https://www.examtopics.com/discussions/oracle/view/86188-exam-1z0-071-topic-1-question-45-discussion/
46	1z0-071	https://www.examtopics.com/discussions/oracle/view/117016-exam-1z0-071-topic-1-question-46-discussion/
47	1z0-071	https://www.examtopics.com/discussions/oracle/view/80905-exam-1z0-071-topic-1-question-47-discussion/
48	1z0-071	https://www.examtopics.com/discussions/oracle/view/117017-exam-1z0-071-topic-1-question-48-discussion/
49	1z0-071	https://www.examtopics.com/discussions/oracle/view/80024-exam-1z0-071-topic-1-question-49-discussion/
50	1z0-071	https://www.examtopics.com/discussions/oracle/view/92373-exam-1z0-071-topic-1-question-50-discussion/
51	1z0-071	https://www.examtopics.com/discussions/oracle/view/80187-exam-1z0-071-topic-1-question-51-discussion/
52	1z0-071	https://www.examtopics.com/discussions/oracle/view/117167-exam-1z0-071-topic-1-question-52-discussion/
53	1z0-071	https://www.examtopics.com/discussions/oracle/view/79499-exam-1z0-071-topic-1-question-53-discussion/
54	1z0-071	https://www.examtopics.com/discussions/oracle/view/80033-exam-1z0-071-topic-1-question-54-discussion/
55	1z0-071	https://www.examtopics.com/discussions/oracle/view/83123-exam-1z0-071-topic-1-question-55-discussion/
56	1z0-071	https://www.examtopics.com/discussions/oracle/view/104877-exam-1z0-071-topic-1-question-56-discussion/
57	1z0-071	https://www.examtopics.com/discussions/oracle/view/107573-exam-1z0-071-topic-1-question-57-discussion/
58	1z0-071	https://www.examtopics.com/discussions/oracle/view/101850-exam-1z0-071-topic-1-question-58-discussion/
59	1z0-071	https://www.examtopics.com/discussions/oracle/view/80037-exam-1z0-071-topic-1-question-59-discussion/
60	1z0-071	https://www.examtopics.com/discussions/oracle/view/106847-exam-1z0-071-topic-1-question-60-discussion/
61	1z0-071	https://www.examtopics.com/discussions/oracle/view/101743-exam-1z0-071-topic-1-question-61-discussion/
62	1z0-071	https://www.examtopics.com/discussions/oracle/view/92912-exam-1z0-071-topic-1-question-62-discussion/
63	1z0-071	https://www.examtopics.com/discussions/oracle/view/101900-exam-1z0-071-topic-1-question-63-discussion/
64	1z0-071	https://www.examtopics.com/discussions/oracle/view/83128-exam-1z0-071-topic-1-question-64-discussion/
65	1z0-071	https://www.examtopics.com/discussions/oracle/view/96167-exam-1z0-071-topic-1-question-65-discussion/
66	1z0-071	https://www.examtopics.com/discussions/oracle/view/90038-exam-1z0-071-topic-1-question-66-discussion/
67	1z0-071	https://www.examtopics.com/discussions/oracle/view/99408-exam-1z0-071-topic-1-question-67-discussion/
68	1z0-071	https://www.examtopics.com/discussions/oracle/view/102004-exam-1z0-071-topic-1-question-68-discussion/
69	1z0-071	https://www.examtopics.com/discussions/oracle/view/83359-exam-1z0-071-topic-1-question-69-discussion/
70	1z0-071	https://www.examtopics.com/discussions/oracle/view/90867-exam-1z0-071-topic-1-question-70-discussion/
71	1z0-071	https://www.examtopics.com/discussions/oracle/view/126003-exam-1z0-071-topic-1-question-71-discussion/
72	1z0-071	https://www.examtopics.com/discussions/oracle/view/111993-exam-1z0-071-topic-1-question-72-discussion/
73	1z0-071	https://www.examtopics.com/discussions/oracle/view/110362-exam-1z0-071-topic-1-question-73-discussion/
\.


--
-- Name: seq_questions; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_questions', 273, true);


--
-- Name: seq_questionslink; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_questionslink', 273, true);


--
-- Name: answers answer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answer_pk PRIMARY KEY (number, question_number, question_exam);


--
-- Name: companies company_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT company_pk PRIMARY KEY (name);


--
-- Name: discussions discussion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussion_pk PRIMARY KEY (number, question_number, question_exam);


--
-- Name: exams exam_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exam_pk PRIMARY KEY (name);


--
-- Name: questions question2_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT question2_pk PRIMARY KEY (number, exam);


--
-- Name: questionslink question_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionslink
    ADD CONSTRAINT question_pk PRIMARY KEY (number, exam);


--
-- Name: answers answer_question_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answer_question_fk FOREIGN KEY (question_number, question_exam) REFERENCES public.questions(number, exam) ON DELETE CASCADE;


--
-- Name: discussions discussion_question_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussion_question_fk FOREIGN KEY (question_number, question_exam) REFERENCES public.questions(number, exam) ON DELETE CASCADE;


--
-- Name: exams exam_company_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exam_company_fk FOREIGN KEY (company) REFERENCES public.companies(name) ON DELETE CASCADE;


--
-- Name: questions question2_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT question2_exam_fk FOREIGN KEY (exam) REFERENCES public.exams(name) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict ekj3v93oDc6czprvw4gYylgtZmepp9tUaxSaQenScso5hG4pNhUHyv3hrMmzU24

