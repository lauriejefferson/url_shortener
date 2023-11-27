class ApplicationController < ActionController::Base
  include Pagy::Backend

  def set_link
    @url_link = UrlLink.find_by_short_code(params[:id])
  end
end
