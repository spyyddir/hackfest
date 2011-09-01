require 'test_helper'

module TweetSentiment
  class Topic
    private
    def fetch
      # @@woo = 1
      total = 100
      pos = rand(50)
      neg = rand(50)
      neut = total - pos - neg
      
      {
        "sentiment_index" => 0,
        "positive" => pos,
        "negative" => neg,
        "neutral" => neut,
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
  
  def test_topic_returns_a_list_of_tweets
    topic = Topic.new("something")
    assert_equal Array, topic.tweets.class
    assert_equal Tweet, topic.tweets.first.class
  end
  
  def test_tweet_has_text
    tweet = Tweet.new("something", "data")
    assert_equal "something", tweet.text
  end
  
  def test_topiclist_returns_array_of_topics
    list = TopicList.new "one", "two", "three"
    
    assert_equal Array, list.topics.class
    list.topics.each do |topic|
      assert_equal Topic, topic.class
    end
  end
  
  def test_topic_list_returns_most_popular_topic
    list = TopicList.new "one", "two"
    
    assert_equal Topic, list.most_popular.class
  end
  
  def test_topic_list_returns_least_popular_topic
    list = TopicList.new "one", "two"
    
    assert_equal Topic, list.least_popular.class
  end
  
  def test_topic_list_returns_most_controversial
    list = TopicList.new "one", "two"
    
    assert_equal Topic, list.most_controversial.class
  end
  
end