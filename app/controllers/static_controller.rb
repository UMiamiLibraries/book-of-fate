class StaticController < ApplicationController
  layout "public"
  before_action :set_topics

  def contact
  end

  def about
  end

  def pages
    @page = Page.find_by(slug: params[:slug])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topics
      @topics = Page.all.order(:title)
    end
    
end
