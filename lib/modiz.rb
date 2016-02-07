require 'modiz/version'
require 'pry'
module Modiz

  class MdToHash
    def initialize(quest_file)
      @lines = quest_file.lines
    end

    def run
      quest_hash = {quest: quest_builder}
    end

    private

    def quest_builder
      Hash[ title: title,
            description: description,
            goal: goal ]
    end

    def title
      @lines.first.tr("#", "").strip
    end

    def goal
      @lines[goal_index + 1...steps_index].join.strip
    end

    def description
      @lines[1...goal_index].join.strip
    end

    def goal_index
      @lines.index {|s| s.include?("## Objectifs")}
    end

    def steps_index
      @lines.index {|s| s.include?("## Etapes")}
    end
  end
end
