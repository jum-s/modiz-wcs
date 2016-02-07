require 'test_helper'
require './test/quest_sample'

module Modiz
  class MdToHashTest < Minitest::Test
    def setup
      quest_file = File.read('./test/bundler_et_le_gemfile.md')
      @output = QuestSample.load
      @run_case = MdToHash.new(quest_file).run
    end

    def test_returns_a_hash
      assert_equal @output[:quest][:title],       @run_case[:quest][:title]
      assert_match @output[:quest][:goals],        @run_case[:quest][:goal]
      assert_match @output[:quest][:description], @run_case[:quest][:description]
    end
  end
end
