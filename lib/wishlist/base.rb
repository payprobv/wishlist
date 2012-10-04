module Wishlist
  class Base
    
    attr_accessor :client
    attr_accessor :agent
    attr_accessor :options
    
    attr_accessor :endpoint

    def initialize(client, options = {})
      @client = client
      @agent = client.agent
      @options = options
    end
    
    
  end
end
