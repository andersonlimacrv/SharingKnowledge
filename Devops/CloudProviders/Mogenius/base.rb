# frozen_string_literal: true

module Devops
  module CloudProviders
    module Mogenius
      class Base
        def reference
          <<~REFERENCE.strip
            https://mogenius.com/
          REFERENCE
        end
      end
    end
  end
end
