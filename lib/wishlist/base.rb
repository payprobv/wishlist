module Wishlist
  class Base
    
    attr_accessor :client
    attr_accessor :agent
    attr_accessor :options
    
    attr_accessor :path

    def initialize(client, options = {})
      @client = client
      @agent = client.agent
      @options = options
    end
    
    
    
    private
    
    def path(member_id = nil)
      if member_id
        "#{client.url}#{@path % [options[:level_id]]}/#{member_id}"
      else
        "#{client.url}#{@path % [options[:level_id]]}"
      end
    end
    
  end
end
