require './test/test_helper'
require 'yaml'

module Modiz
  class ParserTest < Minitest::Test
    def test_invalid_file_structure
      err = assert_raises InvalidQuest::NoStepsNorChallenges do ; Parser.run('') ; end
      assert_match /Le fichier doit contenir ## Etapes et ## Challenge/, err.message
    end

    def test_no_steps
      quest_file = "\n\n## Etapes\n\n## Challenge\n\n"
      assert_raises InvalidQuest::NoSteps do ; Parser.run(quest_file) ; end
    end

    def test_no_quest_title
      quest_file = "\nfoo\n## Objectifs\n\n## Etapes\nfoo\n## Challenge\n\n"
      assert_raises InvalidQuest::NoQuestTitle do ; Parser.run(quest_file) ; end
    end

    def test_no_quest_objectif
      quest_file = "# Apprendre le Markdown\n\n## Objectifs\n\n## Etapes\nfoo\n## Challenge\n\n"
      assert_raises InvalidQuest::NoQuestObjectives do ; Parser.run(quest_file) ; end
    end

    def test_no_quest_description
      quest_file = "# Appprendre le Markdown\n\n## Objectifs\n* vivre\n\n## Etapes\nfoo\n## Challenge\n\n"
      assert_raises InvalidQuest::NoQuestDescription do ; Parser.run(quest_file) ; end
    end

    def test_no_challenge_title
      quest_file = markdown_no_challenge
      assert_raises InvalidQuest::NoChallengeTitle do ; Parser.run(quest_file) ; end
    end

    def test_no_challenge_criteria_markup
      quest_file = markdown_no_challenge + "\n\n### foo\n\n"
      assert_raises InvalidQuest::NoChallengeCriteriaMarkup do ; Parser.run(quest_file) ; end
    end

    def test_no_challenge_description
      quest_file = markdown_no_challenge + "\n\n### foo\n\n### Critères de validation"
      assert_raises InvalidQuest::NoChallengeDescription do ; Parser.run(quest_file) ; end
    end

    def test_no_challenge_criteria
      quest_file = markdown_no_challenge + "\n\n### foo\n\nfoo\n\n### Critères de validation"
      assert_raises InvalidQuest::NoChallengeCriteria do ; Parser.run(quest_file) ; end
    end

    def markdown_no_challenge
      File.read('./test/samples/no_challenge.md')
    end
  end
end
