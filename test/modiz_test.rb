require 'test_helper'
require './test/quest_sample'

module Modiz
  class MdToHashTest < Minitest::Test
    def setup
      quest_file = File.read('./test/bundler_et_le_gemfile.md')
      @output = QuestSample.load
      @run_case = MdToHash.new(quest_file).run
    end

    def test_returns_quest_part
      assert_equal @output[:quest][:title], @run_case[:quest][:title]
      assert_match @output[:quest][:description], @run_case[:quest][:description]
      assert_match @output[:quest][:goals], @run_case[:quest][:goal].first
    end

    def test_returns_challenge_part
      assert_equal @output[:challenge][:title], @run_case[:challenge][:title]
      assert_equal 3, @run_case[:challenge][:criteria].count
      assert_match @output[:challenge][:criteria].first, @run_case[:challenge][:criteria].first
      assert_match @output[:challenge][:description], @run_case[:challenge][:description]
    end

    def test_returns_step_part
      assert_equal 3, @run_case[:steps].count
      assert_equal @output[:steps].first[:title], @run_case[:steps].first[:title]
      assert_match @output[:steps].first[:description], @run_case[:steps].first[:description]
    end
  end
end
