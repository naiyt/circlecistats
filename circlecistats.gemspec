Gem::Specification.new do |gem|
  gem.name           =  'circlecistats'
  gem.version        =  '0.0.1'
  gem.date           =  '2015-02-13'
  gem.summary        =  'Generate CircleCI build stats'
  gem.description    =  'Integrate with the CircleCI API to generate stats on your builds'
  gem.files          =  ["lib/circlecistats.rb"]
  gem.authors        =  ["Nate Collings"]
  gem.email          =  'nate@natecollings.com'
  gem.homepage       =  'https://github.com/naiyt/circlecistats'
  gem.license        =  'MIT'

  gem.add_dependency 'circleci'
end
