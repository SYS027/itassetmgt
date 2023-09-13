module Api
  module V1
    class PasswordResetsController < ApplicationController
      def index
        admins = Admin.all
        render json: admins
      end
    
      def create
        @admin = Admin.find_by(email: params[:email])
        if @admin.nil? 
          render json: { error: 'Invalid reset token or admin not found' }, status: :unprocessable_entity
          return
        end
        if params[:password].blank? || params[:password] != params[:confirm_password]
          render json: { error: 'Password and password confirmation do not match' }, status: :unprocessable_entity
          return
        end
        @admin.update(password: params[:password], reset_password_token: nil)
        render json: { message: 'Password updated successfully' }
      end
    end
  end
end

