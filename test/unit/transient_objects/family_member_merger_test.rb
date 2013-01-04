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
    attr_accessor :name

    def initialize name
      @name = name
    end
  end

  class FamilyMemberMergerTest < ActiveSupport::TestCase
    def setup
      @flintstones = Family.new "Flintstone, Fred & Wilma"
      @flintstones.members = [ User.new( "Fred" ), User.new( "Fred" ) ]

      @rubbles = Family.new "Rubble, Barney & Betty"
      @rubbles.members = [ User.new( "Fred" ), User.new( "Barney" ) ]

      @families = [ @flintstones, @rubbles ]
      @fmm = FamilyMemberMerger.new( @families )
    end

    test "initialize" do
      assert_equal  FamilyMemberMerger, @fmm.class
    end

    test "families_with_duplicate_members" do
      dups = @fmm.families_with_duplicate_members
      assert_equal 1, dups.size
      assert_equal @flintstones, dups[ 0 ][ 0 ]
    end

    test "find_duplicate_members" do
      assert_equal 0, @fmm.find_duplicate_members( @rubbles ).size
      assert_equal 2, @fmm.find_duplicate_members( @flintstones ).size
    end
  end
end
