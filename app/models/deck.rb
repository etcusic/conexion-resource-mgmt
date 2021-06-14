class Deck < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    validates :name, presence: true, :length => {:maximum => 50} 
    validates :cards, :presence => true, :length => {:minimum => 3, :maximum => 50}
    accepts_nested_attributes_for :cards, allow_destroy: true
    # admin clones a deck rather than edits existing => send an alert if original deck is edited; give option to update accordingly

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

    def self.scoped_decks(params)
        @decks = []
        !params[:admin_approved] || params[:admin_approved] == "" ? @decks = self.all : @decks = self.where("admin_approved = #{params[:admin_approved]}")
        @decks
    end
    
end
