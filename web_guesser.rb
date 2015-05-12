require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(num)
	if num > SECRET_NUMBER
		if num > SECRET_NUMBER + 5
			return "Way too high!", "veryWrong"
		else
			return "Too high!", "slightlyWrong"
		end
	elsif num < SECRET_NUMBER
		if num < SECRET_NUMBER - 5
			return "Way too low!", "veryWrong"
		else
			return "Too low!", "slightlyWrong"
		end
	else 
		return "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}.", "correct"
	end
end

get '/' do 

	guess = params["guess"].to_i 
	message = check_guess(guess)[0]
	body_class = check_guess(guess)[1]
	erb :index, :locals => {:message => message, :body_class => body_class}
end








