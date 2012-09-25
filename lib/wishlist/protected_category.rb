module Wishlist
  class ProtectedCategory < Wishlist::Base
    
    def initialize(client, options = {})
      super
      @path = '/protected/categories'
    end
    
    # GET /protected/categories
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['categories']['category']
    end
    
    # POST /protected/categories
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /protected/categories/{category_id}
    def delete(category_id)
      agent.delete path(category_id)
    end
    
  end
end