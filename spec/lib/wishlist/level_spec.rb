require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::Level do
  
  before do
    @wishlist = Wishlist.client ENV['WL_DOMAIN'], ENV['WL_KEY']
  end
  
  describe "GET /levels" do
    
    before do
      VCR.insert_cassette 'levels', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "gets all levels" do
      @wishlist.levels.all.must_be_instance_of Hash
    end

  end
  
end