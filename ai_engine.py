from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import re

# Common ML synonyms - expands student's words to match ideal answer keywords
SYNONYMS = {
    'ai': 'artificial intelligence',
    'artificial intelligence': 'ai',
    'ml': 'machine learning',
    'machine learning': 'ml',
    'supervised': 'labeled data learning',
    'unsupervised': 'unlabeled data clustering',
    'reinforcement': 'reward penalty agent',
    'model': 'algorithm model system',
    'predict': 'prediction forecast estimate',
    'data': 'dataset information records',
    'learn': 'learning train training',
    'insight': 'pattern knowledge information',
    'create': 'build develop train',
    'type': 'category kind classification',
    'neural': 'neural network brain',
    'deep': 'deep learning layers',
    'train': 'training learning fit',
    'error': 'loss mistake wrong',
    'optimize': 'optimization minimize reduce',
    'feature': 'input variable attribute',
    'output': 'result prediction label',
    'classify': 'classification categorize',
    'cluster': 'clustering group segment',
    'overfit': 'overfitting memorize noise',
    'underfit': 'underfitting simple bias',
    'regression': 'continuous value prediction',
    'gradient': 'gradient descent optimize',
    'weight': 'parameter coefficient weight',
    'bias': 'bias error underfitting',
    'variance': 'variance overfitting complexity',
}

def expand_text(text):
    text = text.lower().strip()
    # Replace synonyms to bridge vocabulary gap
    for word, expansion in SYNONYMS.items():
        if word in text:
            text = text + ' ' + expansion
    return text

def keyword_overlap_score(student, ideal):
    # Extract important words (ignore small words)
    stop = {'a','an','the','is','are','was','were','be','been','being',
            'have','has','had','do','does','did','will','would','could',
            'should','may','might','shall','to','of','in','on','at','by',
            'for','with','as','it','its','this','that','these','those',
            'and','or','but','not','so','if','when','where','which','who'}
    
    def keywords(text):
        words = re.findall(r'\b\w+\b', text.lower())
        return set(w for w in words if w not in stop and len(w) > 2)
    
    student_kw = keywords(student)
    ideal_kw = keywords(ideal)
    
    if not ideal_kw:
        return 0.0
    
    overlap = student_kw.intersection(ideal_kw)
    return len(overlap) / len(ideal_kw)

def evaluate_answer(student, ideal):
    if not student or not student.strip():
        return 0.0, "Weak"

    # Expand both texts with synonyms
    student_expanded = expand_text(student)
    ideal_expanded = expand_text(ideal)

    # TF-IDF cosine similarity on expanded text
    try:
        vectorizer = TfidfVectorizer()
        vectors = vectorizer.fit_transform([student_expanded, ideal_expanded])
        tfidf_score = float(cosine_similarity(vectors[0:1], vectors[1:2])[0][0])
    except:
        tfidf_score = 0.0

    # Keyword overlap score
    kw_score = keyword_overlap_score(student, ideal)

    # Combined score: 60% TF-IDF + 40% keyword overlap
    final_score = round((0.6 * tfidf_score) + (0.4 * kw_score), 4)

    # Classify
    if final_score >= 0.35:
        return final_score, "Strong"
    elif final_score >= 0.15:
        return final_score, "Average"
    else:
        return final_score, "Weak"
