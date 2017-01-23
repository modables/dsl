module ModablesDSL
  module Generate

    def self.files
      self.stack_files.each do |moda_file|

        file_prefix = moda_file.rpartition('.moda').first
        file_suffix = ModablesDSL::Cli.opts['ext-json'] || ModablesDSL::Config.get['dsl']['ext_json']

        destination_file = "#{file_prefix}.#{file_suffix}"

        ModablesDSL::Message.log.info "Reading from #{moda_file}"

        File.open(destination_file, 'w') do |new_file|
          new_file.write ModablesDSL::DSL.instance_eval IO.read moda_file
        end
        
        ModablesDSL::Message.log.info "Wrote to #{destination_file}"
      end
    end

    def self.stack_files

      moda_files = Array.new
      stack_dirs = ModablesDSL::Config.get['dsl']['stack_dirs'] << Dir.pwd

      stack_dirs.each do |dir|
        moda_files += Dir.glob("#{dir}/**/*.moda")
      end

      total_moda_files = moda_files.size

      if total_moda_files == 0
        ModablesDSL::Message.log.info '0 moda files found.'
        exit 0
      else
        ModablesDSL::Message.log.info "#{total_moda_files} moda #{"file".pluralize(total_moda_files)} found"
      end

      moda_files
    end

  end
end
