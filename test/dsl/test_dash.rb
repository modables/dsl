require "modables_dsl"

require 'test/unit'

module TestModablesDSL
  class DSL < Test::Unit::TestCase

    def test_dash

      mo_hash = ModablesDSL::DSL.instance_eval do
        morb do

          resource :google_compute_instance, :www_test do
            metadata do
              ssh_keys :dash, "ssh secret key"
            end
          end

        end
      end

      # Ensure underscore has been converted to dash
      assert(mo_hash[:resource][:google_compute_instance][:www_test][:metadata].has_key? 'ssh-keys')
    end

  end
end
