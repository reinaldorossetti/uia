module Uia
  class Element
    def initialize(element)
      @element = element
      @default = lambda { [:unknown] }
    end

    def control_type
      Library::Constants::ControlTypes.find(@default) { |_, v| v == control_type_id }.first
    end

    def patterns
      pattern_ids.map do |id|
        Library::Constants::Patterns.find(@default) { |_, v| v == id }.first
      end
    end

    def children
      @element.children.map { |c| Element.new c }
    end

    def descendants
      @element.descendants.map { |c| Element.new c }
    end

    def click
      Library.click(@element)
      true
    end

    def method_missing(meth, *args, &block)
      if @element.respond_to? meth
        return @element.send(meth, *args, &block)
      end
      super
    end
  end
end