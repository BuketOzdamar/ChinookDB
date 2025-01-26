# -*- coding: utf-8 -*-
"""
Created on Fri Jan 24 23:39:04 2025

@author: EXCALIBUR
"""

import pandas as pd
import os
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.neighbors import NearestNeighbors

# Veriyi yükleme
df = pd.read_excel("data.xlsx")

df['combined'] = df['AlbumName'] + ' ' + df['ArtistName'] + ' ' + df['SongName'] + ' ' + df['GenreName']

# TF-IDF vektörizasyonu
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(df['combined'])

# Modeli eğitme
model = NearestNeighbors(n_neighbors=1, algorithm='auto').fit(X)

# Örnek kullanıcı şarkı verisi ve öneri
user_songs = ["Vamo Batê Lata", "Another Song"]
user_query = ' '.join(user_songs)
user_vec = vectorizer.transform([user_query])
distances, indices = model.kneighbors(user_vec)

# Öneri
recommended_index = indices[0][0]
recommended_song = df.iloc[recommended_index]['SongName']
print(f"Önerilen Şarkı: {recommended_song}")

































