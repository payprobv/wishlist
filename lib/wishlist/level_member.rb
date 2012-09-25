module Wishlist
  class LevelMember < Wishlist::Base
    
    def initialize(client, options = {})
      super
      @path = '/levels/%s/members'
    end
    
    # GET /levels/{level_id}/members
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['members']['member']
    end
    
    # GET /levels/{level_id}/members/{member_id}
    def find(member_id)
      page = agent.get path(member_id)
      Yajl::Parser.parse(page.body)['member']
    end
    
    # POST /levels/{level_id}/members
    # TODO
    def create(data = {})
      raise '`users` is requires' unless data.has_key?('users')
      raise '`users` must be an array' unless data['users'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # PUT /levels/{level_id}/members/{member_id}
    def update(member_id, data = {})
      agent.put path(member_id), data.to_query
    end
    
    # DELETE /levels/{level_id}/members/{member_id}
    def delete(member_id)
      agent.delete path(member_id)
    end
    
  end
end
