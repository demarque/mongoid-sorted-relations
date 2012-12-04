module Mongoid
  module SortedRelations
    extend ActiveSupport::Concern

    def self.included(base)
      base.after_initialize :freeze_relation_ids
    end

    def freeze_relation_ids
      @cache_sorted_documents = {}
      @cache_sorted_ids = {}

      self.relations.each do |k,v|
        if [:has_many, :has_and_belongs_to_many].include? v.macro
          @cache_sorted_ids[v.key] = [self.send(v.key)].flatten.map{ |rid| rid.to_s }
          self.class.send(:define_method, "sorted_#{v.name}") { sorted_relation v }
        end
      end
    end

    def sorted_relation(relation)
      if not @cache_sorted_documents[relation.name]
        documents = self.send(relation.name).sort_by { |x| @cache_sorted_ids[relation.key].index(x.id.to_s) }
        @cache_sorted_documents[relation.name] = Mongoid::FakeCriteria.new(documents)
      end

      return @cache_sorted_documents[relation.name]
    end
  end
end
