module ModablesDSL
  module DSL

    def self.section *scaffold
      @data = Hash.new if @data.nil?

      yield_block = yield
      config_block = scaffold.reverse.inject(yield_block) { |k, v| { v => k } }
      @data.deep_merge!(config_block)
    end

    def self.property arg_name, arg_value
      @arguments.deep_merge!({ "#{arg_name}" => arg_value })
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
