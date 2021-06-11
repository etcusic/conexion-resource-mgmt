class Card < ApplicationRecord
  belongs_to :deck, optional: true
  validates :english, :spanish, presence: true, :length => {:maximum => 50}
  validates_uniqueness_of :english, :spanish
end
