import urllib.request
from bs4 import BeautifulSoup
import pandas as pd


data = pd.read_excel(r'D:\Uni\Semester 2\FIT5147 Data exploration and visualisation\Asignment 1'
                     r'\Primary data top 10.xlsx')
df = pd.DataFrame(data, columns=['Song'])


wiki = "https://www.lyrics.com/lyric/28808411/Ed+Sheeran/Lego+House"
page = urllib.request.urlopen(wiki) #For python 3 use urllib.request.urlopen(wiki)

soup = BeautifulSoup(page, "html.parser")


def lyrics():
    links = soup.find_all("pre", attrs={'class': 'lyric-body'})
    links1 = links[0].text
    return links1


def genre():
    genre_type = soup.find_all("a", attrs={'class': 'small'})
    genre_type1 = genre_type[-2].text
    return genre_type1


links2 = []


with open("new.txt", 'w') as new:
    new.write(lyrics())

