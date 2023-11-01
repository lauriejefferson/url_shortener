class UrlLinksController < ApplicationController
  def index
    @url_links = UrlLink.recent_first
  end

  def create
    @url_link = UrlLink.new(url_link_params)
    if @url_link.save
      redirect_to root_path
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  private

  def url_link_params
    params.permit(:title, :description, :url)
  end

end
