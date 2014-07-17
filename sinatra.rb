require 'sinatra'
require 'pry'
require 'json'

store = YAML::Store.new("data.yml")


get '/' do
  store.transaction do
    store[:tasks] ||= []
    @tasks = store[:tasks]
  end
  erb :index
end 

# post '/todo' do
#   store.transaction do
#     store[:tasks] << params['task']
#     puts store[:tasks]
#   end
#   redirect ('/')
# end

post '/api/items/new' do
  store.transaction do
    store[:tasks] << params['task']
    puts store[:tasks]
  end
end

get '/api/items' do
  ["1", "2", "3"].to_json
end










