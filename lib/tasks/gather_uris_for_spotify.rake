namespace :spotify do
    desc "Fetch and store the Spotify URI for all albums"
    task fetch_uris: :environment do
        puts "Starting Spotify URI fetch..."
        SpotifyUriPopulator.new.call
        puts "Done."
    end
end