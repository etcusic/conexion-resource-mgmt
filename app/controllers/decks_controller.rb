class DecksController < ApplicationController
    before_action :deck, only: [:show, :edit, :update, :destroy]
    
    def index
        @decks = Deck.all
    end

    def new
        @deck = current_user.decks.build
    end

    def create  
        deck_params
        # @deck = Appointment.new_with_params(deck_params)
        # if @deck.save
        #     redirect_to user_path(current_user)
        # else
        #     render :new
        # end
    end

    def show
    end

    def edit
    end

    def update
        deck_params
        # if @appt.update(deck_params)
        #     redirect_to 
        # else
        #     render :edit
        # end
    end

    def destroy
        # @deck.destroy
        # redirect_to 
    end

    private 

    def deck_params
        binding.pry
    end

    def deck
        @deck = Deck.find_by_id(params[:id])
    end

end
