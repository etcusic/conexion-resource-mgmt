class Deck < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    validates :name, presence: true, :length => {:maximum => 50} 
    validates :cards, :presence => true, :length => {:minimum => 3, :maximum => 50}
    accepts_nested_attributes_for :cards, allow_destroy: true

    def with_cards
        @deck = {
            id: self.id,
            name: self.name,
            level: self.level,
            cards: []
        }
        self.cards.each{ |card| @deck[:cards] << { id: card.id, english: card.english, spanish: card.spanish } }
        @deck
    end

    def admin_cloned?
        AdminDeck.find_by(original_deck: self.id) ? true : false
    end
    
end
