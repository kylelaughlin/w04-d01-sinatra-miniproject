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
get '/shouted-greeting-b/result' do
  @greeting = params['greeting'].upcase
  @name = params['name'].upcase
  erb :shouted_greeting_result
end

get '/shouted-greeting-b' do
  erb :shouted_greeting_form
end

#Even or odd

get '/even-or-odd/result' do
  @num = params['num'].to_i
  erb :even_or_odd_result
end

def even_or_odd(num)
  if num.even?
    "even"
  else
    "odd"
  end
end


get '/even-or-odd' do
  erb :even_or_odd_form
end

# Valid Triangle
get '/triangle' do
  erb :triangle_form
end

get '/triangle/result' do
  @a = params['a'].to_i
  @b = params['b'].to_i
  @c = params['c'].to_i
  erb :triangle_result
end

def valid_triangle(a,b,c)
  if a + b > c && a + c > b && b + c > a
    "is good"
  else
    "is not good"
  end
end

# fibonacci routes

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
