# frozen_string_literal: true

# Health Check routes for application
class HealthCheckController < ApplicationController
  before_action :authenticate_user!, only: :login_index

  def index
    render json: {
      message: "️‍🔥 #{ENV.fetch('APP_NAME', 'Rails')} API ready to roll ️‍🔥"
    }
  end

  def login_index
    render json: {
      message: "️‍🔥 #{ENV.fetch('APP_NAME', 'Rails')} API ready to roll ️‍🔥",
      user: user_from_token
    }
  end

  private

  def user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').first, ENV['DEVISE_JWT_SECRET_KEY'])
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end
end
