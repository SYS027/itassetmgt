class Api::V1::SessionsController < ApplicationController
  def create
    auth_token = params[:admin][:auth_token]
    email = params[:admin][:email]
    password = params[:admin][:password]
    if auth_token.present?
      admin = Admin.find_by(auth_token: auth_token)
      if admin
        sign_in(admin)
        render json: { message: 'Login successful', admin_id: admin.id, auth_token: admin.auth_token }, status: :ok
      else
        authenticate_with_email_and_password(email, password)
      end
    else
      authenticate_with_email_and_password(email, password)
    end
  end
  def destroy
    sign_out(current_admin) 
    render json: { message: 'Logout successful' }, status: :ok
  end
  
  private
  def authenticate_with_email_and_password(email, password)
    admin = Admin.find_by(email: email)
    if admin&.valid_password?(password)
      sign_in(admin)
      render json: { message: 'Login successful', admin_id: admin.id, auth_token: admin.auth_token }, status: :ok
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end
end

