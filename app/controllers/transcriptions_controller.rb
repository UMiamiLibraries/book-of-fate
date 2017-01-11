class TranscriptionsController < AdminController
  before_action :set_transcription, only: [:show, :edit, :update]

  # GET /transcriptions
  def index
    @transcriptions = Transcription.paginate(page: params[:page])
  end

  # GET /transcriptions/1
  def show
  end

  # GET /transcriptions/1/edit
  def edit
  end

  # PATCH/PUT /transcriptions/1
  def update
    if @transcription.update(transcription_params)
      redirect_to @transcription, notice: 'Transcription was successfully updated.'
    else
      render :edit 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.require(:transcription).permit(:transcription, :locked)
    end
end
