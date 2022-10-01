# frozen_string_literal: true

module Devops
  module InfrastructureAsCode
    module ConfigurationManagement
      module Aws_cdk
        class Base
          def reference
            <<~REFERENCE.strip
              https://github.com/aws/aws-cdk
            REFERENCE
          end
        end
      end
    end
  end
end
