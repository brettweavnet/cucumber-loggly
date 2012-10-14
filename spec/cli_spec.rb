require 'spec_helper'
require 'cucumber-loggly/cli'

describe CucumberLoggly::CLI do
  context "when successful" do
    it "should run the command" do
      pending
    end
  end

  context "when unsuccessful" do
    it "should exit if the config file does not exist" do
      File.stub :exist? => false
      cli = CucumberLoggly::CLI.new
      lambda { cli.start }.should raise_error SystemExit
    end
  end
end
