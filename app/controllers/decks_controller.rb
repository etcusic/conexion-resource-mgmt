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
        if @deck.update(deck_params)
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        # @deck.destroy
        # redirect_to 
    end

    private 

    def deck_params
        params.require(:deck).permit(
            :name, :level, :admin_approved,
            cards_attributes: [ :id, :english, :spanish, :_destroy ],
          )
    end

    def deck
        @deck = Deck.find_by_id(params[:id])
    end

end
