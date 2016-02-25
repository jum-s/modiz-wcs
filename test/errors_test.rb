require './test/test_helper'
require 'yaml'

module Modiz
  class ParserTest < Minitest::Test
    def test_invalid_file_structure
      quest_file = ''
      err = raise_error quest_file
      assert_match /Le fichier doit contenir ## Etapes et ## Challenge/, err.message
    end

    def test_no_steps
      quest_file = "\n\n## Etapes\n\n## Challenge\n\n"
      err = raise_error quest_file
      assert_match /Le fichier doit contenir au moins une étape./, err.message
    end

    def test_no_quest_title
      quest_file = "\nfoo\n## Objectifs\n\n## Etapes\nfoo\n## Challenge\n\n"
      err = raise_error quest_file
      assert_match /Le fichier n'a pas de titre de quête./, err.message
    end

    def test_no_quest_objectif
      quest_file = "# Apprendre le Markdown\n\n## Objectifs\n\n## Etapes\nfoo\n## Challenge\n\n"
      err = raise_error quest_file
      assert_match /Le fichier n'a pas d'objectif./, err.message
    end

    def test_no_quest_description
      quest_file = "# Appprendre le Markdown\n\n## Objectifs\n* vivre\n\n## Etapes\nfoo\n## Challenge\n\n"
      err = raise_error quest_file
      assert_match /Le fichier n'a pas de description de quêtes./, err.message
    end

    def markdown_no_challenge
      File.read('./test/samples/no_challenge.md')
    end

    def test_no_challenge_title
      err = raise_error markdown_no_challenge
      assert_match /Le fichier doit contenir un challenge avec un titre./, err.message
    end

    def test_no_challenge_criteria_markup
      err = raise_error markdown_no_challenge + "\n\n### foo\n\n"
      assert_match /Ta quête doit contenir le titre '### Critères de validation'/, err.message
    end

    def test_no_challenge_description
      err = raise_error markdown_no_challenge + "\n\n### foo\n\n### Criteres"
      assert_match /Le challenge mérite d'être décrit./, err.message
    end

    def test_no_challenge_criteria
      err = raise_error markdown_no_challenge + "\n\n### foo\n\nfoo\n\n### Criteres"
      assert_match /Ta quête doit contenir une liste de critères/, err.message
    end

    def raise_error quest_file
      assert_raises InvalidQuest do
        Parser.run(quest_file)
      end
    end
  end
end
