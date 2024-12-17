class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: { message: "OK", data: resource }, status: :created
    elsif request.method == "DELETE"
      render json: { message: "OK", data: resource }, status: :ok
    else
      render json: { message: "Error", data: resource.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end
end
