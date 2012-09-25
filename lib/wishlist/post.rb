module Wishlist
  class Post < Wishlist::Base
        
    def initialize(client, options = {})
      super
      @path = '/levels/%s/posts'
    end
    
    # GET /levels/{level_id}/posts
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['posts']['post']
    end
    
    # POST /levels/{level_id}/posts
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /levels/{level_id}/posts/{post_id}
    def delete(post_id)
      agent.delete path(post_id)
    end
    
  end
end
