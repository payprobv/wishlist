module Wishlist
  class Category < Wishlist::Base
        
    def initialize(client, options = {})
      super
      @path = '/levels/%s/categories'
    end
    
    # GET /levels/{level_id}/categories
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['categories']['category']
    end
    
    # POST /levels/{level_id}/categories
    # TODO
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /levels/{level_id}/categories/{category_id}
    # TODO
    def delete(category_id)
      agent.delete path(category_id)
    end
        
  end
end
