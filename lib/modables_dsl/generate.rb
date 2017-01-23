module ModablesDSL
  module Generate

    def self.files
      self.stack_files.each do |morb_file|

        file_prefix = morb_file.rpartition('.mo').first
        file_suffix = ModablesDSL::Cli.opts['ext-json'] || ModablesDSL::Config.get['dsl']['ext_json']

        destination_file = "#{file_prefix}.#{file_suffix}"

        ModablesDSL::Message.log.info "Reading from #{morb_file}"

        File.open(destination_file, 'w') do |new_file|
          new_file.write ModablesDSL::DSL.instance_eval IO.read morb_file
        end
        
        ModablesDSL::Message.log.info "Wrote to #{destination_file}"
      end
    end

    def self.stack_files

      morb_files = Array.new
      stack_dirs = ModablesDSL::Config.get['dsl']['stack_dirs'] << Dir.pwd

      stack_dirs.each do |dir|
        morb_files += Dir.glob("#{dir}/**/*.mo.rb")
      end

      total_morb_files = morb_files.size

      if total_morb_files == 0
        ModablesDSL::Message.log.info '0 morb files found.'
        exit 0
      else
        ModablesDSL::Message.log.info "#{total_morb_files} morb #{"file".pluralize(total_morb_files)} found"
      end

      morb_files
    end

  end
end
