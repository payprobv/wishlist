require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::Authentication do
  
  describe "GET /auth" do
    it "records the fixture" do
      Wishlist.client '', ''
    end
  end
  
end