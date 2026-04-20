# VIVAAI - AI-Based Automated Viva System

## Overview
VIVAAI is an AI-powered automated viva examination system designed to evaluate student answers using Natural Language Processing (NLP) techniques. The system aims to reduce manual effort, eliminate evaluator bias, and provide consistent and objective assessment of student knowledge.

It simulates a real viva environment where students answer questions, and the system evaluates their responses in real time.

---

## Problem Statement
Traditional viva examinations suffer from several challenges:
- They are time-consuming and difficult to scale for large numbers of students  
- Evaluation is subjective and varies between examiners  
- There is no consistent way to measure answer quality  
- It is difficult to track weak areas of students during the viva  

---

## Solution
VIVAAI addresses these issues by providing an automated evaluation system that:
- Compares student answers with ideal answers using text similarity techniques  
- Generates a score based on answer quality  
- Classifies responses as strong, average, or weak  
- Adjusts question difficulty based on student performance  

This creates a more structured, fair, and scalable viva process.

---

## Key Features
- Automated answer evaluation using TF-IDF and cosine similarity  
- Keyword matching and synonym expansion to improve accuracy  
- Adaptive question difficulty (easy → medium → hard)  
- Hint system with score penalty to encourage independent thinking  
- Weak topic detection for identifying areas of improvement  

---

## Tech Stack
- Python  
- Flask  
- MySQL  
- Scikit-learn  
- HTML  
- CSS  
- JavaScript  

---

## System Workflow
1. Student logs into the system and selects a subject  
2. A question is presented based on selected topic  
3. Student submits an answer  
4. The system evaluates the answer using NLP techniques  
5. A score and feedback are generated  
6. Next question difficulty is adjusted based on performance  

---
## Screenshots

### 🏠 Home / Question Interface
![Question Screen]<img width="1917" height="900" alt="image" src="https://github.com/user-attachments/assets/111a1391-2b9e-4483-8de3-15431252b031" />


### 📊 Viva Analysis Report
![Report Screen]<img width="1919" height="910" alt="image" src="https://github.com/user-attachments/assets/6cc87708-b392-4ac5-a0fb-497b81ee6804" />


## Results
- Achieved over **85% accuracy** compared to manual evaluation  
- Improved evaluation consistency  
- Reduced time required for conducting viva examinations  

---

## Future Enhancements
- Integration of advanced NLP models like BERT for better semantic understanding  
- Addition of voice-based input using speech-to-text  
- Faculty dashboard for monitoring student performance  
- Support for additional subjects and topics  



