Mongoid Sorted Relations [![Build Status](https://secure.travis-ci.org/demarque/mongoid-sorted-relations.png?branch=master)](http://travis-ci.org/demarque/mongoid-sorted-relations)
===============

Problem
-------

In Mongoid, the HABTM relations return docs in the wrong order.
This gem will give your document the ability to retrieve it's relations in the same order it was placed in.

For more details about this issue, see [#1548](https://github.com/mongoid/mongoid/issues/1548)

Install
-------

```
gem install mongoid-sorted-relations
```

Rails 3
-------

In your Gemfile:

```ruby
gem 'mongoid-sorted-relations'
```

Usage
-----

#### Model integration

```ruby
class Book
  include Mongoid::Document
  include Mongoid::SortedRelations

  has_many :chapters
  has_and_belongs_to_many :authors

  init_sorted_relations
end
```

It's important to place the ```init_sorted_relations``` after the declaration of your relations.


### Getting the relations in the right order

Mongoid::SortedRelations will add a ```sorted_``` methods to all the has_many and habtm relationships.

```ruby
book = Book.new title: 'The Art of War'
book.authors << Author.create name: "Sun Tzu"
book.authors << Author.create name: "Sun Wu"
book.authors << Author.create name: "Lao Zi"

book.sorted_authors.map(&:name)
#=> ['Sun Tzu', 'Sun Wu', 'Lao Zi']

book.sorted_authors.limit(2).map(&:name)
#=> ['Sun Tzu', 'Sun Wu']
```


Copyright
---------

Copyright (c) 2012 De Marque inc. See LICENSE for further details.
