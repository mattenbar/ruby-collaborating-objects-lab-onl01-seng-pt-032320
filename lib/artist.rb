require "pry"
class Artist

  attr_accessor :name
  @@all = []


  def initialize (name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    #checks if artist exists by looking at class variable all
    if all.find {|artist| artist.name == name} == nil
      #if artist doesnt exist creates new one
      Artist.new (name)
    else
      #artist does exist so it returns the artst
      all.find {|artist| artist.name == name}
    end
  end

  def print_songs
    #goes through the songs of a single artist and prints all of them
    @songs.each do |song|
    puts song.name
    end
  end


end
