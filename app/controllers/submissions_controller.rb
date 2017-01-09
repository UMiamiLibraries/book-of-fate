class SubmissionsController < AdminController
  before_action :logged_in_user
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :select]
  # before_action :require_login

  # GET /submissions
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to @submission, notice: 'Submission was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /submissions/1
  def update
    if @submission.update(submission_params)
      redirect_to @submission, notice: 'Submission was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end
  
  # GET /submissions/1/select
  def select
    transcription = @submission.transcription
    if transcription.update(transcription: @submission.submission)
      
      
      flash[:notice] = "Submission was successfully updated."
 
      redirect_to transcription_path(transcription), notice: 'Submission was successfully updated.'
    else
      redirect_to transcription_path(transcription)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:transcription_id, :submission)
    end
end
