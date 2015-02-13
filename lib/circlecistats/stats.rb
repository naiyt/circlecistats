module CircleCIStats
  class Stats
    attr_reader :average_build_time, :num_branches, :longest_build_time, :shortest_build_time

    def initialize(builds)
      @builds = builds
    end

    def average_build_time
      builds = @builds.select { |build| !build.build_time_millis.nil? }
      times = builds.map { |build| Float(build.build_time_millis) }
      to_seconds(times.inject(:+) / times.length)
    end

    private

    def to_seconds(ms)
      ms / 1000 / 60
    end
  end
end
