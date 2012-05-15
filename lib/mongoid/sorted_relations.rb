module Mongoid
  module SortedRelations
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def init_sorted_relations
        self.relations.each do |k,v|
          if [:references_many, :references_and_referenced_in_many].include? v.macro
            send(:define_method, "sorted_#{v.name}") { sorted_relation v }
          end
        end
      end
    end

    def sorted_relation(relation)
      ids = self.send(relation.key).map{ |rid| rid.to_s }

      documents = self.send(relation.name).sort_by { |x| ids.index(x.id.to_s) }

      return Mongoid::FakeCriteria.new(documents)
    end
  end
end
