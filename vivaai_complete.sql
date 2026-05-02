

CREATE DATABASE IF NOT EXISTS vivaai;
USE vivaai;


-- TABLE 1: STUDENTS

DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Demo student
INSERT INTO students (name, email, password)
VALUES ('Test User', 'test@gmail.com', '1234');


-- TABLE 2: QUESTIONS

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(100),
    topic VARCHAR(100),
    difficulty ENUM('Easy','Medium','Hard'),
    question_text TEXT,
    ideal_answer TEXT
);


-- MACHINE LEARNING QUESTIONS


-- ML EASY
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('ML','Intro','Easy','What is Machine Learning?',
'Machine Learning is a branch of artificial intelligence where systems learn from data to improve their performance on tasks without being explicitly programmed. It builds models that identify patterns and make decisions automatically from experience.'),

('ML','Types','Easy','What are the three types of Machine Learning?',
'The three types are Supervised Learning where the model learns from labeled data with input output pairs, Unsupervised Learning where the model finds hidden patterns in unlabeled data, and Reinforcement Learning where an agent learns by taking actions and receiving rewards or penalties from the environment.'),

('ML','Dataset','Easy','What is a dataset in Machine Learning?',
'A dataset is a structured collection of data used to train validate and test machine learning models. It contains features which are input variables and labels which are output values. The quality size and diversity of a dataset directly determines how well the model will perform on real world tasks.'),

('ML','Prediction','Easy','What is prediction in Machine Learning?',
'Prediction is the process of using a trained machine learning model to estimate an output for new unseen input data. The model applies the patterns it learned during training to generate results such as a category label or a numerical value without being given the correct answer.'),

('ML','Classification','Easy','What is classification in Machine Learning?',
'Classification is a supervised learning task where the model learns to assign input data to predefined categories or classes. Examples include spam detection classifying email as spam or not spam and medical diagnosis classifying a tumor as malignant or benign based on patient data.'),

('ML','Regression','Easy','What is regression in Machine Learning?',
'Regression is a supervised learning technique used to predict continuous numerical output values. For example predicting house prices stock values or temperature. Linear regression models the relationship between input variables and output as a straight line and is the simplest and most common form of regression.'),

('ML','Overfitting','Easy','What is overfitting in Machine Learning?',
'Overfitting occurs when a machine learning model learns the training data too well including its noise and random fluctuations. The model memorizes instead of learning general patterns so it performs very well on training data but fails to generalize and performs poorly on new unseen data.'),

('ML','Underfitting','Easy','What is underfitting in Machine Learning?',
'Underfitting occurs when a model is too simple to capture the underlying patterns in the data. It results in poor performance on both training and test data. This usually happens when the model has too few parameters has not been trained long enough or when important features are missing from the dataset.'),

-- ML MEDIUM
('ML','Overfitting','Medium','What is overfitting and how can it be prevented?',
'Overfitting happens when a model captures noise in training data instead of actual patterns leading to poor generalization on new data. It can be prevented using cross validation to evaluate model performance regularization techniques like L1 Lasso and L2 Ridge to penalize model complexity dropout in neural networks early stopping during training data augmentation to increase dataset size and pruning in decision trees.'),

('ML','Regression','Medium','What is the difference between linear and logistic regression?',
'Linear regression predicts continuous numerical output by fitting a straight line through data points and is used for problems like predicting price or temperature. Logistic regression predicts the probability of a binary outcome using the sigmoid function and is used for binary classification problems like spam detection or disease diagnosis. Despite the word regression in its name logistic regression is a classification algorithm not a regression algorithm.'),

('ML','Dataset','Medium','What is the difference between training validation and test datasets?',
'The training dataset is used to fit the model and learn its parameters. The validation dataset is used during training to tune hyperparameters and monitor for overfitting without touching test data. The test dataset is used only after training is complete to evaluate the final model performance on completely unseen data. This three way separation ensures an unbiased evaluation of the model.'),

('ML','Types','Medium','Explain supervised and unsupervised learning with real world examples.',
'In supervised learning the model is trained on labeled data where each input has a correct output. Real world examples include email spam detection predicting house prices and image classification. In unsupervised learning the model works with unlabeled data to find hidden structure. Real world examples include customer segmentation grouping customers by purchase behavior and anomaly detection finding unusual network traffic patterns.'),

