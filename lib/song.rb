class Song
  attr_accessor :name, :artist
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
   @artist = Artist.find_or_create_by_name(name)
   self.artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.new_by_filename(file_name)
    song = Song.new(file_name.split(" - ")[1])
    song.artist_name=(file_name.split(" - ")[0])
    song
  end

end
