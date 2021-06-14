class AdminDeck < Deck

    def self.create_from_existing(@deck)
        
    end

    def prep_deck(@deck)
        deck_hash = @deck.as_json
        deck_hash.delete("id")
        deck_hash["original_id"] = @deck.id
        deck_hash["cards"].map{ |card| { english: card["english"], spanish: card["spanish"] } }
        deck_hash
    end

    def original_deck

    end

    def original_creator

    end



end
