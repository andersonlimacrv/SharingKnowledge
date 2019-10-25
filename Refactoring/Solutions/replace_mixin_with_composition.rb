# frozen_string_literal: true

module Solutions
  class ReplaceMixinWithComposition
    def usage
      <<~USAGE.strip
        1. liberate business logic trapped in mixins
        2. eleminate name clashes from multiple mixins
        3. make a method in mixins easier test
      USAGE
    end

    def apply_for(*code_smells); end

    def reference
      <<~REFERENCE.strip
        1. https://engineering.entelo.com/understanding-inheritance-and-composition-in-ruby-edc46c0f96c7
        2. this link help us when to choose inheritance approach or composition approach
      REFERENCE
    end
  end
  # puts ReplaceMixinWithComposition.new.usage
end
