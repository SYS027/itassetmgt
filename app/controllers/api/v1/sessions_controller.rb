class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy]

  def create
    admin = Admin.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      render json: { message: 'Login successful', admin_id: admin.id }, status: :ok
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:admin_id] = nil
    render json: { message: 'Logout successful' }, status: :ok
  end

  private

  def authenticate_admin
    unless current_admin
      render json: { message: 'Not authenticated' }, status: :unauthorized
    end
  end
end
