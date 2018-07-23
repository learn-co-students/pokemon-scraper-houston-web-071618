class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  # def self.db
  #   @@db
  # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)  VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sought = db.execute("SELECT id, name, type FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: sought[0], name: sought[1], type:sought[2] , db: db)
  end

# Write the SQL to display the artist's name next to his/her name
# # next to the album title.
# # SELECT
# #   artists.name,
# #   album.title
# # FROM   artists
# # JOIN   albums
# #   ON albums.artistId = artists.artistId
#
# 9.  Write the SQL to display the artist name, album name, and number of tracks
# # on that album.
# # SELECT
# #   artists.name,
# #   album.title,
# #   count(tracks.TrackID) AS num_tracks
# # FROM   artists
# # JOIN   albums ON
# #   albums.artistId = artists.artistID
# # Join tracks ON
# #   tracks.AlbumId = albums.AlbumID;
# # Group by albums.AlbumID;
# #
# # 10.  Write the SQL to return the name of all of the artists in the Pop genre (genre #9).
# #
# # SELECT artists.name FROM tracks
# #   JOIN albums ON tracks.GenreID=9
# #   JOIN artists ON
# #     artists.AlbumID = albums.AlbumID;
# # GROUP BY artists.ArtistID;
# # ORDER BY num_rock


end
