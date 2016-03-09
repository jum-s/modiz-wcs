module Modiz
  class InvalidQuest < Exception
    class Standard < StandardError; end

    class NoStepDelimiter < Standard
      def message
        "Je ne reconnais pas de ligne qui contient ## Etapes, réfère toi au modèle NEW.md dans le dossier Draft"
      end
    end

    class NoChallengeDelimiter < Standard
      def message
        "Je ne reconnais pas de ligne qui contient ## Challenge, réfère toi au modèle NEW.md dans le dossier Draft"
      end
    end

    class NoStepsContent < Standard
      def message
        "Je ne reconnais pas de lignes qui contient au moins une étape, avec un titre et une description."
      end
    end

    class NoChallengeContent < Standard
      def message
        "Je ne reconnais pas la ligne un challenge avec un titre, une description et des critères de validation."
      end
    end

    class NoQuestTitle < Standard
      def message
        "Je ne reconnais pas le titre de quête. Ce doit être la première ligne du fichier et commencer par '# '"
      end
    end

    class NoQuestObjectives < Standard
      def message
        "Je ne reconnais pas l'objectif. La Quête doit contenir une liste objectifs avant la section Etapes "
      end
    end

    class NoQuestDescription < Standard
      def message
        "Je ne reconnais pas le description de quêtes. Donnez un peu de contexte tout de même !"
      end
    end

    class NoStepTitle < Standard
      def message
        "Je n'ai pas réussi à trouver le titre de l'étape. La section étapes doit se diviser en plusieurs titres d'étapes commençant par '### ' "
      end
    end

    class NoChallengeTitle < Standard
      def message
        "Je ne reconnais aucun titre pour le challenge."
      end
    end

    class NoChallengeCriteriaMarkup < Standard
      def message
        "Ta quête doit contenir le titre '### Critères de validation'."
      end
    end

    class NoChallengeDescription < Standard
      def message
        "Le challenge mérite d'être décrit, non ?"
      end
    end

    class NoChallengeCriteria < Standard
      def message
        "Ta quête doit contenir une liste de critères."
      end
    end

    class InvalidLink < Standard
      def initialize lien
        @lien = lien
      end

      def message
        if @lien.split(',').count > 1
          "Les liens '#{@lien}' ne sont pas des URL valides. Elles commencent par 'http' !"
        else
          "Le lien '#{@lien}' n'est pas une URL valide. Elles commencent par 'http' !"
        end
      end
    end

    class DoubleLineMissing < Standard
      def initialize line_index
        @line_index = line_index
      end

      def message
        "Tu n'as pas sauté de lignes après chaque titre ou liste. Notamment sur la(les) ligne(s): #{ @line_index.join(', ') }"
      end
    end
  end
end
