module Modiz
  class InvalidQuest < Exception
    class Standard < StandardError; end

    class NoStepDelimiter < Standard
      def message
        "Le fichier doit contenir ## Etapes, réfère toi au modèle NEW.md dans le dossier Draft"
      end
    end

    class NoChallengeDelimiter < Standard
      def message
        "Le fichier doit contenir ## Challenge, réfère toi au modèle NEW.md dans le dossier Draft"
      end
    end

    class NoStepsContent < Standard
      def message
        "Le fichier doit contenir au moins une étape, avec un titre et une description."
      end
    end

    class NoChallengeContent < Standard
      def message
        "Le fichier doit contenir un challenge avec un titre, une description et des critères de validation."
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

    class NoStepTitle < Standard
      def message
        "Je n'ai réussi a trouver le titre de l'étape."
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

    class DoubleLineMissing < Standard
      def initialize line_index
        @line_index = line_index
      end

      def message
        "Tu n'as pas sauté de lignes après la(les) ligne(s): #{ @line_index.join(', ') }"
      end
    end
  end
end

# Validation step.title

