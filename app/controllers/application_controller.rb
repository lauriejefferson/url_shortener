class ApplicationController < ActionController::Base
  def set_link
    @url_link = UrlLink.find_by_short_code(params[:id])
  end
end
