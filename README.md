# Crossrefapi

This is a Ruby Gem for working with the Crossref API.

This library was originally developed to meet particular requirements at (The International Union for Conservation of Nature)[https://iucn.org/](IUCN) to map the CrossRef API as closely as possible.  Before using this Gem, however, we would encourage you to also check out the excellent (Serrano)[https://github.com/sckott/serrano] Gem, which provides additional functionalities, as it might suit your use case better.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add crossrefapi

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install crossrefapi

## Usage

### Initializing a Client
To start interacting with the CrossRef API, first, initialize a `Client` instance:

```ruby
client = Crossrefapi::Client.new
```

### Works
#### Return metadata for the specified Crossref DOI

```ruby
doi = '10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en'
doi_info = client.works.by_doi(doi)
puts doi_info
```

#### Return the agency associated with a specific work by its DOI

```ruby
doi = '10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en'
agency_info = client.works.by_doi_agency(doi)
puts agency_info
```

### Prefixes
#### Return a list of works associated with specified {prefix}.

```ruby
prefix = '10.2305'
query = { 'query.container-title' => 'IUCN Red List of Threatened Species', 'offset' => '9980' }
prefix_info = client.prefixes.by_prefix_works(doi, query)
puts prefix_info
```

#### Returns metadata for the DOI owner prefix

```ruby
doi = '10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en'
agency_info = client.works.by_doi_agency(doi)
puts agency_info
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IUCN-UK/crossrefapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/IUCN-UK/crossrefapi/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Crossrefapi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/IUCN-UK/crossrefapi/blob/main/CODE_OF_CONDUCT.md).
