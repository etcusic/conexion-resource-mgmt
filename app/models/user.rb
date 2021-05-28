class User < ApplicationRecord
    validates :name, :email, presence: true
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "only allows letters with @" }
    has_secure_password
    has_many :decks, dependent: :destroy

end
