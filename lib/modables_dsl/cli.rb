module ModablesDSL
  module Cli

    def self.parse
      parser = OptionParser.new do|args|
        args.banner = "Usage: modables-dsl [options]"
        args.on('-c', '--config config', 'YAML config file') do |config|
          self.opts['config'] = config
        end

        args.on('-h', '--help', 'Show this message') do
          puts args
          exit 0
        end
      end

      parser.parse!
    end

    def self.opts
      @local_opts = Hash.new if @local_opts.nil?
      @local_opts
    end

  end
end
