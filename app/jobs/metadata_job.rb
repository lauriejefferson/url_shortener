class MetadataJob < ApplicationJob
  def perform(id)
    url_link = UrlLink.find(id)
    url_link.update Metadata.retrieve_from(url_link.url).attributes
    url_link.broadcast_replace_to(url_link)
  end
end
