class QuestionsController < AdminController

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @transcriptions = @question.transcriptions.paginate(page: params[:page])
  end

  def lock
  	@question = Question.find(params[:id])
  	@question.toggle
    @question.save
    redirect_back(fallback_location: root_path)
  end
end
