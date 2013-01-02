require 'test_helper'

class TransientObjectsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, TransientObjects
  end
end
