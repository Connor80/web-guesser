require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)
$guesses = 8

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  $guesses -= 1
  erb :index, :locals => {:number => $number, :message => message, :guesses => $guesses, :colored_message => @colored_message}
end

def check_guess(guess)
  if $guesses == 0
    "The SECRET NUMBER was " + $number.to_s + ". Game over. Try to guess a new SECRET NUMBER!"
    $guesses = 8
    $number = rand(100)

  elsif guess == "".to_i
    "You have " + $guesses.to_s + " guesses remaining."

  elsif guess > $number
    if guess > $number + 5
      @colored_message = "message_color--cold"
      "Way too high! You have " + $guesses.to_s + " guesses remaining."
    else
       @colored_message = "message_color--warm"
      "Too high. You have " + $guesses.to_s + " guesses remaining."
    end

    elsif guess < $number
      if guess < $number - 5
        @colored_message = "message_color--cold"
        "Way too low! You have " + $guesses.to_s + " guesses remaining."
      else
         @colored_message = "message_color--warm"
        "Too low. You have " + $guesses.to_s + " guesses remaining."
      end

    elsif guess == $number
      @colored_message = "message_color--correct"
      "Correct! The SECRET NUMBER is " + $number.to_s + ". You had " + $guesses.to_s + " guesses remaining."
    end

end
