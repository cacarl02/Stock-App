class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    def current_user
        token = request.headers['Authorization']

        if token.present?
            user ||= User.find_by(token: token.gsub('Token ', ''))
        end
    end
end