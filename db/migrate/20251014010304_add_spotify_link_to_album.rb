class AddSpotifyLinkToAlbum < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :spotify_link, :string
  end
end
