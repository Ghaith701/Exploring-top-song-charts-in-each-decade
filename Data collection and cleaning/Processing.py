import pandas as pd
import re


data = pd.read_excel(r'D:\Uni\Semester 2\FIT5147 Data exploration and visualisation\Asignment 1'
                     r'\Primary data top 10.xlsx', 'top 50 in decade')

df_song = pd.DataFrame(data, columns=['Song'])
df_artist = pd.DataFrame(data, columns=['Performer'])

# Writing the data frames into dictionaries
dic_song = df_song.to_dict()
dic_artist = df_artist.to_dict()

# Convert songs and artists dictionary into lists
song_list = []
for x, y in dic_song.items():
    for s in y:
        song_list.append(y[s])
artist_list = []
for x, y in dic_artist.items():
    for l in y:
        artist_list.append(y[l])
    print(song_list)


i = 0
bb = ''
ii = 1

# Merging and writing song lyrics into groups of decades text files
while i < 300:
    with open(r"Assignment 1\{}- {}.txt".format(i+1, song_list[i]), 'r') as new:
        aa = new.read()
        bb = bb + aa
        if i == 49:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                cleaned_file2 = cleaned_file1.replace("\n ", " ")
                new2.write(cleaned_file1)
                print(cleaned_file2)
                bb = ''
                ii = ii + 1
        elif i == 99:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                new2.write(cleaned_file1)
                bb = ''
                ii = ii + 1
        elif i == 149:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                new2.write(cleaned_file1)
                bb = ''
                ii = ii + 1
        elif i == 199:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                cleaned_file2 = cleaned_file1.replace("\n ", " ")
                new2.write(cleaned_file2)
                bb = ''
                ii = ii + 1
        elif i == 249:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                new2.write(cleaned_file1)
                bb = ''
                ii = ii + 1
        elif i == 299:
            with open(r"Assignment 1\{} decade.txt".format(ii), 'w') as new2:
                cleaned_file = re.sub("\[.*\]", "", bb)
                cleaned_file1 = re.sub("\(|\)", "", cleaned_file)
                new2.write(cleaned_file1)
                bb = ''
                ii = ii + 1
    i = i + 1
