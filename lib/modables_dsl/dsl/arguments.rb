module ModablesDSL
  module DSL
    class Args
      attr_reader :args_h

      def initialize
        @args_h = Hash.new
      end

      def method_missing meth, *args, &block
        if block
          if args.first == :list
            @args_h[meth] = Array.new if @args_h[meth].nil?
            @args_h[meth] << ModablesDSL::DSL.arguments(&block)
          else
            @args_h[meth] = ModablesDSL::DSL.arguments(&block)
          end
        else
          @args_h[meth] = args.first
        end
      end
    end
  end
end
