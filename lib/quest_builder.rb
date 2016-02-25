require 'pry'

module Modiz
  class QuestBuilder
    attr_reader :to_hash

    def initialize(quest_lines)
      @lines = quest_lines
      validations
    end

    def to_hash
      {       title: title,
        description: description,
              goals: goals }
    end

    private
    def title
      @lines.first.tr("#", "").strip
    end

    def goals
      Modiz.listify @lines[goal_index + 1...-1]
    end

    def description
      @lines[1...goal_index].join.strip
    end

    def goal_index
      @lines.index {|s| s.include?("## Objectifs")}
    end

    def validations
      if title.empty?
        raise InvalidQuest, "Le fichier n'a pas de titre de quête. Ce doit être la première ligne du fichier et commencer par '# '"
      end

      unless goal_index
        raise InvalidQuest, "Le fichier n'a pas d'objectif. La Quête doit contenir une liste objectifs avant la section Etapes "
      end

      if description.empty?
        raise InvalidQuest, "Le fichier n'a pas de description de quêtes. Donnez un peu de contexte tout de même !"
      end
    end
  end
end
