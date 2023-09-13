class Api::V1::LogoCompanyController < ApplicationController
    # before_action :authenticate_user
  
    def index
    #   @admin = current_admin
      @company = Company.all # Assuming you have a Company model and you want to fetch the first company here.
      render json: { admin: @admin, company: @company }
    end
    
    # private
  
    # def authenticate_user
    #   admin = Admin.find_by(auth_token: request.headers['Authorization'])
    #   if admin.nil?
    #     render json: { error: "Invalid auth_token" }, status: :unauthorized
    #   end
    # end
  
    # def current_admin
    #   @current_admin ||= Admin.find_by(auth_token: request.headers['Authorization'])
    # end
  end