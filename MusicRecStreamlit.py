import pandas as pd
import streamlit as st

# Veriyi yükleme
df = pd.read_excel(r"C:\Users\EXCALIBUR\Desktop\Çalışmalar\Chinook_DB\Chinook\data.xlsx")

def get_recommendations_with_previous_songs(customer_name, genre):
    # Kullanıcının önceki dinlediği şarkıları çek
    previous_songs = df[df['CustomerName'] == customer_name]
    
    # Kullanıcının daha önce dinlediği şarkıların türünü belirleyelim
    previous_songs_list = previous_songs[previous_songs['GenreName'] == genre_name]

    # Seçilen türdeki öneri şarkıları alalım
    genre_songs = df[df['GenreName'] == genre]
    
    # Kullanıcıya önerilen şarkıları almak için filtrele
    recommendations = genre_songs[genre_songs['CustomerName'] != customer_name]
    
    # En fazla 5 öneri alalım
    recommendations = recommendations[['SongName', 'AlbumName', 'ArtistName', 'GenreName']].head(5)

    return previous_songs_list[['SongName', 'AlbumName', 'ArtistName', 'GenreName']], recommendations

# Streamlit ile kullanıcıdan input alma
st.title("Müzik Öneri Uygulaması")

# Kullanıcı adı için verideki tüm isimlerden seçim yap
unique_names = df['CustomerName'].unique()
customer_name = st.selectbox("Kullanıcı Adı", unique_names)

unique_genre = df['GenreName'].unique()
genre_name = st.selectbox("Müzik Türü", unique_genre)

# Önerileri alalım
previous_songs, recommendations = get_recommendations_with_previous_songs(customer_name, genre_name)

# Sonuçları kullanıcıya gösterelim
st.write(f"**{customer_name}**'ın Daha Önce Dinlediği {genre_name} Şarkıları:")
st.dataframe(previous_songs)

st.write(f"\n**Önerilen {genre_name} Şarkıları:**")
st.dataframe(recommendations)
