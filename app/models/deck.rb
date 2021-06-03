class Deck < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    validates :name, presence: true
    accepts_nested_attributes_for :cards, allow_destroy: true

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

    def self.scoped_decks(params)
        @decks = []
        !params[:admin_approved] || params[:admin_approved] == "" ? @decks = self.all : @decks = self.where("admin_approved = #{params[:admin_approved]}")
        binding.pry
        @decks
    end

end
