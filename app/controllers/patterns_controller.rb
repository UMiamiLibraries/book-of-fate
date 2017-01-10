class PatternsController < AdminController

  # GET /patterns
  def index
    @patterns = Pattern.all
  end

  # GET /patterns/1
  def show
    @pattern = Pattern.find(params[:id])
  end

end
