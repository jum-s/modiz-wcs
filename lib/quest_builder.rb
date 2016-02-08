require 'pry'
module Modiz
  class QuestBuilder
    attr_reader :to_hash

    def initialize(quest_lines)
      @lines = quest_lines
    end

    def to_hash
      { title: title,
      description: description,
      goal: goal }
    end

    private

    def title
      @lines.first.tr("#", "").strip
    end

    def goal
      @lines[goal_index + 1...-1]
        .select{ |a| a.match(/^\*(.*)|\+(.*)|\-(.*)$/)} # select only * + or - bullet list
        .map{ |goal| goal[/\w(.*)$/].strip}             # delete bullet
    end

    def description
      @lines[1...goal_index].join.strip
    end

    def goal_index
      @lines.index {|s| s.include?("## Objectifs")}
    end
  end
end
