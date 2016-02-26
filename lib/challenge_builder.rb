module Modiz
  class ChallengeBuilder
    def initialize(quest_lines)
      @lines = quest_lines
      validations
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

    def validations
      unless title_index
        raise InvalidQuest::NoChallengeTitle
      end

      unless criterias_index
        raise InvalidQuest::NoChallengeCriteriaMarkup
      end

      if description.empty?
        raise InvalidQuest::NoChallengeDescription
      end

      if criterias.empty?
        raise InvalidQuest::NoChallengeCriteria
      end
   end
  end
end
