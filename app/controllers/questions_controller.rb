class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to user_path(current_user), notice: 'Question sent successfully.'
    else
      redirect_to user_path(current_user), notice: 'Try again'
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :user_id)
  end
end
