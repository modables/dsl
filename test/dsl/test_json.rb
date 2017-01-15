require "modables_dsl"

require 'json'
require 'test/unit'

module TestModablesDSL
  class DSL < Test::Unit::TestCase

    def test_json

      json_blob = ModablesDSL::DSL.instance_eval do
        gen do

          resource :aws_iam_role, :test do
            name 'test-role'

            assume_role_policy :json do
              Version '2012-10-17'
              Statement :list do
                Action 'sts:AssumeRole'
                Principal do
                  Service 'ec2.amazonaws.com'
                end
                Effect 'Allow'
                Sid ''
              end
            end

          end

        end
      end

      mod_hash = JSON.parse json_blob

      # JSON
      assert_equal(
        "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Effect\":\"Allow\",\"Sid\":\"\"}]}",
        mod_hash['resource']['aws_iam_role']['test']['assume_role_policy']
      )
    end

  end
end
