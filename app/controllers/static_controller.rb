class StaticController < ApplicationController
  def contact
  end

  def about
  end

  def pages
    @page = Page.find(slug: params[:slug])
  end
end
