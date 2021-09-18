# frozen_string_literal: true

module Devops
  module MonitorSoftwareAndInfrastructure
    module LogManagement
      module DataDog
        class Base
          def reference
            <<~REFERENCE.strip
              https://www.datadoghq.com/
            REFERENCE
          end
        end
      end
    end
  end
end
