class AdminDecksController < ApplicationController

    def index
    end

    def new
        @admin_deck = params[:format] ? new_admin_deck : AdminDeck.new
    end

    def create
        binding.pry
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def admin_deck_params

    end

    def new_admin_deck
        original_deck = Deck.find_by_id(params[:format])
        admin_deck = AdminDeck.new_from_existing(original_deck, current_user.id)
    end

end