module TweetSentiment
  class TopicList
    def initialize *topics
      @topics = []
      topics.each do |topic|
        @topics << Topic.new(topic)
      end
    end
    
    attr_reader :topics
  end
end