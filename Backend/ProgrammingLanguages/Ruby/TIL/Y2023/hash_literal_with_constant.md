~~~ruby
module SampleModuleStatus
  MY_STATUSES = {
    (A = 0) => '?',
    (B = 2) => 'Biii',
    (C = 3) => 'Ciii',
    (D = 7) => 'Diii',
    (E = 5) => 'Eiii',
    (F = 6) => 'Fiii',
    (G = 8) => 'Giii',
    (H = 1) => 'Hiii',
    (I = 4) => 'Iiii'
  }
end

# below is the same

module SampleModuleStatus
  A = 0
  B = 2
  C = 3
  D = 7
  E = 5
  F = 6
  G = 8
  H = 1
  I = 4

  MY_STATUSES = Hash[
    A, '?',
    B, 'Biii',
    C, 'Ciii',
    D, 'Diii',
    E, 'Eiii',
    F, 'Fiii',
    G, 'Giii',
    H, 'Hiii',
    I, 'Iiii'
  ]
end

module SampleModuleStatus
  A = 0
  B = 2
  C = 3
  D = 7
  E = 5
  F = 6
  G = 8
  H = 1
  I = 4

  MY_STATUSES = [
    [A, '?'],
    [B, 'Biii'],
    [C, 'Ciii'],
    [D, 'Diii'],
    [E, 'Eiii'],
    [F, 'Fiii'],
    [G, 'Giii'],
    [H, 'Hiii'],
    [I, 'Iiii]'
  ].to_h
end
~~~


### notes
~~~ruby
# both are the same
# Hash[one: 1, two: 1]
# {one: 1, two: 2}
~~~