('ML','Classification','Medium','What is the difference between classification and regression?',
'Classification predicts discrete categorical labels such as yes or no spam or not spam or cat or dog. Regression predicts continuous numerical values such as price temperature or salary. Classification uses algorithms like logistic regression decision trees SVM and random forest while regression uses linear regression polynomial regression and gradient boosting. The key difference is the nature of the output variable.'),

('ML','Overfitting','Medium','What is cross validation and why is it used?',
'Cross validation is a technique to evaluate machine learning models reliably by splitting data into multiple folds. In k fold cross validation the data is divided into k equal parts and the model is trained on k minus 1 folds and tested on the remaining fold. This process repeats k times and results are averaged. It gives a more reliable estimate of model performance reduces overfitting risk and makes better use of limited data.'),

-- ML HARD
('ML','NN','Hard','What is a neural network and how does it work?',
'A neural network is a computational model inspired by the human brain consisting of layers of interconnected nodes called neurons. The input layer receives raw data hidden layers apply transformations using weighted connections and activation functions like ReLU or sigmoid and the output layer produces predictions. During training the network minimizes prediction error using backpropagation which calculates gradients via chain rule and gradient descent which updates weights iteratively to converge to minimum loss.'),

('ML','DL','Hard','What is deep learning and how is it different from traditional Machine Learning?',
'Deep learning uses neural networks with many hidden layers called deep neural networks to automatically learn hierarchical representations from raw data. Unlike traditional machine learning which requires manual feature engineering by domain experts deep learning automatically extracts features at multiple levels of abstraction. It excels in image recognition natural language processing and speech recognition but requires large amounts of labeled data significant computational power and longer training times compared to traditional methods.'),

('ML','GD','Hard','What is gradient descent and what are its main variants?',
'Gradient descent is an optimization algorithm that minimizes the loss function by iteratively computing the gradient of the loss with respect to model parameters and updating parameters in the opposite direction of the gradient. Batch gradient descent uses all training samples per update which is stable but slow for large datasets. Stochastic gradient descent uses one random sample per update which is faster but noisy. Mini batch gradient descent uses small random batches balancing speed and stability and is the most commonly used variant in modern deep learning.'),

('ML','Overfitting','Hard','What is the bias variance tradeoff in Machine Learning?',
'The bias variance tradeoff describes the relationship between two sources of prediction error. Bias is error caused by wrong assumptions in the learning algorithm causing the model to miss relevant patterns and underfit the data. Variance is error caused by sensitivity to small fluctuations in training data causing the model to fit noise and overfit. A simple model has high bias and low variance while a complex model has low bias and high variance. The optimal model minimizes total error which is the sum of bias squared plus variance plus irreducible noise.'),

('ML','Regression','Hard','What is regularization in Machine Learning and explain L1 and L2?',
'Regularization is a technique that adds a penalty term to the loss function to prevent overfitting by discouraging models from assigning too much importance to any feature. L1 regularization called Lasso adds the absolute value of coefficients as penalty and can shrink some coefficients to exactly zero performing automatic feature selection making the model sparse. L2 regularization called Ridge adds the squared value of coefficients and shrinks all coefficients evenly without eliminating any. ElasticNet combines both L1 and L2 penalties to get benefits of both methods.'),

('ML','NN','Hard','What is backpropagation in neural networks and how does it work?',
'Backpropagation is the algorithm used to train neural networks by computing gradients of the loss function with respect to each weight using the chain rule of calculus. The process has two phases. In the forward pass input data flows through the network layer by layer to produce a prediction and the loss is calculated. In the backward pass the error is propagated backward through each layer computing partial derivatives of the loss with respect to each weight. These gradients are then used by gradient descent to update weights and reduce loss over many training iterations called epochs.');


-- DBMS QUESTIONS


-- DBMS EASY
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('DBMS','Intro','Easy','What is a Database Management System?',
'A Database Management System or DBMS is software that allows users to create store manage and retrieve data in a structured and efficient way. It provides an interface between users and the database ensuring data is organized consistent and secure. Popular examples include MySQL PostgreSQL Oracle Microsoft SQL Server and MongoDB.'),

('DBMS','Keys','Easy','What is a primary key in a database?',
'A primary key is a column or combination of columns in a table that uniquely identifies each row. It must contain unique values and cannot contain null values. Every table should have a primary key to ensure data integrity and enable efficient data retrieval and relationship building. For example a student ID in a students table uniquely identifies each student record.'),

