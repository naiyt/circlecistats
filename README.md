# circlecistats

Super basic POC for generating stats based on CircleCI builds.

Usage:

```ruby
CircleCIStats.configure do |config|
  config.token       = "Your  CircleCI API token"
  config.repository  = "Repo to run stats for"
  config.username    = "Repo username" # Primarily works w/GitHub repos currently
end

CircleCIStats.run_stats
puts CircleCIStats.stats.average_build_time # In minutes
puts CircleCIStats.stats.branch_data
puts CircleCIStats.stats.longest_build_time
puts CircleCIStats.stats.shortest_build_time
```

Currently only runs stats for the last 30 builds. A better solution for the future would be to integrate with CircleCI webhooks, and retrieve the stats in realtime, and store and generate them over time.
