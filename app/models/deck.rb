class Deck < ApplicationRecord
    has_many :cards
    validates :name, presence: true

    def with_cards
        @deck = {
            id: self.id,
            name: self.name,
            level: self.level,
            cards: []
        }
        self.cards.each{ |card| @deck[:cards] << {id: card.id, english: card.english, spanish: card.spanish} }
        @deck
    end

end
