require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::LevelMember do
  
  before do
    @wishlist = Wishlist.client ENV['WL_DOMAIN'], ENV['WL_KEY']
  end
  
  describe "GET /levels/{id}/members" do
    
    before do
      VCR.insert_cassette 'level_members/all', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "gets all level members" do
      @wishlist.level_members(:level_id => 1343822180).all.must_be_instance_of Hash
    end

  end
  
  describe "GET /levels/{level_id}/members/{member_id}" do
    before do
      VCR.insert_cassette 'level_members/find', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "get one level member" do
      level = @wishlist.level_members(:level_id => 1343822180).find(5)
      level.must_be_instance_of Hash
      level['member']['id'].must_equal '5'
    end
  end
  
end