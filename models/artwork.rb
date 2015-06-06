class Artwork
  attr_reader :title, :series_num, :date, :description, :photo_url, :series_id

  def initialize(title, series_num, date, description, photo_url, series_id)
    @title = title
    @series_num = series_num
    @date = date
    @description = description
    @photo_url = photo_url
    @series_id = series_id
  end

  def series_name
    the_series_name = self.class.db_connection do |conn|
      conn.exec("SELECT name FROM series
                 WHERE id = #{series_id}")
    end.to_a.first

    the_series_name['name']
  end

  def self.db_connection
  begin
    connection = PG.connect(dbname: "artinventory")
    yield(connection)
  ensure
    connection.close
    end
  end

  def self.all
    all_art = db_connection do |art|
      art.exec("SELECT * FROM artwork")
  end.to_a

  all_art.map! { |art| Artwork.new(art['title'],
                                   art['series_num'],
                                   art['artwork_date'],
                                   art['description'],
                                   art['photo_url'],
                                   art['series_id']) }

  all_art
  end
end
