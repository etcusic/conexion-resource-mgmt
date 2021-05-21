class User < ApplicationRecord
    validates :name, :email, presence: true
    # validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "only allows letters with @" }
    validates_confirmation_of :password 
    has_secure_password

    # move this logic to a module
    def self.new_user_oauth
        # need to account for failed user creation
        password = SecureRandom.hex(10)
        # binding.pry
        @user = User.create(
            uid: auth['uid'],
            email: auth['info']['email'],
            name: auth['info']['name'],
            image: auth['info']['image'],
            password: password,
            password_confirmation: password
        )
        # binding.pry
    end

end
