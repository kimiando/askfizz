class AnswersController < ApplicationController
  before_action :set_question, only: [:index, :create, :destroy]
  def index
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to user_path(current_user), notice: 'Answer created successfully.'
    else
      redirect_to user_path(current_user), alert: 'Failed to create answer.'
    end
  end

  def new
    @answer = Answer.new
    @user = User.find(params[:user_id])
    @question = Question.find(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

  def set_question
    @question = Question.find(params[:question_id])
    @user = @question.user
  end
end
