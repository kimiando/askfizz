class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:follow, :unfollow]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @question = @user.questions.new if current_user
    @answers = @user.answers
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def search
    @users = User.search_by_username(params[:query])
    render 'search'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :photo, :query)
  end

end
