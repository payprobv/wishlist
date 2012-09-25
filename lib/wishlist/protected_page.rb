module Wishlist
  class ProtectedPage < Wishlist::Base
    
    def initialize(client, options = {})
      super
      @path = '/protected/pages'
    end
    
    # GET /protected/pages
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['pages']['page']
    end
    
    # POST /protected/pages
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /protected/pages/{post_id}
    def delete(page_id)
      agent.delete path(page_id)
    end
    
  end
end