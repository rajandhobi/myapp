# class SessionsController < ApplicationController
#   def new
#   end

#   def create
#     user = User.find_by(email: params[:email])

#     if user&.authenticate(params[:password])
#       reset_session               
#       session[:current_user_id] = user.id

#       flash[:notice] = "Login successful"
#       redirect_to root_path
#     else
#       flash.now[:alert] = "Invalid email or password"
#       render :new
#     end
#   end

#   def destroy
#     session.delete(:current_user_id)
#     reset_session

#     flash[:notice] = "Logged out successfully"
#     redirect_to root_path, status: :see_other
#   end
# end
