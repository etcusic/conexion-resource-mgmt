class Card < ApplicationRecord
  belongs_to :deck, optional: true
  validates :english, :spanish, presence: true
end
