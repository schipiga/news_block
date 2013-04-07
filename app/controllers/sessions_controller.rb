class SessionsController < Devise::SessionsController
  before_filter :authenticate_user!, only: :destroy

  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.authenticate params[:user]
    @user = User.create! params[:user] unless @user
    sign_in @user
    redirect_to root_path
  end

  def destroy
    sign_out current_user
    redirect_to root_path
  end
end
