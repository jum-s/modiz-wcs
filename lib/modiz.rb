require 'modiz/version'
require 'quest_builder'
require 'challenge_builder'
require 'steps_builder'
require 'errors'

module Modiz
  class Parser
    def initialize quest_file
      @lines = quest_file.lines
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
      raise InvalidQuest, 'Ta quête doit contenir un challenge !' unless challenge_index
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
