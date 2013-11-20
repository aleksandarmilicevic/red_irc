require 'alloy/alloy_conf'
require 'alloy/alloy_event_constants'
require 'sdg_utils/test_and_set'
require 'sdg_utils/meta_utils'

module Alloy
  extend self

  include EventConstants

  class CMain
    include TestAndSet

    def initialize
      reset_fields
    end

    def reset_fields
      @fields_resolved = false
      @inv_fields_added = false
      @conf = nil
      @alloy_files = Set.new + Dir[File.join(File.dirname(__FILE__), "{**/*.rb}")]
    end

    public

    def exe_mode()             @exe_mode ||= :concrete end
    def symbolic_mode?()       exe_mode == :symbolic end
    def concrete_mode?()       exe_mode == :concrete end
    def restore_exe_mode(mode) @exe_mode = mode end
    def set_symbolic_mode()    @exe_mode = :symbolic end
    def set_concrete_mode()    @exe_mode = :concrete end

    def is_alloy_file?(filename)
      @alloy_files.member?(filename)
    end

    def is_caller_from_alloy?(caller_str)
      m = caller_str.match(/([^:]*):/) and is_alloy_file?(m.captures[0])
    end

    def meta
      require 'alloy/alloy_meta'
      @meta ||= Alloy::Model::MetaModel.new
    end

    def boss
      require 'alloy/alloy_boss'
      @boss ||= Alloy::BigBoss.new
    end

    def conf
      require 'alloy/alloy_conf'
      @conf ||= def_conf.dup
    end

    def initializer
      require 'alloy/initializer'
      @initializer ||= Alloy::CInitializer.new
    end

    def set_default(hash)
      def_conf.merge!(hash)
      conf.merge!(hash)
    end

    def reset
      #meta.reset
      reset_fields
    end

    def fields_resolved?; @fields_resolved end
    def inv_fields_added?; @inv_fields_added end

    private

    def def_conf
      @def_conf ||= Alloy::default_conf
    end
  end

  def alloy; @@alloy ||= Alloy::CMain.new end
  alias_method :main, :alloy


  extend SDGUtils::Delegate
  delegate :meta, :boss, :conf, :set_default, :initializer, :reset,
           :fields_resolved?, :inv_fields_added?, :test_and_set,
           :is_alloy_file?, :is_caller_from_alloy?,
           :exe_mode, :symbolic_mode?, :concrete_mode?,
           :restore_exe_mode, :set_symbolic_mode, :set_concrete_mode,
           :to => lambda{alloy}, :proc => true
end
