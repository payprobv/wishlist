require 'mechanize'
require 'yajl'
require 'active_support/core_ext/object'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/array'

%w(client base authentication category comment level level_member member page post protected_category protected_page protected_post).each { |f|
  require [File.dirname(__FILE__), 'wishlist', f].join('/')
}

module Wishlist
  
  API_ENDPOINT = '?/wlmapi/2.0/json'
  
  class << self
    def client(domain, key)
      Wishlist::Client.new(domain, key)
    end
  end

end
