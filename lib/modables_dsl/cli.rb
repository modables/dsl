module ModablesDSL
  module Cli

    def self.parse
      option_parser = OptionParser.new do|args|
        args.banner = "Usage: modables-dsl [options]"
        args.on('-c', '--config file.yaml', 'YAML config file') do |config|
          self.opts['config'] = config
        end

        args.on('-f', '--file-ext tf.json', 'JSON output file extension') do |file_ext|
          self.opts['file-ext'] = file_ext
        end

        args.on('-v', '--version', 'DSL version') do |version|
          puts ModablesDSL::VERSION
          exit 0
        end

        args.on('-h', '--help', 'Show this message') do
          puts args
          exit 0
        end
      end

      begin
        option_parser.parse!
      rescue OptionParser::MissingArgument => e
        ModablesDSL::Message.error "#{e.message}"
      end

      ModablesDSL::Generate.files
    end

    def self.opts
      @local_opts = Hash.new if @local_opts.nil?
      @local_opts
    end

  end
end
