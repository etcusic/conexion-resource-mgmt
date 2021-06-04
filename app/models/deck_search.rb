class DeckSearch
    attr_accessor :admin_approved, :level, :user_id

    def initialize(admin_approved="", level="", user_id="")
        @admin_approved = admin_approved
        @level = level
        @user_id = user_id
    end

    def decks 
        Deck.all
    end

    def users
        User.all
    end

end