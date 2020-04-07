class MP3Importer

  attr_accessor :path :files

  @@all = []

  def initialize(path)
    @path = path
    save
  end

  def save
    @@all << self
  end

  def files
    @files = Dir.entries(path)
  end

  def import

  end




end
