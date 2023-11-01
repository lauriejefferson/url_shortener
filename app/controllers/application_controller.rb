class ApplicationController < ActionController::Base
  def set_link
    @url_link = UrlLink.find(params[:id])
  end
end
