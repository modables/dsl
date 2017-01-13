module ModablesDSL
  module Config

    def self.get
      if @config.nil?
        config_file = ModablesDSL::Cli.opts['config'] || "#{ENV['HOME']}/.modables.yaml"

        unless File.file? config_file
          puts "config file does not exist."
          exit 1
        end

        @config = YAML.load_file(config_file)
      end

      @config
    end

  end
end
