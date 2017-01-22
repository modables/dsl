require "modables_dsl"

require 'json'
require 'test/unit'

module TestModablesDSL
  class DSL < Test::Unit::TestCase

    def test_dash

      json_blob = ModablesDSL::DSL.instance_eval do
        moda do

          resource :google_compute_instance, :www_test do
            metadata do
              ssh_keys :dash, "ssh secret key"
            end
          end

        end
      end

      mod_hash = JSON.parse json_blob

      # Ensure underscore has been converted to dash
      assert(mod_hash['resource']['google_compute_instance']['www_test']['metadata'].has_key? 'ssh-keys')
    end

  end
end
