module TweetSentiment
  class Tweet
    def initialize(text, sentiment)
      @text = text
      @sentiment = sentiment
    end
    
    attr_reader :text, :sentiment
  end
end