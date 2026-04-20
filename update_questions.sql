USE vivaai;

-- Clear old data
DELETE FROM answers;
DELETE FROM questions;
ALTER TABLE questions AUTO_INCREMENT = 1;

-- =============================================
-- MACHINE LEARNING QUESTIONS
-- =============================================

-- ML EASY (Basics)
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('ML','Intro','Easy','What is Machine Learning?',
'Machine Learning is a branch of artificial intelligence where systems learn from data to improve their performance on tasks without being explicitly programmed. It builds models that identify patterns and make decisions automatically.'),

('ML','Types','Easy','What are the three types of Machine Learning?',
'The three types are Supervised Learning where the model learns from labeled data with input output pairs, Unsupervised Learning where the model finds hidden patterns in unlabeled data, and Reinforcement Learning where an agent learns by taking actions and receiving rewards or penalties from the environment.'),

('ML','Dataset','Easy','What is a dataset and why is it important?',
'A dataset is a structured collection of data used to train and evaluate machine learning models. It contains features which are input variables and labels which are output values. The quality size and diversity of a dataset directly determines how well a model will perform.'),

('ML','Prediction','Easy','What is prediction in Machine Learning?',
'Prediction is the process of using a trained machine learning model to estimate an output for new unseen input data. The model applies the patterns it learned during training to generate results such as a category label or a numerical value.'),

('ML','Classification','Easy','What is classification in Machine Learning?',
'Classification is a supervised learning task where the model learns to assign input data to predefined categories or classes. Examples include spam detection classifying email as spam or not spam and medical diagnosis classifying a tumor as malignant or benign.'),

('ML','Regression','Easy','What is regression in Machine Learning?',
'Regression is a supervised learning technique used to predict continuous numerical output values. For example predicting house prices stock values or temperature. Linear regression models the relationship between inputs and output as a straight line and is the simplest form of regression.'),

('ML','Overfitting','Easy','What is overfitting?',
'Overfitting occurs when a machine learning model learns the training data too well including its noise and random fluctuations. The model memorizes instead of learning general patterns so it performs well on training data but poorly on new unseen data.'),

('ML','Underfitting','Easy','What is underfitting?',
'Underfitting occurs when a model is too simple to capture the underlying patterns in the data. It results in poor performance on both training and test data. This usually happens when the model has too few parameters or when it is not trained long enough.'),

-- ML MEDIUM (Interview Level)
('ML','Overfitting','Medium','What is overfitting and how can it be prevented?',
'Overfitting happens when a model captures noise in training data instead of actual patterns leading to poor generalization. It can be prevented using cross validation to evaluate model performance, regularization techniques like L1 Lasso and L2 Ridge to penalize complexity, dropout in neural networks, early stopping during training, data augmentation to increase dataset size, and pruning in decision trees.'),

('ML','Regression','Medium','What is the difference between linear and logistic regression?',
'Linear regression predicts continuous numerical output by fitting a straight line through data points and is used for problems like predicting price or temperature. Logistic regression predicts the probability of a binary outcome using the sigmoid function and is used for classification problems like spam detection. Despite the word regression in its name logistic regression is a classification algorithm.'),

('ML','Dataset','Medium','What is the difference between training validation and test datasets?',
'The training dataset is used to fit the model and learn its parameters. The validation dataset is used during training to tune hyperparameters and monitor for overfitting. The test dataset is used only after training is complete to evaluate the final model performance on completely unseen data. This separation ensures an unbiased evaluation.'),

('ML','Types','Medium','Explain supervised and unsupervised learning with real world examples.',
'Supervised learning uses labeled data where each input has a correct output. Real world examples include email spam detection predicting house prices and image classification. Unsupervised learning works with unlabeled data to find hidden structure. Real world examples include customer segmentation grouping similar customers together and anomaly detection finding unusual patterns in network traffic.'),

('ML','Classification','Medium','What is the difference between classification and regression?',
'Classification predicts discrete categorical labels such as yes or no spam or not spam or cat or dog. Regression predicts continuous numerical values such as price temperature or salary. Classification uses algorithms like logistic regression decision trees SVM and random forest while regression uses linear regression polynomial regression and gradient boosting.'),

('ML','Overfitting','Medium','What is cross validation and why is it used?',
'Cross validation is a technique to evaluate machine learning models by splitting data into multiple folds. In k-fold cross validation the data is divided into k equal parts and the model is trained on k-1 folds and tested on the remaining fold. This process repeats k times and results are averaged. It gives a more reliable estimate of model performance and helps detect overfitting.'),

-- ML HARD (Crack Interview)
('ML','NN','Hard','What is a neural network and how does it work?',
'A neural network is a computational model inspired by the human brain consisting of layers of interconnected nodes called neurons. The input layer receives data hidden layers apply transformations using weighted connections and activation functions and the output layer produces predictions. During training the network minimizes error using backpropagation which calculates gradients and gradient descent which updates weights iteratively.'),

