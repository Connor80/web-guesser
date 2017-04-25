require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => $number, :message => message}
end

def check_guess(guess)
  if guess > $number
    if guess > $number + 5
      "Way too high!"
    else
      "Too high."
    end

  elsif guess < $number
    if guess < $number - 5
      "Way too low!"
    else
      "Too low."
    end

  elsif guess == $number
    "Correct!"
  end

end
