require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)
@@counter = 5

get '/' do 
	cheating = params[:cheat]
	guess = params["guess"].to_i 
	message = check_guess(guess)
	erb :index, :locals => {:secret_num => settings.SECRET_NUMBER, :message => message[0], :body_class => message[1], :cheating => cheating}
end


def check_guess(num)
	if num == 0
		["", ""]
	elsif num == settings.SECRET_NUMBER
		@@counter = 5
		settings.SECRET_NUMBER = rand(100)
		["You got it right! Play again!", "correct"]
	elsif @@counter == 1
		@@counter = 5
		settings.SECRET_NUMBER = rand(100)
		["Sorry, you lost. You have to start all over again.", ""]
	elsif num > settings.SECRET_NUMBER
		@@counter -= 1
		num > settings.SECRET_NUMBER + 5 ? ["Way too high!", "veryWrong"] : ["Too high!", "slightlyWrong"]
	elsif num < settings.SECRET_NUMBER
		@@counter -= 1
		num < settings.SECRET_NUMBER - 5 ? ["Way too low!", "veryWrong"] : ["Too low!", "slightlyWrong"]
	end
end







