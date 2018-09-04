require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => ENV["DB_HOST"],
  :username => ENV["DB_USER"],
  :password => ENV["DB_PASSWORD"],
  :database => ENV["DB_NAME"],
  :port => ENV["DB_PORT"]
)

begin
    ActiveRecord::Migration.create_table :visitors do |t|
    t.string :name
    end
rescue
    puts "Visitors table may already exist"
end

class Visitor < ActiveRecord::Base
end

class App < Sinatra::Application
end

set :port, 8080
set :bind, '0.0.0.0'

visitors = Array.new

get '/' do
    erb :index, locals: { visitors: Visitor.all}
end

post '/sign' do
    full_name = params["first-name"] + " " + params["last-name"]
    Visitor.create(:name => full_name)

    erb :signed, locals: { visitors: Visitor.all}
end

post '/reset' do
    Visitor.delete_all
end
