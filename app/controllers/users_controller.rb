class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.ordered
  end

  def new
    @user = User.new
  end

  def edit; end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, 
        notice: "User #{@user.name} was successfully created." 
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url,
        notice: "User #{@user.name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User #{@user.name} was successfully deleted."
    else
      flash[:notice] = "User #{@user.name} was not deleted."
    end
    redirect_to users_url
  end

  rescue_from User::Error do |exception|
    redirect_to users_url, notice: exception.message
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])    
  end
end