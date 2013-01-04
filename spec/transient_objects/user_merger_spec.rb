require 'spec_helper'

describe TransientObjects do
  describe UserMerger do
    it "initializes" do
      um = TransientObjects::UserMerger.new [ "user1", "user2" ]
      um.should be_a( TransientObjects::UserMerger )
    end
  end
end
