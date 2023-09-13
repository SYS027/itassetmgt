class Api::V1::RegistrationsController < ApplicationController
  def index
    admins = Admin.all
    render json: admins
  end
  def create
    admin = Admin.new(admin_params)
    if admin.save
      auth_token = generate_auth_token
      admin.update(auth_token: auth_token)
      render json: { data: admin, message: 'User successfully registered', auth_token: auth_token }, status: :created
    else
      render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :confirm_password, :phone_number, :country_code)
  end

  def generate_auth_token
    SecureRandom.hex(32)
  end
end

