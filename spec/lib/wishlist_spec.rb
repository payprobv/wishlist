require File.expand_path('../../spec_helper.rb', __FILE__)

describe Wishlist do
  it "must have client class method" do
    Wishlist.must_respond_to :client
  end
  
  it "must return a client instance" do
    client = Wishlist.client 'www.dieetboekonline.nl', '1622787ca21b62eb4c80615001a2b410'
    client.must_be_kind_of Wishlist::Client
  end
end