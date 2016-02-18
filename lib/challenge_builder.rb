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
      remove_markup @lines[title_index]
    end

    def description
      raise InvalidQuest, 'Ta quête doit contenir des critères de validation ! #{TODO : donner les lignes qui foirent}' unless criterias_index
      @lines[title_index + 1...criterias_index].join.strip
    end

    def criterias
      Modiz.listify @lines[criterias_index + 1..-1]
    end

    def remove_markup string
      string[/\w(.*)$/].strip
    end

    def include_bullet_point string
      string.match(/\*(.*)|\+(.*)|\-(.*)$/)
    end

    def title_index
      @lines.find_index { |line| /\A###\s/.match(line) }
    end

    def criterias_index
      @lines.find_index { |line| /\A### Crit/.match(line) }
    end
  end
end
