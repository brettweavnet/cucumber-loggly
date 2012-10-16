require 'pathname'

module CucumberLoggly
  class CLI

    def initialize
      @root        = Pathname.new(__FILE__).parent.parent.parent
      @feature_dir = @root.join('features')
      @feature     = ARGV.shift
    end

    def start
      unless File.exist? @feature
        puts "Error: feature file '#{@feature}' doesn't exist!"
        exit 1
      end

      exit 2 unless system command
    end

    private

    def command
      cmd = []
      cmd << "cucumber"
      cmd << "--require #{@feature_dir}" if @feature_dir.exist?
      cmd << "--format pretty" if ARGV.include?("--pretty")
      cmd << @feature
      cmd.join(' ')
    end

  end
end
