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
      redirect_to users_path(current_user), notice: 'Question sent successfully.'
    else
      redirect_to users_path(current_user), notice: 'Sorry, there was an issue.'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @user = @question.asked_to
    @question.destroy
    redirect_to user_question_path(@user), status: :see_other
  end

  private

  def question_params
    params.require(:question).permit(:content, :asked_to_id).merge(asker_id: current_user.id)
  end
end
