# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Creational
      class Prototype
        def definition; end
      end
    end
  end
end


### real world analogy
=begin
  In real life, prototypes are used for performing various
  tests before starting mass production of a product.
  However, in this case, prototypes don’t participate
  in any actual production, playing a passive role instead.

  Since industrial prototypes don’t really copy themselves,
  a much closer analogy to the pattern is the process of mitotic
  cell division (biology, remember?). After mitotic division,
  a pair of identical cells is formed. The original cell acts as a
  prototype and takes an active role in creating the copy.
=end
# source: https://refactoring.guru/design-patterns/prototype
