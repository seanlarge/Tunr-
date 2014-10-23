class AddMusicIdAndMusicTypeToSongs < ActiveRecord::Migration
  def change
   remove_column :songs, :band_id, :integer
   remove_column :songs, :album_id, :integer
    add_column :songs, :music_id, :integer
    add_column :songs, :music_type, :string
  end
end
