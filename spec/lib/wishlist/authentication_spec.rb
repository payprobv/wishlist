require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::Authentication do
  

  describe "GET /auth" do
    before do
      VCR.insert_cassette 'auth', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end
    it "records the fixture" do
      Wishlist.client 'www.dieetboekonline.nl', '1622787ca21b62eb4c80615001a2b410'
    end
  end
  
end