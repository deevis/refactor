require 'refactor'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
end

# So we can put the correct Rails.logger messages in our code
class Rails
  class EchoLogger 
    def debug(m=nil,&block);puts "DEBUG: #{m}#{yield if block_given?}\n";end
    def info(m=nil,&block);puts "INFO: #{m}#{yield if block_given?}\n";end
    def warn(m=nil,&block);puts "WARN: #{m}#{yield if block_given?}\n";end
    def error(m=nil,&block);puts "\nERROR: #{m}#{yield if block_given?}\n\n";end
  end
  
  def self.logger
    Rails::EchoLogger.new 
  end
end