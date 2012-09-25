module Wishlist
  class Level < Wishlist::Base
    
    
    RESOURCE_PATH = '/levels'
    
    def initialize(client, options = {})
      super
      @path = '/levels'
    end
    
    # GET /levels
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['levels']['level']
    end
    
    # GET /levels/{level_id}
    def find(level_id)
      page = agent.get path(level_id)
      Yajl::Parser.parse(page.body)['level']
    end
    
    # POST /levels
    def create(data = {})
      agent.post path, data.to_query
    end
    
    # PUT /levels/{level_id}
    def update(level_id, data = {})
      agent.put path(level_id), data.to_query
    end
    
    # DELETE /levels/{level_id}
    def delete(level_id)
      agent.delete path(level_id)
    end
    
  end
end
