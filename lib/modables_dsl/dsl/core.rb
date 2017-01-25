module ModablesDSL
  module DSL

    # The section scaffolding is built by reading an array and creating a hash
    # with each element as a nested key of the previous element.
    def self.section *scaffold, &block
      @data = Hash.new if @data.nil?

      config_block = scaffold.reverse.inject(self.arguments(&block)) { |k, v| { v => k } }
      @data.deep_merge!(config_block)
    end

    # There are a number of sections supported, account for all of them.
    def self.method_missing meth, *args, &block
      self.section(*args.unshift(meth), &block)
    end

    # The arguments block is invoked inside section block to further build the hash.
    def self.arguments &block
      build = ModablesDSL::DSL::Args.new
      build.instance_eval(&block)
      build.args_h
    end

    def self.morb
      yield
      @data
    end

  end
end
