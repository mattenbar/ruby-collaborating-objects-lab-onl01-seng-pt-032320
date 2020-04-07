require "pry"
class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_filename(file_name)
    #splits name of file
    file_name = file_name.delete_suffix(".mp3").split(" - ")
    #sets artist from file name
    artist = file_name[0]
    #sets song from file name
    song_name = file_name[1]
    genre = file_name [2]
    #creates a new song based off the song name
    new_song = self.new(song_name)
    #calls the artist name method on the new song to assign that song to an artist
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end




end
