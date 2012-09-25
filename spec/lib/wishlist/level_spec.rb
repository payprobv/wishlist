require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::Level do
  
  before do
    @wishlist = Wishlist.client 'www.dieetboekonline.nl', '1622787ca21b62eb4c80615001a2b410'
  end

  describe "GET /levels" do
    
    before do
      VCR.insert_cassette 'level', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "records the fixture" do
      @wishlist.levels.all.must_be_instance_of Hash
    end
    
  end
  
end