class TagMappingsController < ApplicationController
  before_action :set_tag_mapping, only: [:show, :edit, :update, :destroy]

  # GET /tag_mappings
  # GET /tag_mappings.json
  def index
    @tag_mappings = TagMapping.all
  end

  # GET /tag_mappings/1
  # GET /tag_mappings/1.json
  def show
  end

  # GET /tag_mappings/new
  def new
    @tag_mapping = TagMapping.new
  end

  # GET /tag_mappings/1/edit
  def edit
  end

  # POST /tag_mappings
  # POST /tag_mappings.json
  def create
    @tag_mapping = TagMapping.new(tag_mapping_params)

    respond_to do |format|
      if @tag_mapping.save
        format.html { redirect_to @tag_mapping, notice: 'Tag mapping was successfully created.' }
        format.json { render :show, status: :created, location: @tag_mapping }
      else
        format.html { render :new }
        format.json { render json: @tag_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_mappings/1
  # PATCH/PUT /tag_mappings/1.json
  def update
    respond_to do |format|
      if @tag_mapping.update(tag_mapping_params)
        format.html { redirect_to @tag_mapping, notice: 'Tag mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_mapping }
      else
        format.html { render :edit }
        format.json { render json: @tag_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_mappings/1
  # DELETE /tag_mappings/1.json
  def destroy
    @tag_mapping.destroy
    respond_to do |format|
      format.html { redirect_to tag_mappings_url, notice: 'Tag mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_mapping
      @tag_mapping = TagMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_mapping_params
      params.require(:tag_mapping).permit(:transcription_id, :tag_id)
    end
end
