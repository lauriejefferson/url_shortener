class UrlLinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @url_links = UrlLink.recent_first
    @link ||= UrlLink.new
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

  def edit

  end
  def show

  end
  def update
    if @url_link.update(url_link_params)
      redirect_to @url_link
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @url_link.destroy
    redirect_to root_path, notice: "Link has been deleted"
  end

  private

  def url_link_params
    params.require(:url_link).permit(:title, :description, :url)
  end


end
