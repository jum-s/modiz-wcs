module Modiz
  class InvalidQuest < Exception
    class Standard < StandardError; end

    class NoStepsNorChallenges < Standard
      def message
        "Le fichier doit contenir ## Etapes et ## Challenge, réfère toi au modèle NEW.md dans le dossier Draft"
      end
    end

    class NoSteps < Standard
      def message
        "Le fichier doit contenir au moins une étape."
      end
    end

    class NoQuestTitle < Standard
      def message
        "Le fichier n'a pas de titre de quête. Ce doit être la première ligne du fichier et commencer par '# '"
      end
    end

    class NoQuestObjectives < Standard
      def message
        "Le fichier n'a pas d'objectif. La Quête doit contenir une liste objectifs avant la section Etapes "
      end
    end

    class NoQuestDescription < Standard
      def message
        "Le fichier n'a pas de description de quêtes. Donnez un peu de contexte tout de même !"
      end
    end

    class NoChallengeTitle < Standard
      def message
        "Le fichier doit contenir un challenge avec un titre."
      end
    end

    class NoChallengeCriteriaMarkup < Standard
      def message
        "Ta quête doit contenir le titre '### Critères de validation'."
      end
    end

    class NoChallengeDescription < Standard
      def message
        "Le challenge mérite d'être décrit."
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
          "Les liens '#{@lien}' ne sont pas des URL valides"
        else
          "Le lien '#{@lien}' n'est pas une URL valide"
        end
      end
    end
  end
end

# Validation step.title

# SyntaxError blank lines before & after title
# SyntaxError blank lines before & after list
