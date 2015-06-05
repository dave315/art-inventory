require 'sinatra'
require 'sinatra/flash'
require 'pry'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "groceries")
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  erb :index
end

post "/art" do

end
