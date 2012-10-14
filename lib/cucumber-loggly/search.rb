require 'loggly-ruby-client'

module CucumberLoggly

  class Search

    attr_accessor :input, :query, :from

    def initialize(args)
      @loggly = LogglyRubyClient::Search.new :config_file => config_file,
                                             :account     => args[:account]
      @input = []
      @query = []
      @from  = "NOW-1HOUR"
    end

    def number_found
      search["body"]["numFound"].to_i
    end

    private

    def search
      @loggly.search :from  => @from,
                     :query => @query,
                     :input => @input
    end

    def config_file
      "#{ENV['HOME']}/.cucumber-loggly.yml"
    end
  end

end
