# frozen_string_literal: true

module Devops
  module MonitorSoftwareAndInfrastructure
    module LogManagement
      module Fluent
        class Base
          def reference
            <<~REFERENCE.strip
              https://www.fluentd.org/
            REFERENCE
          end
        end
      end
    end
  end
end
