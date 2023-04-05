library(spotifyr)

# Load the before2021 data frame
before2021_df <- readRDS(here::here("inputs/data/before2021.rds"))

# Get the unique list of artists
artists <- unique(before2021_df$artist_name)

# Create an empty list to store the most popular track for each artist
most_popular_tracks <- list()

# Loop through each artist and get their top track using the Spotify API
for (artist in artists) {
  # Get the track IDs for the artist's songs
  artist_tracks <- before2021_df$track_id[before2021_df$artist_name == artist]
  
  # Use the Spotify API to get the audio features for each track
  audio_features <- get_audio_features(artist_tracks)
  
  # Sort the audio features by popularity in descending order
  audio_features <- audio_features[order(-audio_features$popularity),]
  
  # Get the top track for the artist
  top_track <- audio_features$track_id[1]
  
  # Add the top track to the list of most popular tracks
  most_popular_tracks[[artist]] <- top_track
}

# Print the list of most popular tracks
print(most_popular_tracks)
