class AdminDecksController < ApplicationController
    before_action :admin_deck, only: [:show, :edit, :update, :destroy]

    def index
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

    def admin_deck
        @admin_deck = Deck.find_by_id(params[:id])
    end

end