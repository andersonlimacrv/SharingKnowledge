# frozen_string_literal: true

module ProgrammingLanguages
  module WebAssembly
    class Base
      def reference
        <<~REFERENCE.strip
          https://webassembly.org/
        REFERENCE
      end
    end
  end
end
