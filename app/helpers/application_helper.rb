module ApplicationHelper
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse(CONFIG[:faye][:host_url])
    Net::HTTP.post_form(uri, :message => message.to_json)
  rescue => e
    Rails.logger.error ">>>>> Could not broadcast message! Is faye server down or not connected?"
  end
end