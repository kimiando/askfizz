class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @questions = current_user.asked_questions
  end

  def show
    @user = User.find(params[:id])
    @questions_asked_to_user = @user.asked_questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.asker = current_user
    @question.asked_to_id = params[:question][:asked_to_id]

    if @question.save
      redirect_to root_path, notice: 'Question sent successfully.'
    else
      redirect_to root_path, notice: 'Sorry, there was an issue.'
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    redirect_to user_path(current_user), notice: 'Question deleted successfully.'
  end

  private

  def question_params
    params.require(:question).permit(:content, :asked_to_id).merge(asker_id: current_user.id)
  end
end
