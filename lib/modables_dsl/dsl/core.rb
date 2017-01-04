module ModablesDSL
  module DSL

    def self.section *scaffold, &block
      @data = Hash.new if @data.nil?

      config_block = scaffold.reverse.inject(self.arguments(&block)) { |k, v| { v => k } }
      @data.deep_merge!(config_block)
    end

    def self.method_missing meth, *args, &block
      self.section(*args.unshift(meth), &block)
    end

    def self.arguments &block
      build = ModablesDSL::DSL::Args.new
      build.instance_eval(&block)
      build.args_h
    end

    def self.encode_json
      ActiveSupport::JSON.encode(@data)
    end

    def self.gen
      yield
      self.encode_json
    end

  end
end
