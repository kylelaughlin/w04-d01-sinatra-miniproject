require "pry"
require "sinatra"

# Your routes go here:

#Shouted greeting
get '/shouted-greeting/:name' do
  "HELLO, #{params['name'].upcase}"
end

get '/shouted-greeting/howdy/:name' do
  "HOWDY, #{params['name'].upcase}"
end


=begin

get '/hello/:name' do
  "Hello, #{params['name'].capitalize}"
end

get '/hello/:name/:greeting' do
  "#{params['greeting']} #{params['name']}"
end

get '/letter-count/:word' do
  binding.pry
  "#{params['word']} has #{params['word'].length} letters"
end

# /letter-count-queries?word=ruby
get '/letter-count-queries' do
  binding.pry
  if params['word']
    "#{params['word']} has #{params['word'].length} letters"
  else
    "You gotta give us a word."
  end
end
=end
