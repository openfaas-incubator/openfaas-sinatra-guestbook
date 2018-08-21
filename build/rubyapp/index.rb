require 'sinatra'

set :port, 8080
set :bind, '0.0.0.0'

visitors = Array.new

post '/' do
    "It's a good day"
end

get '/' do
    erb :index, locals: { visitors: visitors}
end

get '/frank-says' do
    "Path parameters are working perfectly with OpenFaaS"
end

post "/sign" do
    visitors.push(params["first-name"] + " " + params["last-name"])
  
    erb :signed, locals: { visitors: visitors}
end