('ML','DL','Hard','What is deep learning and how is it different from traditional Machine Learning?',
'Deep learning uses neural networks with many hidden layers to automatically learn hierarchical representations from raw data. Unlike traditional machine learning which requires manual feature engineering deep learning extracts features automatically. It excels in image recognition natural language processing and speech recognition but requires large datasets and significant computational resources like GPUs.'),

('ML','GD','Hard','What is gradient descent and what are its variants?',
'Gradient descent is an optimization algorithm that minimizes the loss function by iteratively updating model parameters in the direction opposite to the gradient. Batch gradient descent uses all training data per update which is slow for large datasets. Stochastic gradient descent uses one sample per update which is faster but noisy. Mini-batch gradient descent uses small batches and balances speed and stability and is the most commonly used variant in practice.'),

('ML','Overfitting','Hard','What is the bias variance tradeoff in Machine Learning?',
'The bias variance tradeoff describes two sources of model error. Bias is error from wrong assumptions causing the model to miss relevant patterns leading to underfitting. Variance is error from sensitivity to small data fluctuations causing the model to fit noise leading to overfitting. A simple model has high bias and low variance while a complex model has low bias and high variance. The goal is to find a balance that minimizes total error on unseen data.'),

('ML','Regression','Hard','What is regularization in Machine Learning and what are L1 and L2?',
'Regularization adds a penalty term to the loss function to prevent overfitting by discouraging overly complex models. L1 regularization called Lasso adds the absolute value of coefficients as penalty and can shrink some coefficients to exactly zero performing automatic feature selection. L2 regularization called Ridge adds the squared value of coefficients and shrinks all coefficients evenly without eliminating any. ElasticNet combines both L1 and L2 penalties.'),

('ML','NN','Hard','What is backpropagation in neural networks?',
'Backpropagation is the algorithm used to train neural networks by computing gradients of the loss function with respect to each weight using the chain rule of calculus. In the forward pass input data flows through the network to produce a prediction. In the backward pass the error is calculated and propagated backward through each layer updating weights using gradient descent to minimize the loss. This process repeats for many epochs until the model converges.');

-- =============================================
-- DBMS QUESTIONS
-- =============================================

-- DBMS EASY (Basics)
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('DBMS','Intro','Easy','What is a Database Management System?',
'A Database Management System or DBMS is software that allows users to create store manage and retrieve data in a structured and efficient way. It provides an interface between users and the database ensuring data is organized consistent and secure. Examples include MySQL PostgreSQL Oracle and MongoDB.'),

('DBMS','Keys','Easy','What is a primary key in a database?',
'A primary key is a column or combination of columns in a table that uniquely identifies each row. It must contain unique values and cannot be null. Every table should have a primary key to ensure data integrity and enable efficient data retrieval. For example a student ID in a students table uniquely identifies each student.'),

('DBMS','SQL','Easy','What is SQL and what is it used for?',
'SQL stands for Structured Query Language and is a standard language used to communicate with relational databases. It is used to create and modify database structures using DDL commands like CREATE and ALTER retrieve data using SELECT update data using UPDATE and DELETE and control access using DCL commands like GRANT and REVOKE.'),

('DBMS','Tables','Easy','What is the difference between a table and a view in a database?',
'A table is a physical database object that stores actual data in rows and columns on disk. A view is a virtual table that does not store data itself but displays data from one or more tables based on a saved SQL query. Views are used to simplify complex queries restrict data access and present data in a specific format.'),

('DBMS','Normalization','Easy','What is normalization in databases?',
'Normalization is the process of organizing a database to reduce data redundancy and improve data integrity. It involves dividing large tables into smaller related tables and defining relationships between them. The process follows normal forms from 1NF to BCNF each with specific rules to eliminate different types of data anomalies.'),

('DBMS','Keys','Easy','What is the difference between primary key and foreign key?',
'A primary key uniquely identifies each record in a table and cannot be null or duplicate. A foreign key is a column in one table that references the primary key of another table creating a relationship between the two tables. Foreign keys enforce referential integrity ensuring that relationships between tables remain consistent.'),

('DBMS','SQL','Easy','What is the difference between DELETE and TRUNCATE in SQL?',
'DELETE removes specific rows from a table based on a WHERE condition and can be rolled back as it is a DML command. TRUNCATE removes all rows from a table at once and cannot be rolled back as it is a DDL command. TRUNCATE is faster than DELETE because it does not log individual row deletions. DELETE fires triggers while TRUNCATE does not.'),

('DBMS','Joins','Easy','What is a JOIN in SQL and why is it used?',
'A JOIN in SQL is used to combine rows from two or more tables based on a related column between them. It allows retrieving data spread across multiple tables in a single query. The most common types are INNER JOIN which returns matching rows from both tables LEFT JOIN which returns all rows from the left table and matching rows from right and FULL JOIN which returns all rows from both tables.'),

