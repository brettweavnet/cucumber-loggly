require 'loggly-ruby-client'

module CucumberLoggly

  class Connect
    def initialize(account)
      @loggly = LogglyRubyClient::Search.new :config_file => config_file,
                                             :account     => account
    end

    def search(args)
      result = @loggly.search :from  => args[:from],
                              :query => args[:query],
                              :input => args[:input]
      result["body"]["numFound"].to_i
    end

    private

    def config_file
      "#{ENV['HOME']}/.cucumber-loggly.yml"
    end
  end

end
