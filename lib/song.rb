class Song 
  attr_accessor :name
  
  @@all = []
  extend Concerns::Findable
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end 
  
  def genre 
    @genre 
  end 
  
  def genre=(genre)
    @genre= genre
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre

  end
  
  def artist 
    @artist 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def save
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end 
end 