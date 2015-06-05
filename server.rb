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
  erb :series
end

post "/series" do
  series_name = params['series_name']

  db_connection do |conn|
    conn.exec_params("INSERT INTO series(name) VALUES($1)", [series_name])
  end
  redirect "/series"
end
