# frozen_string_literal: true

module Devops
  module MonitorSoftwareAndInfrastructure
    module LogManagement
      module LogDNA
        class Base
          def reference
            <<~REFERENCE.strip
              https://www.logdna.com/
            REFERENCE
          end
        end
      end
    end
  end
end
