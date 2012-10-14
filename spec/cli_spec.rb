require 'spec_helper'
require 'cucumber-loggly/cli'

describe CucumberLoggly::CLI do
  before do
    ARGV.stub :shift => '/given/features'
    @pathname = Pathname.new('features').expand_path
    @cmd = "cucumber --require #{@pathname} /given/features"
  end

  context "when successful" do
    it "should run the command" do
      File.stub :exist? => true
      cli = CucumberLoggly::CLI.new
      cli.should_receive(:system).with(@cmd).and_return true
      cli.start
    end
  end

  context "when unsuccessful" do
    it "should exit 1 if the command does not return true" do
      File.stub :exist? => true
      cli = CucumberLoggly::CLI.new
      cli.should_receive(:system).with(@cmd).and_return false
      lambda { cli.start }.should raise_error SystemExit
    end

    it "should exit if the config file does not exist" do
      File.stub :exist? => false
      cli = CucumberLoggly::CLI.new
      cli.should_receive(:puts)
      lambda { cli.start }.should raise_error SystemExit
    end
  end
end
