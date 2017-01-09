class QuestionsController < AdminController
  before_action :logged_in_user

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

end
