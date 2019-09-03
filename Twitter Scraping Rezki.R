# Title     : Twitter API Scraping
# Objective : Scrap Twitter with API
# Autuhor   : Rezki Aulia Putri
# Date      : September 2019

# Step 1: Install and load rtweet package 

install.packages("rtweet")
library(rtweet)

install.packages("devtools")
library(devtools)

# Step 2: API Authorization 
# With access token / secret
# kode berikut di peroleh dari developer.twitter.com
token <- create_token(
  consumer_key = "sNRjfptGUviB6j43DwYNHUFdt",
  consumer_secret = "P1an3AnYPses2oxfSFswKE9QDN13aVYYMYwlZ8qsERDcTPLFIl",
  access_token = "1156084323298107393-Cgq7T72ajojPE6kHQGslbbElMJ9SkK",
  access_secret = "ZA3ySiiF4q1jiLDuLWCGXn1sU5bgaRi8PTCkdqKyJWiKo")

# Step 3: Crawling Data Twitter 

# Define your twitter username 
mine='kecelakaan'

# Setelah proses otentikasi berhasil, kita siap untuk “menambang” data (crawling) dari Twitter. Untuk kepeluan ini, rtweet mengemas berbagai fungsi yang cukup lengkap, di antaranya:
#   
#   search_tweets() : mencari tweet dengan kata kunci tertentu
# lookup_users() : menampilkan data detail dari satu atau lebih user(s)
# get_timelines() : menampilkan status/tweet yang pernah diposting oleh user tertentu aka timeline
# get_followers() : menampilkan list followers dari user tertentu
# get_friends() : menampilkan list fiends/followings atau yang di-follow user tentu
# dan masih banyak yang lain seperti untuk menampilkan retweet, siapa yang me-retweet, mendapatkan list favorite, menampilkan trending topics, cleansing tweet, dan juga ekspor data ke file csv.

# find 1000 tweets with keywords: "#kecelakaan"
tweet <- search_tweets(q = "#kecelakaan", n = 1000)

# to know the column names of tweet 
colnames(tweet)
dim(tweet)

# let's take a look at three columns
k <- tweet[,c("created_at", "screen_name", "text")]

# Menampilkan timeline atau status/tweet terbaru yang pernah di-posting oleh satu atau beberapa user(s). Setiap user akan ditampilkan hingga maksimal 3.200 tweet.
timeline <- get_timeline(mine)

# filter or select three columns
timeline[,c("created_at", "source", "text")]

# Menampilkan data detail dari satu atau lebih akun/user(s).
user <- lookup_users(mine)

# filter or select three columns
user[,c("created_at", "screen_name", "name", "location", "description")]

head(user)

# followers <- get_followers()
# followings <- get_friends()
# lookup_users(followings$user_id)

write.csv2(k, "TwitterApi.csv")
