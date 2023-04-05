class User < ApplicationRecord
    include BCrypt
    validates :password, presence: true
    validates :name, presence: true        
    validates :username, presence: true,
                         uniqueness: true,
                         length: { minimum: 5 }
    after_create :generate_token

    def self.signup(user_params)
        password_hash = Password.create(user_params[:password])
        create(name: user_params[:name], username: user_params[:username], password: password_hash)
    end

    def generate_token
        self.token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join

        self.save
    end

    def self.signin(user_params)
        user = find_by(username: user_params[:username])

        if user.present?
            return user if Password.new(user.password) == user_params[:password]
        end
    end
end