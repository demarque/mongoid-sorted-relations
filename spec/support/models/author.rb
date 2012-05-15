class Author
  include Mongoid::Document

  field :name

  attr_accessible :name

  has_and_belongs_to_many :books
end
