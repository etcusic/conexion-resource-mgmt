class ApiController < ApplicationController

    def decks
        @decks = API.decks 
        render json: @decks 
    end

end
