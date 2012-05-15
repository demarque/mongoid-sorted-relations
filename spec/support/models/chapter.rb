class Chapter
  include Mongoid::Document

  field :title

  attr_accessible :title

  belongs_to :book
end
