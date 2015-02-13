require 'circleci'
require 'circlecistats/client'
require 'circlecistats/config'
require 'circlecistats/build'
require 'circlecistats/stats'

module CircleCIStats

  def self.configure
    yield config
    @client = CircleCIStats::Client.new(config.token, config.repository, config.username)
  end

  def self.config
    @config ||= Config.new
  end

  def self.builds
    @builds ||= @client.get_builds.body.map { |build| CircleCIStats::Build.new(build) }
  end

  def self.run_stats
    stats
  end

  def self.stats
    @stats ||= CircleCIStats::Stats.new(builds)
  end

end
