# Modiz

A simple gem to parse Markdown files into Ruby hash. Teachers can write their courses with the One True Document Format -- Markdown.

Modiz takes the markdown course/quest and translates into a slightly nested Ruby dictionnary.

Output is intended to fit into Odyssey structure of object :
- Quest : composed of steps and a challenge
- Steps : array of 'chapters' students has to go through. Steps are composed of resources (URL)
- Challenge : has criteria

Ouputs should look like file `test/quest_output.yml`

## Installation

Add this Gemfile:

    gem 'modiz'

Then run:

    $ bundle install

## Usage

Parse a Markdown file:

    file_content = File.read("YOUR_FILE_PATH")
    Modiz::Parser.run(file_content)


## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WildCodeSchool/modiz. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

You can alos run notes to show current todos:

    run rake notes


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

created with ♥ by the WildCodeSchool
