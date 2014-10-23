class AddAlbumIdAndRemoveArtistFromAlbums < ActiveRecord::Migration
  def change
      add_column :albums, :band_id, :integer
      remove_column :albums, :artist, :string
  end
end
