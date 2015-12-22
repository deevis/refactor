module Refactor
  module Todo

    # strategy: [:default, :return_nil, :raise_exception]
    def self.deprecate(strategy: :default, &block)
      Logging.log(:warn, "Deprecated block encountered")
      case strategy
      when :default
        yield
      when :raise_exception 
        raise "DEPRECATED code encountered."
      when :return_nil 
        return nil 
      end
    rescue => e   
      Logging.log(:error, "Error encountered in Deprecated block: #{e.message}")
      raise e
    ensure
      Logging.log(:warn, "Deprecated block exited")
    end

  end
end
