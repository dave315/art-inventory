require 'sinatra'
require 'sinatra/flash'
require 'pg'
require 'pry'

require_relative 'models/artwork'
require_relative 'models/series'

def db_connection
  begin
    connection = PG.connect(dbname: "artinventory")
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  erb :index
end

get "/artwork" do
  @all_the_artwork = Artwork.all
  erb :'artwork/art'
end

get "/artform" do
  @series_name_id = Series.all
  erb :'artwork/artwork_form'
end

get "/seriesform" do
  erb :'series/series_form'
end

get "/series" do
  @all_series = Series.all
  erb :'series/series'
end

get "/series/:id" do
  @one_series = Series.find(params[:id])
  erb :'series/series_info'
end

post "/series" do
  series_name = params['series_name']
  description = params['series_description']
  date = params['series_date']
  total_printed = params['total_printed']
  submission = [series_name, description, date, total_printed]

  db_connection do |conn|
    conn.exec_params("INSERT INTO series(name, description, series_date, total_printed)
    VALUES($1, $2, $3, $4)", submission)
  end
  redirect "/series"
end

post "/artwork" do
  series_number = params['series_number']
  art_title = params['art_title']
  artwork_date = params['artwork_date']
  art_description = params['art_description']
  # art_series_name = params['art_series_name'] <-- must build dropdown for this
  photo_url = params['photo_url']


  art_submission = [series_number, art_title, artwork_date, art_description, photo_url]

  db_connection do |conn|
    conn.exec_params("INSERT INTO artwork(series_num, title, artwork_date, description, photo_url)
    VALUES($1, $2, $3, $4, $5)", art_submission)
  end
  redirect "/artwork"
end
