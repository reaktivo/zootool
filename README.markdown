Node Zootool API wrapper
========================

Provides a javascript wrapper around the [Zootool API](http://zootool.com/api). Inspired by [ryanmauer's Zootool ruby wrapper](https://github.com/ryanmauer/zootool)

Zootool is about collecting, organizing and sharing your favorite images, videos, documents and links from all over the internet. This node module gives you a simple and easy way to access everything Zootool from your javascript projects.


Installation
------------

    npm install zootool


Usage
-----

Using this node module is simple. You simply create a Zootool object:
    
    var Zootool = require('zootool')

You'll access everything through a Zootool object
    
    var zoo = new Zootool('your_api_key_here')

And use its users, item, and items methods to access data from Zootool:

    // Get items for a specific user. 
    // An array of items is sent as the second argument to the callback function
    zoo.users.items({username: 'reaktivo'}, function(err, items){
      items.forEach(function(item){
        console.log(item.title);
      });
    });

    // Get info for a single item
    // zoo.item == zoo.items.info    
    var uid = '1kf7s';
    zoo.item(uid, function(err, item){
      console.log(item.title);
    });

    // Gets the most popular items today.
    var popular_today = zoo.items.popular.today(function(items){
      // do something with items array
    });

Testing
-------

Tests use vows, be sure to install it globally using

    npm install vows -g
    
To run tests call

    API_KEY=YOUR_API_KEY npm test
    

More Examples
-------------

If you learn by example, this should show you pretty much everything you need to know to start using this gem:

    // Example queries
    var info = zoo.users.info({username: 'reaktivo'}, callback);
    var friends = zoo.users.friends({username: 'reaktivo'}, callback);
    var followers = zoo.users.followers({username: 'reaktivo'}, callback);
    var inspiration_items = zoo.users.items({username: 'reaktivo', tag: 'inspiration'});
    var inspiration_items = zoo.users.items.all({tag: 'inspiration'}, callback);
    var paged_items = zoo.users.items({limit: 10, offset: 20}, callback);
    var popular_today = zoo.items.popular.today(callback);
    
    // Using the returned data
    var first_title = popular_today[0]['title']
    var first_thumb = popular_today[0]['thumbnail']

Features
--------

 - Query items by user
 - Query items for all users
 - Query popular items
 - Query items by tag
 - Perform paging of items using limit and offset parameters
 - Access user info, friends, followers, and profiles

Planned Features
----------------

 - Authentication to allow access to private items
 - Saving items to Zootool

Contributing to zootool
-----------------------

 - Check out the latest master to make sure the feature hasn’t been implemented or the bug hasn’t been fixed yet
 - Check out the issue tracker to make sure someone already hasn’t requested it and/or contributed it
 - Fork the project
 - Start a feature/bugfix branch
 - Commit and push until you are happy with your contribution
 - Make sure to add tests for it. This is important so I don’t break it in a future version unintentionally.


Copyright © 2011 Marcel Miranda. See LICENSE for further details.