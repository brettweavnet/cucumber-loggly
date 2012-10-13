require "loggly-ruby-client"
require "cucumber-loggly/version"
require "cucumber-loggly/steps"

def connect(account)
  config = LogglyRubyClient::Config.new :account => account
  LogglyRubyClient::Search.new :config => config
end

def search(args)
  result = @loggly.search :from  => args[:from],
                          :query => args[:query],
                          :input => args[:input]
  result[:body]["numFound"].to_i
end
