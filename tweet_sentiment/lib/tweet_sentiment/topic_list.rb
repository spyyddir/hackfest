module TweetSentiment
  class TopicList
    def initialize *topics
      @topics = []
      topics.each do |topic|
        @topics << Topic.new(topic)
      end
    end
    
    attr_reader :topics
    
    def most_popular
      topics_sorted_by_sentiment.first
    end
    
    def least_popular
      topics_sorted_by_sentiment.reverse.first
    end
    
    def most_controversial
      @topics.sort_by {|t| (t.positive - t.negative).abs}.first
    end
    
    private
    
    def topics_sorted_by_sentiment
      @sorted ||= @topics.sort_by {|x| x.sentiment_index}
    end
  end
end