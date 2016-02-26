require 'modiz/version'
require 'quest_builder'
require 'challenge_builder'
require 'steps_builder'
require 'errors'

module Modiz
  class Parser
    def initialize quest_file
      @lines = quest_file.lines
      validate_links
      validate_file_structure
    end

    def self.run quest_file
      new(quest_file).hash
    end

    def hash
      {     quest_details: QuestBuilder.new(quest_lines).to_hash,
                    steps: StepsBuilder.new(steps_string).to_array,
        challenge_details: ChallengeBuilder.new(challenge_lines).to_hash }
    end

    private

    def quest_lines
      @lines[0...steps_index]
    end

    def steps_string
      @lines[steps_index + 1...challenge_index].join.strip
    end

    def challenge_lines
      @lines[challenge_index..-1]
    end

    def steps_index
      @lines.index {|s| s.include?("## Etapes")}
    end

    def challenge_index
      @lines.index {|s| s.include?("## Challenge")}
    end

    def validate_file_structure
      raise InvalidQuest::NoStepsNorChallenges unless steps_index || challenge_index
      raise InvalidQuest::NoSteps if steps_string.empty?
    end

    def validate_links
      invalid_urls = every_urls.map do |url|
        valid_format?(url) ? nil : url
      end.compact
      raise InvalidQuest::InvalidLink.new invalid_urls.join(', ') if invalid_urls.any?
    end

    def every_urls
      @lines.map{|url| url.scan(/]\(([^)]+)\)/)}.flatten
    end

    def valid_format? url
      url.match(/https?:\/\/[\S]+/) ? true : false
    end
  end

  def self.listify string
    string.join.split(%r{\n\s*\*})
          .map(&:strip)
          .reject(&:empty?)
  end
end
