require File.expand_path('../../../spec_helper.rb', __FILE__)

describe Wishlist::Member do
  
  before do
    @wishlist = Wishlist.client ENV['WL_DOMAIN'], ENV['WL_KEY']
  end
  
  describe "GET /members" do
    
    before do
      VCR.insert_cassette 'members/all', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "gets all members" do
      @wishlist.members.all.must_be_instance_of Hash
    end

  end
  
  describe "GET /members/{member_id}" do
    before do
      VCR.insert_cassette 'members/find', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "get one member" do
      member = @wishlist.members.find(5)
      member.must_be_instance_of Hash
      member['member'][0]['ID'].must_equal '5'
    end
  end
  
end