require "modables_dsl"

require 'json'
require "test/unit"


class TestModablesDSL < Test::Unit::TestCase

  def test_json
    response = ModablesDSL::DSL.instance_eval(File.read('/Users/leroy/leroy/applayer/modables-dsl/examples/hello_world.rb'))

    assert_block do
      JSON.parse(response)
    end

  end

end
