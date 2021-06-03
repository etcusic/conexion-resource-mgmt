class DecksController < ApplicationController
    before_action :deck, only: [:show, :edit, :update, :destroy]
    before_action :all_users, only: [:search, :scoped]
    # before_action :scoped_decks, only: [:scoped]
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
    end

    def find_scoped
        # binding.pry
        # @decks = Deck.scoped_decks(scoped_params)
        @deck_search = DeckSearch.new(scoped_params)
        redirect_to "/decks/scoped"
    end

    def scoped
        @decks ||= Deck.scoped_decks(scoped_params)
        binding.pry
    end

    private 

    def deck_params
        params.require(:deck).permit(
            :name, :level, :admin_approved, :user_id,
            cards_attributes: [ :id, :english, :spanish, :_destroy ],
          )
    end

    def deck
        @deck = Deck.find_by_id(params[:id])
    end

    def scoped_params
        params.permit(:admin_approved, :level, :user_id)
    end

    def all_users
        @users ||= User.all
    end

    def scoped_decks
        @decks ||= Deck.all
    end

end
