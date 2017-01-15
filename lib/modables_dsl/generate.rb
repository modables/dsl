module ModablesDSL
  module Generate

    def self.files
      self.stack_files.each do |mod_file|

        file_prefix = mod_file.rpartition('.mod').first
        file_suffix = ModablesDSL::Config.get['dsl']['destination_file_suffix'] || 'mod.json'

        destination_file = "#{file_prefix}.#{file_suffix}"

        ModablesDSL::Message.log.info "Reading from #{mod_file}"

        File.open(destination_file, 'w') do |new_file|
          new_file.write ModablesDSL::DSL.instance_eval IO.read mod_file
        end
        
        ModablesDSL::Message.log.info "Wrote to #{destination_file}"
      end
    end

    def self.stack_files

      dirs = if ModablesDSL::Cli.opts['dir']
        ModablesDSL::Config.get['dsl']['stack_dirs']
      else
        [Dir.pwd]
      end

      mod_files = Array.new

      dirs.each do |dir|
        mod_files += Dir.glob("#{dir}/**/*.mod.rb")
      end

      mod_files
    end

  end
end
