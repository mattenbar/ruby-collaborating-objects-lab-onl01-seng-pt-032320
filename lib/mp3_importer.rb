require "pry"
class MP3Importer

  attr_accessor :path, :files

  @@all = []

#accepts a filepath
  def initialize(path)
    @path = path
  end

  #creates an array with all the files that end in .mp3 from the path
  def files
    @files = Dir.entries(path).select {|song| song.end_with?(".mp3")}
  end

  def import
    #for each file_name inside the array creates a new song
    files.each{|file| Song.new_by_filename(file)}
  end




end
