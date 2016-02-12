require 'modiz/version'
require 'quest_builder'
require 'challenge_builder'
require 'steps_builder'
require 'errors'

module Modiz
  class MdToHquest
    def initialize(quest_file)
      @lines = quest_file.lines
    end

    def run
      {     quest: QuestBuilder.new(quest_lines).to_hash,
            steps: StepsBuilder.new(steps_string).to_array,
        challenge: ChallengeBuilder.new(challenge_lines).to_hash }
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
  end
end
