require './test/test_helper'
require 'yaml'

module Modiz
  class ParserTest < Minitest::Test
    def test_invalid_step_delimiter
      err = assert_raises InvalidQuest::NoStepDelimiter do ; Parser.run('') ; end
      assert_match /Le fichier doit contenir ## Etapes/, err.message
    end

    def test_invalid_challenge_delimiter
      quest_file = "\n\n## Etapes"
      err = assert_raises InvalidQuest::NoChallengeDelimiter do ; Parser.run(quest_file) ; end
      assert_match /Le fichier doit contenir ## Challenge/, err.message
    end

    def test_no_step_content
      quest_file = "\n\n## Etapes\n\n## Challenge\n\n"
      assert_raises InvalidQuest::NoStepsContent do ; Parser.run(quest_file) ; end
    end

    def test_no_challenge_content
      quest_file = "\n\n## Etapes\n\nfoo\n\n## Challenge\n\n"
      assert_raises InvalidQuest::NoChallengeContent do ; Parser.run(quest_file) ; end
    end

    def test_no_double_lines
      quest_file = "\n\n## Etapes\n\nfoo\n## Challenge\n\nfoo"
      err = assert_raises InvalidQuest::DoubleLineMissing do ; Parser.run(quest_file) ; end
      assert_match /Tu n'as pas sauté de lignes/, err.message
    end

    def test_invalid_link
      quest_file = "\n\n## Etapes\nfoo\n\n## Challenge\n\n[url](wrong_link)"
      err = assert_raises InvalidQuest::InvalidLink do ; Parser.run(quest_file) ; end
      assert_match /Le lien 'wrong_link' n'est pas une URL valide/, err.message
    end

    def test_several_invalid_links
      quest_file = "\n\n## Etapes\nfoo\n\n## Challenge\n\n[url](wrong_link)[url](second_wrong_link)"
      err = assert_raises InvalidQuest::InvalidLink do ; Parser.run(quest_file) ; end
      assert_match /Les liens 'wrong_link, second_wrong_link' ne sont pas des URL valides/, err.message
    end

    def test_no_quest_title
      quest_file = "\nfoo\n\n## Objectifs\n\n## Etapes\nfoo\n\n## Challenge\n\nfoo"
      assert_raises InvalidQuest::NoQuestTitle do ; Parser.run(quest_file) ; end
    end

    def test_no_quest_objectif
      quest_file = "# Apprendre le Markdown\n\n## Objectifs\n\n## Etapes\nfoo\n\n## Challenge\n\nfoo"
      assert_raises InvalidQuest::NoQuestObjectives do ; Parser.run(quest_file) ; end
    end

    def test_no_quest_description
      quest_file = "# Appprendre le Markdown\n\n## Objectifs\n* vivre\n\n## Etapes\nfoo\n\n## Challenge\n\nfoo"
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
