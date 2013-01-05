require 'test_helper'

module TransientObjects
  class Family
    attr_accessor :name, :members

    def initialize name
      @name = name
      @members = Array.new
    end
  end

  class User
    attr_accessor :name, :families

    def initialize name
      @name = name
    end
  end

  class UserMergerTest < ActiveSupport::TestCase
    def setup
      @flintstones = Family.new( "Flintstone, Fred & Wilma" )
      @rubbles = Family.new( "Rubble, Barney & Betty" )

      @fred = User.new( "Fred" )
      @fred.families = [ @flintstones, @rubbles ]

      @barney = User.new( "Barney" )
      @barney.families = [ @rubbles ]

      @flintstones.members = [ User.new( "Fred" ), User.new( "Fred" ) ]
      @um = UserMerger.new [ @fred, @barney ]
    end

    test "initialize" do
      assert_equal UserMerger, @um.class
    end

    test "users with multiple families" do
      assert_equal 1, @um.users_with_multiple_families.size
    end

    test "families" do
      assert_equal 1, @um.families.size
    end

    # This needs to be tested in the main app
    test "merge duplicate users" do
      # @um.merge_duplicate_users @um.families[0]
      # @flintstones.reload
      # assert_equal 1, @flintstones.members.count
    end
  end

end
