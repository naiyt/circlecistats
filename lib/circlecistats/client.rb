module CircleCIStats
  class Client
    def initialize(token, repo, username)
      @repo = repo
      @username = username
      CircleCi.configure do |config|
        config.token = token
      end
    end

    def get_builds
      CircleCi::Project.recent_builds(@username, @repo)
    end
  end
end