module Wishlist
  class ProtectedPost < Wishlist::Base
        
    def initialize(client, options = {})
      super
      @path = '/protected/posts'
    end
    
    # GET /protected/posts
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['posts']['post']
    end
    
    # POST /protected/posts
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /protected/posts/{post_id}
    def delete(post_id)
      agent.delete path(post_id)
    end
    
  end
end