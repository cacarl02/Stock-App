class User < ApplicationRecord
    include BCrypt
    validates :username, uniqueness: true,
                         presence: true
    after_create :generate_token

    def self.signup(user_params)
        password_hash = Password.create(user_params[:password])
        create(name: user_params[:name], username: user_params[:username], password: password_hash)
    end

    def generate_token
        self.token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join

        self.save
    end
end