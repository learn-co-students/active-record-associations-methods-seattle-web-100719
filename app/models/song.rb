require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    res = false
    artistRes = nil
    Artist.all.each do |artist1|
      if artist1.name == "Drake"
        self.artist = artist1
        res = true
        artistRes = artist1
      end
    end
    if res == false
      drake = Artist.new(name: "Drake")
      drake.save
      self.artist = drake
      return drake
    else
      return artistRes
    end
  end
end