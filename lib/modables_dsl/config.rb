module ModablesDSL
  module Config

    def self.get
      if @config.nil?
        config_file = ModablesDSL::Cli.opts['config'] || "#{ENV['HOME']}/.modables.yaml"

        unless File.file? config_file
          ModablesDSL::Message.error "Config file does not exist. (#{config_file})"
        end

        @config = YAML.load_file(config_file)
      end

      @config
    end

  end
end
