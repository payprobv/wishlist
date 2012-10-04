# Wishlist

Wishlist gem is a wrapper for a Wordpress Wishlist Member plugin API.

## Installation

Add this line to your application's Gemfile:

    gem 'wishlist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wishlist

## Usage

    wishlist = Wishlist.client('<www.domain.cxx>', '<key>')
    
    levels = wishlist.levels.all
    level_id = levels[0]['id']



### LEVELS

    GET /levels
    wishlist.levels.all

    GET /levels/{level_id}
    wishlist.levels.find(level_id)

    POST /levels
    wishlist.levels.create('name' => 'Een Naam')

    PUT /levels/{level_id}
    wishlist.levels.update(level_id, 'name' => 'Andere Naam')

    DELETE /levels/{level_id}
    wishlist.levels.delete(level_id)



### LEVEL MEMBERS

    GET /levels/{level_id}/members
    wishlist.level_members(:level_id => level_id).all
    
    GET /levels/{level_id}/members/{member_id}
    wishlist.level_members(:level_id => level_id).find(member_id)
    
    POST /levels/{level_id}/members
    wishlist.level_members(:level_id => level_id).create('Users' => [id1, id2, ..., idN], 'Pending' => true)
    
    PUT /levels/{level_id}/members/{member_id}
    wishlist.level_members(:level_id => level_id).update(member_id, 'Users' => [id1, id2, ..., idN])
    
    DELETE /levels/{level_id}/members/{member_id}
    wishlist.level_members(:level_id => level_id).delete(member_id)



### POSTS

    GET /levels/{level_id}/posts
    wishlist.posts(:level_id => level_id).all
    
    POST /levels/{level_id}/posts
    wishlist.posts(:level_id => level_id).create('contentids' => [id1, id2, ..., idN])
    
    DELETE /levels/{level_id}/posts/{post_id}
    wishlist.posts(:level_id => level_id).delete(post_id)



### PAGES

    GET /levels/{level_id}/pages
    wishlist.pages(:level_id => level_id).all
    
    POST /levels/{level_id}/pages
    wishlist.pages(:level_id => level_id).create('contentids' => [id1, id2, ..., idN])
    
    DELETE /levels/{level_id}/pages/{page_id}
    wishlist.pages(:level_id => level_id).delete(page_id)



### COMMENTS

    GET /levels/{level_id}/comments
    wishlist.comments(:level_id => level_id).all
    
    POST /levels/{level_id}/comments
    wishlist.comments(:level_id => level_id).create('contentids' => [id1, id2, ..., idN])
    
    DELETE /levels/{level_id}/comments/{post_id}
    wishlist.comments(:level_id => level_id).delete(post_id)



### CATEGORIES

    GET /levels/{level_id}/categories
    wishlist.categories(:level_id => level_id).all

    POST /levels/{level_id}/categories
    wishlist.categories(:level_id => level_id).create('contentids' => [id1, id2, ..., idN])

    DELETE /levels/{level_id}/categories/{page_id}
    wishlist.categories(:level_id => level_id).delete(page_id)



### PROTECTED POSTS

    GET /protected/posts
    wishlist.protected_posts.all
    
    POST /protected/posts
    wishlist.protected_posts.create('contentids' => [id1, id2, ..., idN])
    
    DELETE /protected/posts/{post_id}
    wishlist.protected_posts.delete(post_id)



### PROTECTED PAGES

    GET /protected/pages
    wishlist.protected_pages.all
    
    POST /protected/pages
    wishlist.protected_pages.create('contentids' => [id1, id2, ..., idN])
    
    DELETE /protected/pages/{page_id}
    wishlist.protected_pages.delete(page_id)



### PROTECTED CATEGORIES

    GET /protected/categories
    wishlist.protected_categories.all
    
    POST /protected/categories
    wishlist.protected_categories.create('contentids' => [id1, id2, ..., idN])
    
    DELETE /protected/categories/{category_id}
    wishlist.protected_categories.delete(category_id)



### MEMBERS

    GET /members
    wishlist.members.all
    
    GET /members/{member_id}
    wishlist.members.find(1)
    
    POST /members
    wishlist.members.create('user_login' => 'paypro', 'user_email' => 'user1@paypro.nl')
    
    PUT /members/{member_id}
    wishlist.members.update(7, 'user_email' => 'user2@paypro.nl')
    
    DELETE /members/{member_id}
    wishlist.members.delete(7)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