('DBMS','SQL','Easy','What is SQL and what is it used for?',
'SQL stands for Structured Query Language and is a standard language used to communicate with relational databases. It is used to create and modify database structures using DDL commands like CREATE ALTER and DROP retrieve data using SELECT statements update data using UPDATE and DELETE and control access permissions using DCL commands like GRANT and REVOKE.'),

('DBMS','Tables','Easy','What is the difference between a table and a view in a database?',
'A table is a physical database object that stores actual data permanently in rows and columns on disk. A view is a virtual table that does not store data itself but displays data from one or more tables based on a saved SQL query. Views are used to simplify complex queries restrict data access to sensitive columns and present data in a specific format without duplicating it.'),

('DBMS','Normalization','Easy','What is normalization in databases?',
'Normalization is the process of organizing a relational database to reduce data redundancy and improve data integrity. It involves dividing large tables into smaller related tables and defining relationships between them using foreign keys. The process follows a series of rules called normal forms from 1NF to BCNF each with specific requirements to eliminate different types of data anomalies like insertion deletion and update anomalies.'),

('DBMS','Keys','Easy','What is the difference between primary key and foreign key?',
'A primary key uniquely identifies each record in a table and cannot be null or duplicate. A foreign key is a column in one table that references the primary key of another table creating a relationship between the two tables. Foreign keys enforce referential integrity ensuring that a value in the foreign key column must exist in the referenced primary key column preventing orphan records.'),

('DBMS','SQL','Easy','What is the difference between DELETE and TRUNCATE in SQL?',
'DELETE removes specific rows from a table based on a WHERE condition and can be rolled back using ROLLBACK as it is a DML command that logs individual row deletions. TRUNCATE removes all rows from a table at once and cannot be rolled back as it is a DDL command that deallocates data pages. TRUNCATE is significantly faster than DELETE on large tables because it does not log individual deletions. DELETE fires row level triggers while TRUNCATE does not.'),

('DBMS','Joins','Easy','What is a JOIN in SQL and why is it used?',
'A JOIN in SQL is used to combine rows from two or more tables based on a related column between them. It allows retrieving data that is spread across multiple tables in a single query result. The most common types are INNER JOIN which returns only matching rows from both tables LEFT JOIN which returns all rows from the left table and matching rows from right and FULL OUTER JOIN which returns all rows from both tables with NULL for non matching sides.'),

-- DBMS MEDIUM
('DBMS','Normalization','Medium','Explain 1NF 2NF and 3NF with examples.',
'First Normal Form 1NF requires that each column contain only atomic indivisible values with no repeating groups and each row must be unique. Second Normal Form 2NF requires the table to be in 1NF and every non key attribute must be fully functionally dependent on the entire primary key eliminating partial dependencies that occur in composite keys. Third Normal Form 3NF requires 2NF and no non key attribute should depend on another non key attribute eliminating transitive dependencies. These forms progressively reduce redundancy and prevent data anomalies.'),

('DBMS','Transactions','Medium','What is a transaction in DBMS and what are ACID properties?',
'A transaction is a sequence of database operations treated as a single logical unit of work that must either all succeed or all fail. ACID properties guarantee transaction reliability. Atomicity means the transaction is all or nothing. Consistency ensures the database remains in a valid state before and after the transaction. Isolation means concurrent transactions execute independently without interfering with each other. Durability ensures that once a transaction is committed its changes are permanently saved even if the system crashes immediately after.'),

('DBMS','Joins','Medium','Explain the different types of JOINs in SQL.',
'INNER JOIN returns only rows where there is a matching value in both tables. LEFT JOIN returns all rows from the left table and matched rows from the right table with NULL for unmatched right rows. RIGHT JOIN returns all rows from the right table and matched rows from the left with NULL for unmatched left rows. FULL OUTER JOIN returns all rows from both tables with NULL where there is no match on either side. CROSS JOIN returns the Cartesian product combining every row from first table with every row from second table.'),

('DBMS','Indexing','Medium','What is indexing in databases and why is it important?',
'Indexing is a data structure technique that improves the speed of data retrieval operations on a database table by creating a separate optimized structure pointing to row locations. An index works like a book index helping the database engine find rows without scanning every record. It significantly speeds up SELECT queries and WHERE clause lookups but slows down INSERT UPDATE and DELETE operations because the index must also be updated. Common types include B tree indexes for general use and hash indexes for equality lookups.'),

