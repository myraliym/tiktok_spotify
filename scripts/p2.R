library(spotifyr)
library(dplyr)

# Load the before2021 data frame
before2021_df <- readRDS(here::here("inputs/data/before2021.rds"))

# Get the unique list of artists
artists <- unique(before2021_df$artist_name)

# Create an empty list to store the track info data frames
track_info_list <- list()

# Loop through each artist and get their most popular track info using the Spotify API
for (i in 1:length(artists)) {
  # Get the most popular track ID for the artist
  track_id <- most_popular_tracks[[i]]
  
  # Get the track info for the most popular track
  track_info <- get_track(track_id)
  
  # Add the track info to the data frame
  track_info_df <- data.frame(artist_name = artists[i], track_id = track_id, track_name = track_info$name, 
                              track_popularity = track_info$popularity)
  
  # Add the data frame to the list
  track_info_list[[i]] <- track_info_df
}

# Combine all the data frames into one large data frame
track_info_df <- bind_rows(track_info_list)

# Save the data frame as an RDS file
saveRDS(track_info_df, file = here::here("inputs/data/spotify_hotsong_info.rds"))
