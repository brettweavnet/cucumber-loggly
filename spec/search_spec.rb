require 'spec_helper'

describe CucumberLoggly::Search do
  it "should return the number of entries for a search" do
    result = { "body" => { "numFound" => "2" } }
    loggly_ruby_client_mock = mock "loggly ruby client"
    LogglyRubyClient::Search.should_receive(:new).
                             with(:config_file => "#{ENV['HOME']}/.cucumber-loggly.yml",
                                  :account => 'default').
                             and_return loggly_ruby_client_mock
    loggly_ruby_client_mock.should_receive(:search).
                            with(:from  => 'NOW-5MINUTES',
                                 :query => 'daquery',
                                 :input => 'dainput').
                            and_return result
    search = CucumberLoggly::Search.new :account => 'default'
    search.number_found.should == 2
  end
end
