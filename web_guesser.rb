require 'sinatra'
require 'sinatra/reloader'
SECRET_NUMBER = rand(100)

def check_guess(num)
	if num > SECRET_NUMBER
		message = "Too high!"
	elsif num < SECRET_NUMBER
		message = "Too low!"
	else 
		message = "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}. "
	end
end

get '/' do 
	guess = params["guess"].to_i 
	message = check_guess(guess)
	erb :index, :locals => {:message => message}
end








