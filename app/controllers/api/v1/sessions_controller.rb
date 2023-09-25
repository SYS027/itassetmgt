class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Generate an authentication token
      auth_token = SecureRandom.hex

      # Store the token in the user's session
      session[:auth_token] = auth_token

      # You may want to save the token to the user's record in the database
      user.update(auth_token: auth_token)

      # Return a response indicating successful login
      render json: { message: 'Login successful', auth_token: auth_token }
    else
      # Return an error response for unsuccessful login
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy
    # Clear the authentication token from the user's session
    session.delete(:auth_token)

    # You should also clear the token from the user's record in the database if you stored it there

    # Return a response indicating successful logout
    render json: { message: 'Logout successful' }
  end
end
