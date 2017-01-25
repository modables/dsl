require "modables_dsl"

require 'test/unit'

module TestModablesDSL
  class DSL < Test::Unit::TestCase

    def test_list

      mo_hash = ModablesDSL::DSL.instance_eval do
        morb do

          resource :aws_security_group, :test do
            name 'test-sg'
            description 'Test security group'

            ingress :list do
              from_port 22
              to_port 22
              protocol 'tcp'
              cidr_blocks ['10.0.0.0/24']
            end

            ingress :list do
              from_port 80
              to_port 80
              protocol 'tcp'
              cidr_blocks ['0.0.0.0/0']
            end

            egress do
              from_port 0
              to_port 0
              protocol '-1'
              cidr_blocks ['0.0.0.0/0']
            end

          end

        end
      end

      # JSON
      assert mo_hash[:resource][:aws_security_group][:test][:ingress].is_a? Array
    end

  end
end
