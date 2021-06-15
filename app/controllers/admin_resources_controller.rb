class AdminResourcesController < ApplicationController
    before_action :validate_admin

    def show
        # @admin_decks = AdminDeck.all
    end

end
