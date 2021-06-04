class DeckSearchesController < ApplicationController
    before_action :validate_admin
    before_action :initialize_search

    def show
    end

    private

    def deck_search_params
        params.permit(:admin_approved, :level, :user_id)
    end

    def search_params?
        deck_search_params != {}
    end

    def initialize_search
        @deck_search = search_params? ? DeckSearch.new(deck_search_params) : DeckSearch.new
    end

end