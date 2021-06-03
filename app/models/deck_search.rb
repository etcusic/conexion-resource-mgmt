class DeckSearch
    attr_accessor :admin_approved, :level, :user_id

    def initialize
        @admin_approved = ""
        @level = ""
        @user_id = ""
    end

    def update_deck_search(params)
        binding.pry
        hash.each{|key, value| self.send(("#{key}="), value)}
    end

    def decks 
        Deck.all
    end

end