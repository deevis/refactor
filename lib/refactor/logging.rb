module Refactor
  module Logging
    @@logger = nil 

    def self.log(level, message = nil, &message_block) 
      if defined?(Rails) && @@logger.nil?
        @@logger = Rails.logger 
      end
      if @@logger
        if block_given?
          @@logger.send(level, &message_block)
        else
          @@logger.send(level, message)
        end
      end
    end

    def self.logger=(logger_implementation)
      @@logger = logger_implementation
    end
  end
end