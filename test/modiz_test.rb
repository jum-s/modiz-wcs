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
      expected = @output[:quest]
      quest_hash = @run_case[:quest]

      assert_equal expected[:title], quest_hash[:title]
      assert_match expected[:description], quest_hash[:description]
      assert_match expected[:goals], quest_hash[:goal].first
    end

    def test_returns_challenge_part
      expected = @output[:challenge]
      challenge_hash = @run_case[:challenge]

      assert_equal expected[:title], challenge_hash[:title]
      assert_equal 3, challenge_hash[:criteria].count
      assert_match expected[:criteria].first, challenge_hash[:criteria].first
      assert_match expected[:description], challenge_hash[:description]
    end

    def test_returns_step_part
      expected = @output[:steps].first
      steps_hash = @run_case[:steps].first

      assert_equal 3, @run_case[:steps].count
      assert_equal expected[:title], steps_hash[:title]
      assert_match expected[:description], steps_hash[:description]

      assert_equal 3, @run_case[:steps].first[:resources].count
      assert_match expected[:resources].first[:title], steps_hash[:resources].first[:title]
    end
  end
end
