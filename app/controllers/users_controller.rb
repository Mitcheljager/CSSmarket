class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, flash: { user_error: "A field was invalid" }
    end
  end

  def show
    @user = User.select("id", "name", "created_at").find_by_name(params[:name])
    @posts = Post.where(user_id: @user.id).all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
