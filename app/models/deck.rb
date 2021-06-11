class Deck < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    validates :name, presence: true # currently does not validate presence of level - should implement this for admin approved decks, though
    validates :cards, :presence => true, :length => {:minimum => 3, :maximum => 50}
    accepts_nested_attributes_for :cards, allow_destroy: true
    # max number of characters for name
    # max number of characters for cards too
    # minimum number of cards
    # no deck name duplicates per user
    # no card duplicates in deck
    # reject_if_empty 
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
