module TweetSentiment
  class Topic
    def initialize topic
      @topic = topic
      get_data
    end
    
    def to_s
      @topic.to_s
    end
    
    attr_reader :sentiment_index, :positive, :negative, :neutral, :tweets
    
    private
    
    def get_data
      url = "http://data.tweetsentiments.com:8080/api/search.json?topic=#{URI.escape(@topic.downcase)}"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body
      result = JSON.parse(data)
      @sentiment_index = result["sentiment_index"]          # sentiment index for the topic
      @positive = result["positive"]                 # number of positive tweets
      @negative = result["negative"]                 # number of negative tweets
      @neutral = result["neutral"]                  # number of neutral tweets
      
      # changeme
      @tweets = []
      result["results"].each do |raw|
        @tweets << TweetSentiment::Tweet.new(
          result["results"][0]["text"],
          result["results"][0]["sentiment"]
        )
      end
    rescue JSON::ParserError
      puts "API being flaky problem, try again."
      @tweets = []
      @sentiment_index = nil
      @positive = nil
      @negative = nil
      @neutral = nil
    end
  end
end