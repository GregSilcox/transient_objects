# encoding: utf-8
require 'spec_helper'

describe TransientObjects do
  describe ".format_url" do
    it "adds http:// to a URL if not provided" do
      UrlFormatter.format_url("example.com").should eq("http://example.com")
    end
  end
end
