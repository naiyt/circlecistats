module CircleCIStats
  class Stats
    attr_reader :average_build_time, :branch_data, :longest_build_time, :shortest_build_time

    def initialize(builds)
      @builds = builds
    end

    def average_build_time(builds=nil)
      builds = @builds if builds.nil?
      builds = builds_with_time(builds)
      times = builds.map { |build| Float(build.build_time_millis) }
      to_seconds(times.inject(:+) / times.length)
    end

    def longest_build_time(builds=nil)
      builds = @builds if builds.nil?
      builds = builds_with_time(builds)
      builds.each { |build| build.build_time_millis = Float(build.build_time_millis) }
      max = builds.max_by(&:build_time_millis)
      { :branch => max.branch, :minutes => to_seconds(max.build_time_millis), :url => max.build_url }
    end

    def branch_data
      branches = {}
      @builds.each do |build|
        branches[build.branch] = [] unless branches.has_key?(build.branch)
        branches[build.branch] << build
      end

      branches_with_data = {}
      branches.each do |branch, builds|
        average = average_build_time(builds)
        longest = longest_build_time(builds)
        branches_with_data[branch] = { :average => average, :longest => longest, :num_builds => builds.length }
      end

      branches_with_data
    end


    private

    def to_seconds(ms)
      ms / 1000 / 60
    end

    def builds_with_time(builds)
      builds.select { |build| !build.build_time_millis.nil? }
    end
  end
end
