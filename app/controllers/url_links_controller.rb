class UrlLinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :check_if_editable, only: [:edit, :update, :destroy]

  def index
    @pagy, @url_links = pagy UrlLink.recent_first
    @url_link ||= UrlLink.new
    rescue Pagy::OverflowError
      redirect_to root_path
      #params[:page] = 1
      #retry
  end

  def create
    @url_link = UrlLink.new(url_link_params.with_defaults(user: current_user))
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

  def check_if_editable
    unless @url_link.editable_by?(current_user)
      redirect_to @url_link, alert: "You aren't allowed to do that."
    end
  end

end
