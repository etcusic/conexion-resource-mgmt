class AdminDecksController < ApplicationController
    before_action :admin_deck, only: [:show, :edit, :update, :destroy]

    def index
        @admin_decks = AdminDeck.all
    end

    def new
        @admin_deck = new_admin_deck
        if @admin_deck.save
            redirect_to admin_deck_path(@admin_deck)
        else
            # error
            binding.pry
        end
    end

    def show
    end

    def edit
    end

    def update
        binding.pry
    end

    def destroy
        @admin_deck.destroy
        redirect_to '/admin_resources'
    end

    private

    def admin_deck_params

    end

    def new_admin_deck
        original_deck = Deck.find_by_id(params[:format])
        admin_deck = AdminDeck.new_from_existing(original_deck, current_user.id)
    end

    def admin_deck
        @admin_deck = AdminDeck.find_by_id(params[:id])
    end

end