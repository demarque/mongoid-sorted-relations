module Mongoid
  module SortedRelations
    extend ActiveSupport::Concern

    def self.included(base)
      base.after_initialize :freeze_relation_ids
    end

    def freeze_relation_ids
      @cache_sorted_documents = {}

      self.relations.each do |k,v|
        if [:references_many, :references_and_referenced_in_many].include? v.macro
          self.class.send(:define_method, "sorted_#{v.name}") { sorted_relation v }
        end
      end
    end

    def sorted_relation(relation)
      if not @cache_sorted_documents[relation.name]
        documents = self.send(relation.name).sort_by { |x| self.send(relation.key).index(x.id) }
        @cache_sorted_documents[relation.name] = Mongoid::FakeCriteria.new(documents)
      end

      return @cache_sorted_documents[relation.name]
    end
  end
end
