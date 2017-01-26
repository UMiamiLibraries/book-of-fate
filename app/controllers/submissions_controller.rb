class SubmissionsController < AdminController
  before_action :set_submission, only: [:destroy, :select]

  # GET /submissions
  def index
    @submissions = Submission.paginate(page: params[:page])
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
