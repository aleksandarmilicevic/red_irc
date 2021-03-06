# configure Red
Red.configure do |c|
  c.alloy.logger = SDGUtils::IO::LoggerIO.new(Rails.logger)
  c.root = Rails.configuration.root
  c.view_paths = Rails.configuration.paths["app/views"]

  c.autoviews = false
  c.automigrate = true

  c.pusher.push_server    = "http://localhost:9292/faye" # "http://yellow-wasp.csail.mit.edu:9292/faye"
  c.pusher.push_client_js = "http://localhost:9292/faye.js" # "http://yellow-wasp.csail.mit.edu:9292/faye.js"

  c.view.default_layout   = "application"

  c.alloy.inv_field_namer = lambda { |fld|
    infl_for_inv = lambda{ |fld|
      ans = fld.parent.red_table_name
      ans = ans.singularize if fld.belongs_to_parent?
      ans
    }
    default_name = "#{infl_for_inv.call(fld)}_as_#{fld.name.singularize}"
    begin
      orig_fld = fld.parent.meta.extra[:for_field]
      if orig_fld
        if fld.type.range.klass == orig_fld.parent
          orig_fld.name
        else
          "#{infl_for_inv.call(orig_fld)}_as_#{orig_fld.name.singularize}"
        end
      else
        default_name
      end
    rescue Exception => e
      puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + e.message)
      default_name
    end
  }
end

# Finalize Red
Red.initialize!
