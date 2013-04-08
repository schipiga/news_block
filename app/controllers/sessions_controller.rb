class SessionsController < Devise::SessionsController
  before_filter :authenticate_user!, only: :destroy

  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = (User.authenticate(params[:user]) || User.create(params[:user]))
    if @user.try :id
      sign_in @user
      flash[:alert] = 'You were signed in successfully'
    else
      flash[:error] = 'There are some errors'
    end
    redirect_to root_path
  end

  def destroy
    sign_out current_user
    flash[:alert] = 'You were signed out successfully'
    redirect_to root_path
  end
end
