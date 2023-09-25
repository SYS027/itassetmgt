class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy]

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
    sign_out(current_admin) if current_admin
    render json: { message: 'Logout successful' }, status: :ok
  end
  
  private
  def destroy
    # Clear the authentication token from the user's session
    session.delete(:auth_token)

    # You should also clear the token from the user's record in the database if you stored it there

    # Return a response indicating successful logout
    render json: { message: 'Logout successful' }
  end
end

