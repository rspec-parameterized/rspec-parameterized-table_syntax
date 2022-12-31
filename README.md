# Rspec::Parameterized::TableSyntax
`rspec-parameterized-table_syntax` provides table syntax extension for [rspec-parameterized](https://github.com/tomykaira/rspec-parameterized).

[![Gem Version](https://badge.fury.io/rb/rspec-parameterized-table_syntax.svg)](https://badge.fury.io/rb/rspec-parameterized-table_syntax)
[![RSpec](https://github.com/rspec-parameterized/rspec-parameterized-table_syntax/actions/workflows/rspec.yml/badge.svg)](https://github.com/rspec-parameterized/rspec-parameterized-table_syntax/actions/workflows/rspec.yml)

## Installation
```ruby
# Install all components
group :test do
  gem "rspec-parameterized", ">= 1.0.0"
end

# Install only rspec-parameterized-table_syntax
group :test do
  gem "rspec-parameterized-table_syntax", ">= 1.0.0"
end
```

## Usage
### Table Syntax Style (like Groovy spock)
```ruby
describe "plus" do
  using RSpec::Parameterized::TableSyntax
  where(:a, :b, :answer) do
    1 | 2 | 3
    5 | 8 | 13
    0 | 0 | 0
  end
  with_them do
    it "should do additions" do
      expect(a + b).to eq answer
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rspec-parameterized/rspec-parameterized-table_syntax.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
