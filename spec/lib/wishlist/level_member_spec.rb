require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::LevelMember do
  
  before do
    @wishlist = Wishlist.client ENV['WL_DOMAIN'], ENV['WL_KEY']
  end
  
  describe "GET /levels/{id}/members" do
    
    before do
      VCR.insert_cassette 'level_members', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "gets all levels" do
      @wishlist.levels.all.must_be_instance_of Hash
    end

  end
  
  describe "GET /levels/{level_id}/members/{member_id}" do
    before do
      VCR.insert_cassette 'level_member', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "get one level" do
      level = @wishlist.levels.find(1344242131)
      level.must_be_instance_of Hash
      level['id'].must_equal '1344242131'
    end
  end
  
end