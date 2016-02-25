require './test/test_helper'
require 'yaml'

module Modiz
  class ParserTest < Minitest::Test
    def test_invalid_file_structure
      quest_file = ''
      err = raise_error quest_file
      assert_match /Le fichier doit contenir ## Etapes et ## Challenge/, err.message
    end

    def raise_error quest_file
      assert_raises InvalidQuest do
        Parser.run(quest_file)
      end
    end
  end
end
