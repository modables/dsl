module ModablesDSL
  module DSL
    class Args
      attr_reader :args_h

      def initialize
        @args_h = Hash.new
      end

      def property meth, *args, &block

        if block
          if args.include? :list
            @args_h[meth] = Array.new if @args_h[meth].nil?

            if args.include? :json
              @args_h[meth] << ActiveSupport::JSON.encode(ModablesDSL::DSL.arguments(&block))
            else
              @args_h[meth] << ModablesDSL::DSL.arguments(&block)
            end
          else
            if args.include? :json
              @args_h[meth] = ActiveSupport::JSON.encode(ModablesDSL::DSL.arguments(&block))
            else
              @args_h[meth] = ModablesDSL::DSL.arguments(&block)
            end
          end

        else
          if args.include? :json
            @args_h[meth] = ActiveSupport::JSON.encode(args.last)
          else
            @args_h[meth] = args.last
          end
        end

      end

      def method_missing meth, *args, &block
        property meth, *args, &block
      end

      def test *args, &block
        property 'test', *args, &block
      end

    end
  end
end
