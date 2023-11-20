class UrlLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @url_links = UrlLink.recent_first
    @url_link ||= UrlLink.new
  end

  def create
    @url_link = UrlLink.new(url_link_params)
    if @url_link.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream {render turbo_stream: [
          turbo_stream.prepend("links", @url_link),
          turbo_stream.replace("link_form", partial: "url_links/form", locals: {url_link: UrlLink.new})
        ]}
      end

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
    params.require(:url_link).permit(:url)
  end


end
