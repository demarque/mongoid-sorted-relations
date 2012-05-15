module Mongoid
  class FakeCriteria
    def initialize(documents)
      @documents = documents
    end

    def limit(quantity)
      Mongoid::FakeCriteria.new(@documents[0..quantity-1])
    end

    def raw
      @documents
    end

    def method_missing(*args, &block)
      @documents.send(*args, &block)
    end
  end
end
