class JsEventController < ApplicationController
  
  def index
    cls = SDGUtils::MetaUtils.to_class(params[:class])
    inst = cls.find(params[:id])
    unless inst
      render :text => "inst not found" 
      return
    end

    event_handler = cls.red_meta.js_event(params[:event])
    unless event_handler
      render :text => "event #{cls}.#{params[:event]} not found" 
      return
    end

    event_handler.bind(inst).call
    render :text => "ok"
  end
  
end
