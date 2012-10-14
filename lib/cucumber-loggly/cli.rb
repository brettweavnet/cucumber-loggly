require 'pathname'

module CucumberLoggly
  class CLI

    def initialize
      @feature_dir = Pathname.new('features').expand_path
      @feature     = ARGV[0]
    end

    def start
      unless File.exist? @feature
        puts "Error: feature file '#{@feature}' doesn't exist!"
        exit 1
      end

      system(run_command)? exit(0) : exit(2)
    end

    private

    def run_command
      parts = []
      parts << "cucumber"
      parts << "--require #{@feature_dir}" if @feature_dir.exist?
      parts << "--format pretty" if ARGV.include?("--pretty")
      parts << @feature
      parts.join(' ')
    end

  end
end
