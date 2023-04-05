library(ggplot2)

# Load the audio features data frame
audio_features_df <- readRDS(here::here("inputs/data/before2021.rds"))

# Use aggregate() to count the number of tracks per artist
tracks_per_artist <- aggregate(track_id ~ artist_name, data = audio_features_df, FUN = length)

# Rename the track_id column to track_count
names(tracks_per_artist)[2] <- "track_count"

# save the data frame as a csv file
write.csv(tracks_per_artist, file = here::here("outputs/data/tracks_per_artist.csv"), row.names = TRUE)