# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Structural
      class Decorator
        def definition; end
      end
    end
  end
end


### real world analogy
=begin
  Wearing clothes is an example of using decorators.
  When you’re cold, you wrap yourself in a sweater.
  If you’re still cold with a sweater, you can wear a jacket on top.
  If it’s raining, you can put on a raincoat.
  All of these garments “extend” your basic behavior but aren’t part of you,
  and you can easily take off any piece of clothing whenever you don’t need it.
=end
# source: https://refactoring.guru/design-patterns/decorator
