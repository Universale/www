module HTTP
  class Server
    class Context
      def json?
        self.request.headers["Accept"].to_s.split(";").includes?("application/json")
      end

      def json!
        self.response.content_type = "application/json"
      end
    end
  end
end
