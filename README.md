TweetSentiment rubygem
=======================

TweetSentiment turns the [TweetSentiments API](http://intridea.com/2010/11/29/sentiment-analysis-using-tweetsentimentscom-api) into a beautiful, shiny, Ruby gem.

Installation
------------

```bash
gem install tweet_sentiment
```


Example Usage
-------------

    topic = TweetSentiment::Topic.new("Boulder")     # will return the 100 most recent tweets on the topic
    topic.sentiment_index => 56.0  # the sentiment index, the higher the better
    topic.positive        => 31    # the number of positive tweets
    topic.negative        => 19    # the number of negative tweets
    topic.neutral         => 50    # the number of neutral tweets
    topic.tweets          =>       # an array of Tweets (each a tweet has .text and .sentiment) 

    You can also pass in a list of topics, and compare them against one another

    topic_list = TweetSentiment::TopicList.new("Boulder", "Denver", "Longmont")
    topic_list.topics.first      =>    # the "Boulder" Topic object
    topic_list.topics.first.positive =>   # number of positive tweets about boulder

    topic_list.most_popular =>   # returns the topic with the highest sentiment
    topic_list.least_popular =>   # returns the topic with the lowest sentiment
    topic_list.most_controversial =>   # returns the topic with the biggest difference between positive and negative tweets


last updated 31 August 2011

