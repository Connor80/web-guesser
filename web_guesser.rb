require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)
$guesses = 8

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  $guesses -= 1
  erb :index, :locals => {:number => $number, :message => message, :guesses => $guesses}
end

def check_guess(guess)
  if $guesses == 0
    "The SECRET NUMBER was " + $number.to_s + " Game over. You will never know the SECRET NUMBER. Try to guess a new SECRET NUMBER!"
    $guesses = 8
    $number = rand(100)
  end

  if guess == "".to_i
    "You have " + $guesses.to_s + " guesses remaining."

  elsif guess > $number
    if guess > $number + 5
      "Way too high! You have " + $guesses.to_s + " guesses remaining."
    else
      "Too high. You have " + $guesses.to_s + " guesses remaining."
    end

    elsif guess < $number
      if guess < $number - 5
        "Way too low! You have " + $guesses.to_s + " guesses remaining."
      else
        "Too low. You have " + $guesses.to_s + " guesses remaining."
      end

    elsif guess == $number
      "Correct! The SECRET NUMBER is " + $number.to_s + ". You had " + $guesses.to_s + " guesses remaining."
      $guesses = 8
      $number = rand(100)
    end
    
end
