module Wishlist
  class Client
    
    attr_accessor :authentication
    
    def initialize(domain, url)
      @authentication = Wishlist::Authentication.new(domain, url)
      raise 'No credentials provided' if !authentication.valid?
    end
    
    def levels
      @levels = Wishlist::Level.new(authentication)
    end
    
    def level_members(options)
      puts "level_members: #{options.inspect}"
      @level_members = Wishlist::LevelMember.new(authentication, options)
    end
    
    
    def posts(options)
      @posts = Wishlist::Post.new(authentication, options)
    end
    
    def pages(options)
      @pages = Wishlist::Page.new(authentication, options)
    end
    
    def comments(options)
      @comments = Wishlist::Comment.new(authentication, options)
    end
    
    def categories(options)
      @categories = Wishlist::Category.new(authentication, options)
    end
    
    
    def protected_posts
      @protected_posts = Wishlist::ProtectedPost.new(authentication)
    end
    
    def protected_pages
      @protected_pages = Wishlist::ProtectedPage.new(authentication)
    end
    
    def protected_categories
      @protected_categories = Wishlist::ProtectedCategory.new(authentication)
    end
    
    
    def members
      @members = Wishlist::Member.new(authentication)
    end
    
  end
end
