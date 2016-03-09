require 'yaml'

module Modiz
  class InvalidQuest < Exception
    def self.load_messages klass
      error_messages = YAML.load_stream(File.read('lib/errors/messages.yml')).first
      error_messages[klass.split('::').last]
    end

    class Standard < StandardError
      def initialize *param
        @param = param
      end

      def message
        InvalidQuest.load_messages(self.to_s) + @param.to_s
      end
    end

    class NoStepDelimiter           < Standard; end
    class NoChallengeDelimiter      < Standard; end
    class NoStepsContent            < Standard; end
    class NoChallengeContent        < Standard; end
    class NoQuestTitle              < Standard; end
    class NoQuestObjectives         < Standard; end
    class NoQuestDescription        < Standard; end
    class NoChallengeTitle          < Standard; end
    class NoChallengeCriteriaMarkup < Standard; end
    class NoChallengeDescription    < Standard; end
    class NoChallengeCriteria       < Standard; end
    class NoStepTitle               < Standard ; def initialize param ; super ; end ; end
    class InvalidLink               < Standard ; def initialize param ; super ; end ; end
    class DoubleLineMissing         < Standard ; def initialize param ; super ; end ; end
  end
end
