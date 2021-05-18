class API 

    def self.decks
        @decks = Deck.all.where("level > 0").map{ |deck| deck.with_cards }
    end

end