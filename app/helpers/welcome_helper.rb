module WelcomeHelper
    def disqus_code
        raw DISQUS["code"]
    end

    def google_analytics
        raw APP_TRACKING["google_analytics"]
    end
end
