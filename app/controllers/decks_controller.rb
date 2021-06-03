class DecksController < ApplicationController
    before_action :deck, only: [:show, :edit, :update, :destroy]
    skip_before_action :validate_user, only: [:scoped]
    
    def index
        @decks = Deck.all
    end

    def new
        @deck = current_user.decks.build
    end

    def create  
        @deck = current_user.decks.build(deck_params)
        if @deck.save
            redirect_to_profile
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @deck.update(deck_params)
            redirect_to_profile
        else
            render :edit
        end
    end

    def destroy
        @deck.destroy
        redirect_to_profile
    end

    def search
        @users = User.all
        @decks = Deck.all
    end

    def find_scoped
        # binding.pry
        redirect_to "/decks/scoped"
    end

    def scoped
        # binding.pry
        @users = User.all
        @decks = Deck.all
        @scoped_decks = Deck.scoped_decks(scoped_params)
    end

    private 

    def deck_params
        params.require(:deck).permit(
            :name, :level, :admin_approved, :user_id,
            cards_attributes: [ :id, :english, :spanish, :_destroy ],
          )
    end

    def scoped_params
        params.permit(:admin_approved, :level, :user_id)
    end

    def deck
        @deck = Deck.find_by_id(params[:id])
    end

end
