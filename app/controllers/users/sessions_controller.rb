class Users::SessionsController < Devise::SessionsController
  before_action :failed_login_handler, only: %i[ create ]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: "OK",
      data: {
        token: request.env["warden-jwt_auth.token"],
        expired_at: Time.now + 30.minutes
      }
    }
  end

  def respond_to_on_destroy
    render json: { message: "OK" }, status: :ok
  end

  def failed_login_handler
    if current_user.blank?
      render json: { message: "Error", data: "Invalid Email or Password" }, status: :unauthorized
    end
  end
end
