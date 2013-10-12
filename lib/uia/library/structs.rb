module Uia
  module Library
    module ElementLayout
      def self.included(base)
        base.class_eval do
          layout :handle, :int,
                 :runtime_id, :pointer,
                 :number_of_ids, :int,
                 :name, :string

          def handle
            self[:handle]
          end

          def runtime_id
            self[:runtime_id].read_array_of_int(number_of_ids)
          end

          def children(type=nil)
            elements = (type && Library.children_of_type(self, type)) || Library.children(self)
            elements.children
          end

          def name
            self[:name]
          end

          private
          def number_of_ids
            self[:number_of_ids]
          end
        end
      end
    end

    class ElementStruct < FFI::ManagedStruct
      include ElementLayout

      def self.release(pointer)
        Library.release_element(pointer)
      end
    end

    class ElementCast < FFI::Struct
      include ElementLayout
    end

    class ElementChildrenStruct < FFI::ManagedStruct
      layout :length, :int,
             :items, :pointer

      def children
        @children ||= self[:length].times.collect do |i|
          ElementCast.new(self[:items] + i * ElementCast.size)
        end
      end

      def self.release(pointer)
        Library.release_elements(pointer)
      end
    end
  end
end