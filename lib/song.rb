require 'pry'
class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_info = filename.split(" - ")
        song = Song.new(song_info[1])
        song.artist = Artist.find_or_create_by_name(song_info[0])
        song
    end

    def artist_name=(name_string)
        Artist.find_or_create_by_name(name_string).add_song(self)
    end

end