('DBMS','Keys','Medium','What is the difference between unique key and primary key?',
'A primary key uniquely identifies each record cannot contain NULL values and there can only be one primary key per table. A unique key also ensures uniqueness of values in a column but unlike primary key it can contain one NULL value and a table can have multiple unique keys. Both enforce uniqueness at the column level but the primary key is the main identifier of records and is typically used as the target of foreign key references from other tables.'),

('DBMS','SQL','Medium','What is the difference between WHERE and HAVING clause in SQL?',
'The WHERE clause filters individual rows before any grouping or aggregation occurs and cannot be used with aggregate functions like COUNT SUM AVG MIN or MAX. The HAVING clause filters groups of rows after the GROUP BY operation and is specifically designed to work with aggregate functions. For example WHERE salary greater than 50000 filters individual employee rows while HAVING AVG salary greater than 50000 filters department groups based on their average salary after grouping.'),

-- DBMS HARD
('DBMS','Transactions','Hard','What are isolation levels in database transactions?',
'Isolation levels define how much a transaction is isolated from other concurrent transactions and what anomalies are allowed. Read Uncommitted is the lowest level allowing dirty reads where a transaction reads uncommitted changes from another transaction. Read Committed prevents dirty reads but allows non repeatable reads where the same query returns different results within a transaction. Repeatable Read prevents dirty and non repeatable reads but allows phantom reads where new rows appear in repeated queries. Serializable is the strictest level preventing all anomalies by executing transactions as if they were fully sequential at the cost of reduced concurrency.'),

('DBMS','Normalization','Hard','What is BCNF and how is it different from 3NF?',
'Boyce Codd Normal Form BCNF is a stronger version of 3NF that handles certain anomalies 3NF cannot. A relation is in BCNF if for every non trivial functional dependency X determines Y X must be a superkey of the relation. The key difference from 3NF is that 3NF allows functional dependencies where the dependent attribute Y is a prime attribute meaning part of a candidate key while BCNF does not permit this exception. BCNF eliminates all redundancy based on functional dependencies but unlike 3NF it may not always preserve all original functional dependencies after decomposition.'),

('DBMS','Indexing','Hard','What is the difference between clustered and non clustered index?',
'A clustered index determines the physical storage order of data rows in the table itself meaning the table data is sorted and stored on disk according to the clustered index key. There can be only one clustered index per table since data can only be physically sorted one way. A non clustered index creates a completely separate data structure containing the index key values and pointers to the actual data rows stored elsewhere. A table can have multiple non clustered indexes. Clustered indexes are faster for range queries and ordered retrieval while non clustered indexes add flexibility for lookups on non primary columns.'),

('DBMS','SQL','Hard','What are stored procedures and triggers in SQL?',
'A stored procedure is a precompiled named collection of SQL statements stored permanently in the database that can be executed as a single reusable unit. It accepts input parameters returns output reduces network traffic by executing on the server and improves performance through execution plan reuse. A trigger is a special database object that automatically executes a predefined set of SQL statements in response to specific data modification events like INSERT UPDATE or DELETE on a table. Triggers are used to enforce complex business rules maintain audit logs synchronize tables and ensure data integrity automatically without requiring application code changes.'),

('DBMS','Transactions','Hard','What is deadlock in DBMS and how can it be prevented?',
'A deadlock occurs when two or more transactions are permanently waiting for each other to release locks creating a circular dependency where none of them can ever proceed. For example Transaction A holds a lock on Table 1 and waits for Table 2 while Transaction B holds a lock on Table 2 and waits for Table 1 causing both to wait forever. Prevention strategies include lock ordering where all transactions must acquire locks in the same predefined order timeout mechanisms that automatically abort transactions waiting beyond a threshold deadlock detection algorithms that periodically scan for cycles in the wait for graph and two phase locking protocol that ensures all locks are acquired before any lock is released.');


-- TABLE 3: ANSWERS

CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    question_id INT,
    student_answer TEXT,
    score FLOAT,
    classification ENUM('Strong','Average','Weak'),
    weak_topic_flag BOOLEAN DEFAULT FALSE,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


-- INDEXES

CREATE INDEX idx_topic ON questions(topic);
CREATE INDEX idx_difficulty ON questions(difficulty);
CREATE INDEX idx_subject ON questions(subject);


-- SUMMARY
-- Total Questions: 37
-- ML Questions: 20 (7 Easy, 6 Medium, 7 Hard)
-- DBMS Questions: 17 (7 Easy, 5 Medium, 5 Hard)

