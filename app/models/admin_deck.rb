class AdminDeck < Deck
    # need to validate that user is admin

    def self.new_from_existing(deck_object, admin_id)
        deck_hash = {
            name: deck_object.name,
            level: deck_object.level,
            user_id: admin_id,
            original_deck: deck_object.id
        }
        @admin_deck = self.new(deck_hash)
        deck_object.cards.each{|card| @admin_deck.cards.build({english: card.english, spanish: card.spanish})}
        @admin_deck
    end

    def original_deck

    end

    def original_creator

    end



end
