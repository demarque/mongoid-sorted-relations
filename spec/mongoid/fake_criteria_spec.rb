require 'spec_helper'

describe Mongoid::FakeCriteria do

  context "with the books ['book 1', 'book 2', 'book 3', 'book 4']" do
    let(:books) { Mongoid::FakeCriteria.new(['book 1', 'book 2', 'book 3', 'book 4']) }

    describe "#limit" do
      the ("books.limit(2).raw") { should eql ['book 1', 'book 2'] }
      the ("books.limit(0).raw") { should eql ['book 1', 'book 2', 'book 3', 'book 4'] }
      the ("books.limit(6).raw") { should eql ['book 1', 'book 2', 'book 3', 'book 4'] }
    end

    context "#count" do
      the ("books.count") { should eql 4 }
    end
  end

end
