require 'test_helper'

module TweetSentiment
  class Topic
    private
    def fetch
      {
        "sentiment_index" => 0,
        "positive" => 20,
        "negative" => 10,
        "neutral" => 70,
        "results" => [
          {"text" => "some example tweet", "sentiment" => 2}
        ]
      }
    end
  end
end

class TweetSentimentTest < MiniTest::Unit::TestCase
  include TweetSentiment
  
  def test_topic_to_string_works
    assert_equal "thing", Topic.new("thing").to_s
  end
  
  def test_that_we_can_extract_a_tweet
    assert_equal "some example tweet", Topic.new("whatever").tweets.first.text
  end
  
end