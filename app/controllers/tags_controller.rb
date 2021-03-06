class TagsController < AdminController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        redirect_to @tag, notice: 'Tag was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:transcription_id, :page_id)
    end
end
