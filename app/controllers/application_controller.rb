class ApplicationController < ActionController::API

private
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
    @current_admin ||= Admin.find_by(auth_token: params[:auth_token])
  end

  def sign_out(admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  def current_admin=(admin)
    @current_admin = admin
  end
end
