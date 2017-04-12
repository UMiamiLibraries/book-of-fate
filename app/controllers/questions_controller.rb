class QuestionsController < AdminController

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  def lock
  	@question = Question.find(params[:id])
  	@question.toggle
    @question.save
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end
