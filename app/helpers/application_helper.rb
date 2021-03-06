require 'erb'
require 'red/red'
require 'sdg_utils/meta_utils'

module ApplicationHelper

  def meta
    Red.meta
  end

  # def trigger(event_name, hash={})
  #   event_name = event_name.to_s
  #   ev_cls = meta.find_event(event_name)
  #   params = hash[:params] || {}
  #   text = hash[:text] || ev_cls.relative_name
  #   href = "/event?" + {:name => ev_cls.name}.to_query + "&params=" + u(params.to_json)
  #   "<a href=\"#{href}\" data-remote=\"true\">#{text}</a>".html_safe
  # end

  def client
    #TODO don't hardcode Client
    session[:client] ||= Client.create!
  end

  def server
    #TODO don't hardcode Server
    $red_server ||= Server.create!
  end

  def img_tag_for(user)
    asset_name = "#{user.name}.jpg" 
    if Rails.application.assets.find_asset asset_name
      %Q(<div class="avatar"><img src="/assets/#{asset_name}"/></div>).html_safe
    else
      ""
    end
  end

  def js_namespace
    "jRed.red_irc"
  end

end
