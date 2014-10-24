class Band < ActiveRecord::Base
   has_many :songs, through: :albums
   has_many :albums
end