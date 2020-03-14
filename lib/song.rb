class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.new_from_filename(file_name)
    song = Song.new 
    seperate_by_dash = file_name.split(" - ")
    name = seperate_by_dash[1].split(".mp3")
    
    song.name = " "
    artist = file_name.split(" - ")
    song.artist_name = artist
  end
end
