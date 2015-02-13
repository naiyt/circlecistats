module CircleCIStats
  class Build

    DESIRED_PARAMS = ["build_time_millis",
                      "committer_date",
                      "branch",
                      "build_url",
                      "failed",
                      "author_date",
                      "build_num",
                      "status",
                      "retries",
                      "subject",
                      "outcome",
                      "author_name",
                      "canceled",
                      "build_url"]

    def initialize(build_data)
      set_readers
      DESIRED_PARAMS.each { |param| instance_variable_set("@#{param}", build_data[param]) }
    end

    def set_readers
      DESIRED_PARAMS.each { |param| self.class.send(:attr_reader, param) }
    end
  end
end
