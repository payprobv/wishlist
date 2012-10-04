module Wishlist
  class Member < Wishlist::Base
    
    def initialize(client, options = {})
      super
      @endpoint = '/members'
    end

    # GET /members
    def all
      page = agent.get path
      Yajl::Parser.parse(page.body)
    end

    # GET /members/{member_id}
    def find(member_id)
      page = agent.get path(member_id)
      Yajl::Parser.parse(page.body)
    end

    # POST /members
    def create(data = {})
      [:user_login, :user_email].each do |attribute|
        raise "`#{attribute}` is required." unless (data.has_key?(attribute) || data.has_key?(attribute.to_s))
      end
      agent.post path, data
    end

    # PUT /members/{member_id}
    def update(member_id, data = {})
      agent.put path(member_id), data, { 'Content-Length' => data.to_query.length }
    end

    # DELETE /members/{member_id}
    def delete(member_id)
      agent.delete path(member_id)
    end
    
    
    def path(member_id = nil)
      if member_id
        return "#{client.url}#{endpoint}/#{member_id}"
      else
        return "#{client.url}#{endpoint}"
      end
    end
    
  end
end
