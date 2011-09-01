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
    topic.sentiment_index =>    # the sentiment index, the higher the better
    topic.positive        =>    # the number of positive tweets
    topic.negative        =>    # the number of negative tweets
    topic.neutral         =>    # the number of neutral tweets
    topic.tweets          => [ "Boulder is good", "Boulder is great", "Boulder sux"....     # an array of the text of the tweets

    You can also pass in a list of topics, and compare them against one another

    topic_list = TweetSentiment::TopicList.new("Boulder", "Denver", "Longmont")
    topic_list.first      =>    # the "Boulder" Topic object
    topic_list.first.positive =>   # number of positive tweets about boulder

    topic_list.most_popular =>   # sorts the list by highest sentiment
    topic_list.least_popular =>   # sorts the list by lowest sentiment
    topic_list.most_controversial =>   # sorts the list by biggest difference between positive and negative tweets
