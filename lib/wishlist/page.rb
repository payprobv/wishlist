module Wishlist
  class Page < Wishlist::Base
        
    def initialize(client, options = {})
      super
      @path = '/levels/%s/pages'
    end
    
    # GET /levels/{level_id}/pages
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['pages']['page']
    end
    
    # POST /levels/{level_id}/pages
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /levels/{level_id}/pages/{page_id}
    def delete(page_id)
      agent.delete path(page_id)
    end
    
  end
end
