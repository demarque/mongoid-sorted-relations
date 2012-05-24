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

  context "modifying a loaded model" do
    let (:book) {Book.new(:title => 'The Art of War')}

    it "enables sorting on a preloaded model" do
      author1 = Author.create(:name => 'auth1')
      author2 = Author.create(:name => 'auth2')
      book.authors << author2
      book.authors << author1
      book.sorted_authors.map(&:name).should eql ['auth2', 'auth1']
    end

  end

end
