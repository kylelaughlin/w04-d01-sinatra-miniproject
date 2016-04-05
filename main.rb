require "pry"
require "sinatra"

# Your routes go here:

#Shouted greeting keyword
get '/shouted-greeting/:name' do
  "HELLO, #{params['name'].upcase}"
end

get '/shouted-greeting/howdy/:name' do
  "HOWDY, #{params['name'].upcase}"
end

#Shouted greeting query
get '/shouted-greeting-b' do
  if params['greeting']
    "#{params['greeting'].upcase}, #{params['name'].upcase}"
  else
    "HELLO, #{params['name'].upcase}"
  end
end

#Even or odd

get '/even-or-odd-b' do
  if params['num'].to_i.even?
    "#{params['num']} is even"
  else
    "#{params['num']} is odd"
  end
end

# Valid Triangle

get '/triangle/:side_one/:side_two/:side_three' do
  if params['side_one'].to_i + params['side_two'].to_i > params['side_three'].to_i &&
     params['side_one'].to_i + params['side_three'].to_i > params['side_two'].to_i &&
     params['side_two'].to_i + params['side_three'].to_i > params['side_one'].to_i
    "A triangle with lengts of #{params['side_one']}, #{params['side_two']}, and #{params['side_three']} is good."
  else
    "A triangle with lengts of #{params['side_one']}, #{params['side_two']}, and #{params['side_three']} is not good."
  end
end

# fibonacci routes

get '/fibonacci/:n' do
  #fibonacci(params['n'])
  @n = params['n'].to_i
  erb :fibonacci
end

get '/fibonacci' do
  @n = params['term'].to_i
  erb :fibonacci_query
end

get '/fib' do
  @n = params['term'].to_i
  erb :fib
end


def fibonacci(n)
  if n.to_i == 1
    fibonacci_numbers = [1]
  elsif n.to_i == 2
    fibonacci_numbers = [1, 1]
  else
    fibonacci_numbers = [1,1]
    i = 3
    while i <= n.to_i
      two_back = fibonacci_numbers[i-3]
      one_back = fibonacci_numbers[i-2]
      next_fib = two_back + one_back
      fibonacci_numbers << next_fib
      i += 1
    end
  end
  fibonacci_numbers.join(", ")
end
