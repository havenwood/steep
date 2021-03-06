module Steep
  module AST
    module Types
      class Boolean
        attr_reader :location

        def initialize(location: nil)
          @location = location
        end

        def ==(other)
          other.is_a?(Boolean)
        end

        def hash
          self.class.hash
        end

        alias eql? ==

        def subst(s)
          self
        end

        def to_s
          "bool"
        end

        def free_variables
          Set.new
        end

        def level
          [0]
        end

        def with_location(new_location)
          self.class.new(location: new_location)
        end

        def back_type
          Union.build(types:
                      [
                        Name.new_instance(name: "::TrueClass", location: location),
                        Name.new_instance(name: "::FalseClass", location: location)
                      ],
                      location: location)
        end
      end
    end
  end
end

