module ModablesDSL
  module Config

    def self.get
      if @config.nil?

        @config = {
          'dsl' => {
            'file_ext'   => 'moda.json',
            'stack_dirs' => Array.new,
          }
        }

        config_file = ModablesDSL::Cli.opts['config'] || "#{ENV['HOME']}/.modables.yaml"

        # try to read from config file
        if File.file? config_file
          ModablesDSL::Message.log.info "Loading config #{config_file}"
          @config.deep_merge!(YAML.load_file(config_file))

        # if config file arg is passed but file is missing
        elsif ModablesDSL::Cli.opts['config']
          ModablesDSL::Message.error "Config file #{config_file} not found"
          exit 1
        end
      end

      @config
    end

  end
end
