class Series
  attr_reader :name, :id, :total_printed, :date, :description

  def initialize(name, id, total_printed, date="no Date Provided", description="No Description Provided")
    @name = name
    @id = id
    @total_printed = total_printed
    @date = date
    @description = description
  end

  def self.db_connection
  begin
    connection = PG.connect(dbname: "artinventory")
    yield(connection)
  ensure
    connection.close
    end
  end

  def self.find(series_id)
    individual_series = db_connection do |conn|
      conn.exec("SELECT * FROM series
                WHERE series.id = #{series_id}")
    end.to_a.first

    Series.new(individual_series['name'],
               individual_series['id'],
               individual_series['total_printed'],
               individual_series['series_date'],
               individual_series['description'])
  end


  def self.all
    series = db_connection do |conn|
      conn.exec("SELECT * FROM series")
    end.to_a

    series.map! { |series| Series.new(series['name'],
                                      series['id'],
                                      series['total_printed'],
                                      series['series_date'],
                                      series['description']) }

    series
  end

end
