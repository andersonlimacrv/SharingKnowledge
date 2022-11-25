- scenario testing birthday with checking against to current date

```html
describe "some set of tests to mock" do
  before do
    travel_to Time.local(1994)
  end

  after do
    travel_back
  end

  ### your tests here
end
```

[source](https://andycroll.com/ruby/replace-timecop-with-rails-time-helpers-in-rspec/)
