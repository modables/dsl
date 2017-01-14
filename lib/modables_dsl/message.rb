module ModablesDSL
  module Message
    def self.log
      if @logger.nil?
        @logger = Logger.new(STDOUT)
        @logger.formatter = proc do |severity, datetime, progname, msg|
           "#{severity} #{datetime.strftime('%Y-%m-%d %H:%M:%S')} - #{msg}\n"
        end
      end
      @logger
    end

    def self.error msg
      self.log.error msg
      exit 1
    end
  end
end
