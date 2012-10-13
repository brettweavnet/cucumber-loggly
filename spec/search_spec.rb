require 'spec_helper'

describe CucumberLoggly::Search do
  before do
    @result = { "body" => { "numFound" => "2" } }
    @loggly_ruby_client_mock = mock "loggly ruby client"
    LogglyRubyClient::Search.should_receive(:new).
                             with(:config_file => "#{ENV['HOME']}/.cucumber-loggly.yml",
                                  :account => 'default').
                             and_return @loggly_ruby_client_mock
  end

  it "should return the number of entries for a search" do
    @loggly_ruby_client_mock.should_receive(:search).
                             with(:from  => 'NOW-5MINUTES',
                                  :query => ['daquery'],
                                  :input => ['dainput']).
                             and_return @result
    search = CucumberLoggly::Search.new :account => 'default'
    search.query << 'daquery'
    search.input << 'dainput'
    search.from = "NOW-5MINUTES"
    search.number_found.should == 2
  end
end
