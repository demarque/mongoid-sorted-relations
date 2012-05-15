class Book
  include Mongoid::Document
  include Mongoid::SortedRelations

  field :title

  attr_accessible :title

  has_many :chapters
  has_and_belongs_to_many :authors

  init_sorted_relations
end
