module ModablesDSL
  module Cli

    def self.parse
      OptionParser.new do|args|
        args.banner = "Usage: modables-dsl [options]"
        args.on('-c', '--config config', 'YAML config file') do |config|
          self.opts['config'] = config
        end

        args.on('-d', '--dir', 'Use directory list from config') do |dir|
          self.opts['dir'] = dir
        end

        args.on('-h', '--help', 'Show this message') do
          puts args
          exit 0
        end
      end.parse!

      ModablesDSL::Generate.files
    end

    def self.opts
      @local_opts = Hash.new if @local_opts.nil?
      @local_opts
    end

  end
end
