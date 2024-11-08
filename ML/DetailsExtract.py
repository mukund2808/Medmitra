#Text Details Extraction from the back of the medicine pamphlets using EasyOCR 
import pandas as pd
import cv2
import easyocr
import spacy
import matplotlib.pyplot as plt
import re
import random
from wordcloud import WordCloud, STOPWORDS
from spacy.util import minibatch, compounding
img = cv2.imread('/content/aug.jpg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
noise=cv2.medianBlur(gray,3)
thresh = cv2.threshold(noise, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]
reader = easyocr.Reader(['en'])
result = reader.readtext(img,paragraph='False')
text=pd.DataFrame(result)
text

#Read medicine details dataset
df = pd.read_csv("/content/gdrive/MyDrive/healthh/train_Dataset_health.csv")
#Drugs Names
all_drugs = df['drugName'].unique().tolist()
all_drugs = [x.lower() for x in all_drugs]


#Tokenization
def process_review(review):
    processed_token = []
    for token in review.split():
        token = ''.join(e.lower() for e in token if e.isalnum())
        processed_token.append(token)
    return ' '.join(processed_token)

#Preprocessing of Text in NER format.
count = 0
TRAIN_DATA = []
for _, item in df.iterrows():
    ent_dict = {}
    if count < 1000:
        review = process_review(item['review'])
        visited_items = []
        entities = []
        for token in review.split():
            if token in all_drugs:
                for i in re.finditer(token, review):
                    if token not in visited_items:
                        entity = (i.span()[0], i.span()[1], 'DRUG')
                        visited_items.append(token)
                        entities.append(entity)
        if len(entities) > 0:
            ent_dict['entities'] = entities
            train_item = (review, ent_dict)
            TRAIN_DATA.append(train_item)
            count+=1
print(TRAIN_DATA)
