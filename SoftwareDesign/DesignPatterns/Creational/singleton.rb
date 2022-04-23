# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Creational
      class Singleton
        def definition
          RealWorldAnalogy.new(
            <<~DEFINE.strip
              a country can have only one officical goverment
            DEFINE
          )
        end

        RealWorldAnalogy = Struct.new(:context)

        # puts Singleton.new().definition
      end
    end
  end
end


### real world analogy
=begin
  The government is an excellent example of the Singleton pattern.
  A country can have only one official government.
  Regardless of the personal identities of the individuals who
  form governments, the title, “The Government of X”,
  is a global point of access that identifies the group of people in charge.
=end
# source: https://refactoring.guru/design-patterns/singleton
