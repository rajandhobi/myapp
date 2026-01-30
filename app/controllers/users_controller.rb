class UsersController < ApplicationController


  def index 
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
    UserMailer.welcome_email(@user).deliver_now
      redirect_to @user 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def send_report
    @user = User.find(params[:id])
    UserMailer.account_report(@user).deliver_now
    redirect_to @user, notice: "Report sent to Email!!"
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
