
require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
 	end
  get '/gossips/new/' do
    erb :newgossip
  end
  post '/gossips/new/' do
  		a = Gossip.new(params["gossip_author"],params["gossip_content"]).save
  		redirect '/'
	end
  get '/gossips/:id/' do
    erb :show, locals: {gossips: Gossip.new(params[@author],params[@content]).find(params['id']), i: params['id']}
  end	
  get '/gossips/:id/edit/' do
     erb :edit, locals: {id: params['id']}
  end
  post '/gossips/:id/edit/' do
    id = params['id']

    a = Gossip.update(params["gossip_author"],params["gossip_content"],params['id'])
    redirect "/gossips/#{id}/"
  end
end