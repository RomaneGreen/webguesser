require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)
@@counter = 5

get '/' do 
	erb :index, :locals => {:secret_num => settings.SECRET_NUMBER, :message => "", :body_class => ""}
end

post '/' do
	guess = params["guess"].to_i 
	message = check_guess(guess)
	erb :index, :locals => {:secret_num => settings.SECRET_NUMBER, :message => message[0], :body_class => message[1]}
end

def check_guess(num)
	if num == settings.SECRET_NUMBER
		@@counter = 5
		settings.SECRET_NUMBER = rand(100)
		return ["You got it right! The SECRET NUMBER is #{settings.SECRET_NUMBER}. Play again!", "correct"]
	elsif @@counter == 1
		@@counter = 5
		settings.SECRET_NUMBER = rand(100)
		["Sorry, you lost. You have to start all over again.", ""]
	elsif num > settings.SECRET_NUMBER
		@@counter -= 1
		num > settings.SECRET_NUMBER + 5 ? ["Way too high!", "veryWrong"] : ["Too high!", "slightlyWrong"]
	else
		@@counter -= 1
		num < settings.SECRET_NUMBER - 5 ? ["Way too low!", "veryWrong"] : ["Too low!", "slightlyWrong"]		
	end
end








