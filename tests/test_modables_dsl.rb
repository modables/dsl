require "modables_dsl"

require 'json'
require "test/unit"


class TestModablesDSL < Test::Unit::TestCase

  def test_json
    response = ModablesDSL::DSL.instance_eval(File.read('main.tf.rb'))

    assert_block do
      JSON.parse(response)
    end

  end

end
