module Wishlist
  class Comment < Wishlist::Base
        
    def initialize(client, options = {})
      super
      @path = '/levels/%s/comments'
    end
    
    # GET /levels/{level_id}/comments
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)['comments']['post']
    end
    
    # POST /levels/{level_id}/comments
    def create(data = {})
      raise '`contentids` is required.' unless data.has_key?('contentids')
      raise '`contentids` should be an array.' unless data['contentids'].is_a?(Array)
      agent.post path, data.to_query
    end
    
    # DELETE /levels/{level_id}/comments/{comment_id}
    def delete(comment_id)
      agent.delete path(comment_id)
    end
    
  end
end
