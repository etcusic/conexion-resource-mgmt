class DeckSearchesController < ApplicationController
    skip_before_action :validate_user
    before_action :validate_admin
    before_action :deck_search

    def show
    end

    def update
        @deck_search = @deck_search.update(deck_search_params)
        binding.pry
        redirect_to deck_search_path(@deck_search)
    end

    private

    def deck_search_params
        params.require(:deck_search).permit(:admin_approved, :level, :user_id)
    end

    def deck_search

        @deck_search ||= DeckSearch.new
    end

end