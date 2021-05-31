class User < ApplicationRecord
    validates :name, :email, presence: true
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must have @ in between characters" }
    validates_confirmation_of :password 
    has_secure_password
    has_many :decks, dependent: :destroy

end
