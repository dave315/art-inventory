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
