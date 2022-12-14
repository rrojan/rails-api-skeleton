# frozen_string_literal: true

module Users
  # Session Controller (override Devise default)
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(_resource, _opts = {})
      render json: {
        message: 'Logged in successfully',
        user: current_user
      }, status: :ok
    end

    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def log_out_success
      render json: {
        message: 'Logged in successfully'
      }, status: :ok
    end

    def log_out_failure
      render json: {
        message: 'Unauthorized :: Something went wrong'
      }, status: :unauthorized
    end
  end
end
