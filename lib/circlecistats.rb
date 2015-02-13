require 'circleci'

module CircleCIStats

  def self.configure
    yield config
    client = Client.new(config.token, config.repository, config.username)
  end

  def self.client=(client)
    @client = client
  end

  def self.client
    @client
  end

  def self.config
    @config ||= Config.new
  end

  def self.get_builds
    client.get_builds
  end

  class Config
    attr_accessor :token, :repository, :username
  end

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
