module Modiz
  class ChallengeBuilder
    def initialize(quest_lines)
      @lines = quest_lines
    end

    attr_reader :to_hash

    def to_hash
      {      title: title,
       description: description,
          criteria: criterias }
    end

    private

    def title
      @lines[title_index].tr("###", "").strip
    end

    def description
      @lines[title_index + 1...criterias_index].join.strip
    end

    def criterias
      @lines[criterias_index + 1...-1]
        .select{ |a| a.match(/^\*(.*)|\+(.*)|\-(.*)$/)}
        .map{ |goal| goal[/\w(.*)$/].strip}
    end

    def title_index
      @lines.find_index { |line| /\A###\s/.match(line) }
    end

    def criterias_index
      @lines.find_index { |line| /\A### Crit/.match(line) }
    end
  end
end
