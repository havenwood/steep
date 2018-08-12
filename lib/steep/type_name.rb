module Steep
  module TypeName
    class Base
      attr_reader :name

      def initialize(name:)
        @name = name
      end

      def ==(other)
        other.is_a?(self.class) && other.name == name
      end

      def hash
        self.class.hash ^ name.hash
      end

      alias eql? ==

      def to_s
        name.to_s
      end

      def map_module_name
        self.class.new(name: yield(name))
      end
    end

    class Interface < Base
      def initialize(name:)
        name.is_a?(InterfaceName) or raise "name should be InterfaceName: #{name.inspect}"
        super
      end

      def map_module_name
        self
      end
    end

    class Class < Base
      attr_reader :constructor

      def to_s
        k = case constructor
            when nil
              ""
            when true
              " constructor"
            when false
              " noconstructor"
            end

        "#{name}.class#{k}"
      end

      def initialize(name:, constructor:)
        super(name: name)
        @constructor = constructor
      end

      def ==(other)
        other.is_a?(self.class) && other.name == name && other.constructor == constructor
      end

      def hash
        self.class.hash ^ name.hash ^ constructor.hash
      end

      NOTHING = Object.new

      def updated(constructor: NOTHING)
        if NOTHING == constructor
          constructor = self.constructor
        end

        self.class.new(name: name, constructor: constructor)
      end

      def map_module_name
        self.class.new(name: yield(name), constructor: constructor)
      end
    end

    class Module < Base
      def to_s
        "#{name}.module"
      end
    end

    class Instance < Base; end

    class Alias < Base
      def initialize(name:)
        name.is_a?(AliasName) or raise "name should be AliasName: #{name.inspect}"
        super
      end

      def map_module_name
        self
      end
    end
  end
end
