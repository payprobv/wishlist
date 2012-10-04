module Wishlist
  class LevelMember < Wishlist::Base
    
    def initialize(client, options = {})
      super
      @endpoint = '/levels/%s/members'
    end
    
    # GET /levels/{level_id}/members
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)
    end
    
    # GET /levels/{level_id}/members/{member_id}
    def find(member_id)
      page = agent.get path(member_id)
      Yajl::Parser.parse(page.body)
    end
    
    # POST /levels/{level_id}/members
    # TODO
    def create(data = {})
      # raise '`users` is required' unless data.has_key?('users')
      # raise '`users` must be an array' unless data['users'].is_a?(Array)
      page = agent.post path, data
      Yajl::Parser.parse(page.body)
    end
    
    # PUT /levels/{level_id}/members/{member_id}
    def update(member_id, data = {})
      page = agent.put path(member_id), data
      Yajl::Parser.parse(page.body)
    end
    
    # DELETE /levels/{level_id}/members/{member_id}
    def delete(member_id)
      page = agent.delete path(member_id)
      Yajl::Parser.parse(page.body)
    end
    
    
    def path(member_id = nil)
      if member_id
        return "#{client.url}#{endpoint % [options[:level_id]]}/#{member_id}"
      else
        return "#{client.url}#{endpoint % [options[:level_id]]}"
      end
    end
    
  end
end
