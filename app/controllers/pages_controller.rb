class PagesController < ApplicationController
  before_action :set_tag, only: [:tag_pages]

  def tag_pages
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find_by(tag: params[:slug])
    end

end
