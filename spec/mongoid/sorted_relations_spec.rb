require 'spec_helper'

describe Mongoid::SortedRelations do
  context "having the book The Art of War" do
    let(:book) { Book.new(:title => 'The Art of War') }

    context "written by the authors Sun Tzu, Sun Wu and Lao Zi" do
      before { book.author_ids = [Author.create(:name => 'Sun Tzu').id, Author.create(:name => 'Sun Wu').id, Author.create(:name => 'Lao Zi').id] }
      before { book.save and book.reload }

      the("book.sorted_authors.map(&:name)") { should eql ['Sun Tzu', 'Sun Wu', 'Lao Zi'] }
    end
  end
end
