require "modables_dsl"

require 'json'
require "test/unit"

module TestModablesDSL
  class DSL < Test::Unit::TestCase

    def test_basic

      json_blob = ModablesDSL::DSL.instance_eval do
        gen do
          provider :aws do
            region 'us-east-1'
          end

          resource :aws_vpc, :test do
            name 'test-vpc'
            cidr_block '10.0.0.0/16'

            tags do
              Name 'Test VPC'
            end
          end

          resource :aws_customer_gateway, :test do
            bgp_asn 65000
            ip_address '127.0.0.1'
            type 'ipsec.1'
          end

          resource :aws_network_interface, :test do
            subnet_id 'subnet-e5aa89a3'
            private_ips %w(10.0.0.4 10.0.0.5)
            security_groups ['sg-4jmye518', 'sg-mr8nw4ai']
          end
        end

      end

      mod_hash = JSON.parse json_blob

      # Ensure scaffolding is built properly
      assert mod_hash.has_key? 'resource'
      assert mod_hash.has_key? 'provider'

      # String
      assert_equal 'us-east-1', mod_hash['provider']['aws']['region']

      # Integer
      assert_equal 65000, mod_hash['resource']['aws_customer_gateway']['test']['bgp_asn']

      # Array
      assert_equal %w(10.0.0.4 10.0.0.5), mod_hash['resource']['aws_network_interface']['test']['private_ips']

      # Hash
      assert_equal({'Name' => 'Test VPC'}, mod_hash['resource']['aws_vpc']['test']['tags'])

    end

  end
end
