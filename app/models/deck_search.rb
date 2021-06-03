class DeckSearch
    attr_accessor :admin_approved, :level, :user_id

    def initialize
        @admin_approved = ""
        @level = ""
        @user_id = ""
    end

    def update(params)
        params.each{|key, value| self.send(("#{key}="), value)}
        self
    end

    def decks 
        Deck.all
    end

end