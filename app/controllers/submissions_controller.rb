class SubmissionsController < AdminController
  before_action :set_submission, only: [:destroy, :select]

  # GET /submissions
  def index
    @submissions = Submission.paginate(page: params[:page])
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
    flash[:notice] = 'Submission was successfully destroyed.'
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
  
  # GET /submissions/1/select
  def select
    transcription = @submission.transcription
    if transcription.update(transcription: @submission.submission)
      flash[:notice] = "Submission was successfully updated."
      transcription.save
    end
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
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
