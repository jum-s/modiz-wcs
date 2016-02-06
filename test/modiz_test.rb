require 'test_helper'
require './test/quest_sample'

module Modiz
  class MdToHashTest < Minitest::Test
    def setup
      @quest_file = File.read('./test/bundler_et_le_gemfile.md')
      @output = QuestSample.load
    end

    def test_returns_a_hash
      run_case = MdToHash.new(@quest_file).run

      assert_equal @output[:quest][:title], run_case[:quest][:title]
    end
  end
end
