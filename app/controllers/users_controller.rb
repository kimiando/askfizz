class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authenticate_user!, only: [:follow, :unfollow]

  def index
    @users = User.all
  end

  def show
    @question = @user.questions.new if current_user
    @answers = @user.answers
    @following = current_user.followed_users.include?(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def follow
    @user = User.find(params[:id])
    current_user.followed_users << @user
    redirect_to @user, notice: 'You are now following this user.'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.delete(@user)
    redirect_to @user, notice: 'You have unfollowed this user.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :photo)
  end

  def current_user_following?(other_user)
    current_user.followed_users.include?(other_user)
  end
  helper_method :current_user_following?
end
