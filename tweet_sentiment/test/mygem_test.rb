require 'test_helper'

class TweetSentimentTest < MiniTest::Unit::TestCase
  include TweetSentiment
  
  def test_topic_to_string_works
    assert_equal "thing", Topic.new("thing").to_s
  end
  
end