-- DBMS MEDIUM (Interview Level)
('DBMS','Normalization','Medium','Explain 1NF 2NF and 3NF with examples.',
'First Normal Form 1NF requires that each column contain atomic indivisible values and each row be unique with no repeating groups. Second Normal Form 2NF requires 1NF and that every non-key attribute be fully dependent on the entire primary key eliminating partial dependencies. Third Normal Form 3NF requires 2NF and that no non-key attribute depend on another non-key attribute eliminating transitive dependencies. These forms progressively reduce redundancy and anomalies.'),

('DBMS','Transactions','Medium','What is a transaction in DBMS and what are ACID properties?',
'A transaction is a sequence of database operations treated as a single logical unit of work. ACID properties ensure transaction reliability. Atomicity means the transaction is all or nothing either all operations succeed or none do. Consistency ensures the database remains in a valid state before and after the transaction. Isolation means concurrent transactions do not interfere with each other. Durability ensures committed transactions are permanently saved even after system failures.'),

('DBMS','Joins','Medium','Explain the different types of JOINs in SQL with examples.',
'INNER JOIN returns only the rows where there is a match in both tables. LEFT JOIN returns all rows from the left table and matched rows from the right table with NULL for unmatched right rows. RIGHT JOIN returns all rows from the right table and matched rows from left. FULL OUTER JOIN returns all rows from both tables with NULL where there is no match. CROSS JOIN returns the Cartesian product of both tables combining every row from the first with every row from the second.'),

('DBMS','Indexing','Medium','What is indexing in databases and why is it important?',
'Indexing is a data structure technique that improves the speed of data retrieval operations on a database table. An index creates a separate data structure that points to the location of rows in a table similar to a book index. It speeds up SELECT queries and WHERE clause lookups significantly but slows down INSERT UPDATE and DELETE operations because the index must also be updated. Common index types include B-tree hash and bitmap indexes.'),

('DBMS','Keys','Medium','What is the difference between unique key and primary key?',
'A primary key uniquely identifies each record in a table cannot contain NULL values and there can only be one primary key per table. A unique key also ensures uniqueness of values in a column but unlike primary key it can contain one NULL value and a table can have multiple unique keys. Both enforce uniqueness but primary key is the main identifier of a record while unique key is used for alternate candidate keys.'),

('DBMS','SQL','Medium','What is the difference between WHERE and HAVING clause in SQL?',
'WHERE clause filters rows before grouping and aggregation occurs and cannot be used with aggregate functions like COUNT SUM AVG. HAVING clause filters groups after the GROUP BY operation and is used with aggregate functions. For example WHERE salary > 50000 filters individual rows while HAVING AVG(salary) > 50000 filters groups of rows based on the average salary.'),

-- DBMS HARD (Crack Interview)
('DBMS','Transactions','Hard','What are isolation levels in database transactions?',
'Isolation levels define how transaction integrity is visible to other concurrent transactions. Read Uncommitted allows reading uncommitted changes causing dirty reads. Read Committed prevents dirty reads but allows non-repeatable reads where the same query returns different results within a transaction. Repeatable Read prevents dirty and non-repeatable reads but allows phantom reads where new rows appear. Serializable is the strictest level preventing all anomalies by fully isolating transactions as if they ran sequentially.'),

('DBMS','Normalization','Hard','What is BCNF and how is it different from 3NF?',
'Boyce Codd Normal Form BCNF is a stronger version of 3NF. A table is in BCNF if for every functional dependency X determines Y X must be a super key of the table. The difference from 3NF is that 3NF allows functional dependencies where Y is a prime attribute part of a candidate key while BCNF does not. BCNF eliminates all redundancy based on functional dependencies but may not always preserve all functional dependencies unlike 3NF.'),

('DBMS','Indexing','Hard','What is the difference between clustered and non clustered index?',
'A clustered index determines the physical order of data stored in a table. The table data is sorted and stored according to the clustered index key. There can only be one clustered index per table since data can only be physically sorted one way. A non-clustered index creates a separate structure that contains the index key and a pointer to the actual data row. A table can have multiple non-clustered indexes. Clustered indexes are faster for range queries while non-clustered indexes add flexibility.'),

('DBMS','SQL','Hard','What are stored procedures and triggers in SQL?',
'A stored procedure is a precompiled collection of SQL statements stored in the database that can be executed as a single unit. It accepts input parameters returns output and improves performance by reducing network traffic and reusing execution plans. A trigger is a special type of stored procedure that automatically executes in response to specific events like INSERT UPDATE or DELETE on a table. Triggers are used to enforce business rules maintain audit logs and ensure data integrity automatically without user intervention.'),

('DBMS','Transactions','Hard','What is deadlock in DBMS and how can it be prevented?',
'A deadlock occurs when two or more transactions are waiting for each other to release locks creating a circular dependency where none can proceed. For example Transaction A holds lock on Table 1 and waits for Table 2 while Transaction B holds lock on Table 2 and waits for Table 1. Prevention strategies include lock ordering where all transactions acquire locks in the same order timeout mechanisms that abort transactions waiting too long deadlock detection algorithms that periodically check for cycles and two phase locking protocol that ensures locks are acquired before any are released.');
