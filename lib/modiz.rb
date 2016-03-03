require 'modiz/version'
require 'builder'
require 'quest_builder'
require 'challenge_builder'
require 'steps_builder'
require 'errors'
require 'validator'

module Modiz
  class Parser
    def initialize quest_file
      @quest_file = quest_file
      validate_good_markdown
    end

    def self.run quest_file
      new(quest_file).hash
    end

    def hash
      {     quest_details: QuestBuilder.run(quest_lines),
                    steps: steps,
        challenge_details: ChallengeBuilder.run(challenge_lines) }
    end

    private

    def steps
      steps = steps_string.split(Modiz.title_hashtags(3)).reject(&:empty?)
      steps.map do |step|
        StepBuilder.run step
      end
    end

    def quest_lines
      @quest_file.lines[0...steps_index]
    end

    def steps_string
      @quest_file.lines[steps_index + 1...challenge_index].join.strip
    end

    def challenge_lines
      @quest_file.lines[challenge_index..-1]
    end

    def steps_index
      @quest_file.lines.index {|s| s.include?("## Etapes")}
    end

    def challenge_index
      @quest_file.lines.index {|s| s.include?("## Challenge")}
    end

    def validate_good_markdown
      Validator.run @quest_file
      validate_file_structure
      validate_file_content
    end

    def validate_file_structure
      raise InvalidQuest::NoStepDelimiter unless steps_index
      raise InvalidQuest::NoChallengeDelimiter unless challenge_index
    end

    def validate_file_content
      raise InvalidQuest::NoStepsContent if steps_string.empty?
      raise InvalidQuest::NoChallengeContent if challenge_lines.join.strip == "## Challenge"
    end
  end

  def self.listify string
    string.join.split(%r{\n\s*\*})
          .map(&:strip)
          .reject(&:empty?)
  end

  def self.title_hashtags size
    hashtags = '#' * size
    "\n#{hashtags} "
  end
end
