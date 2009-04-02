Gem::Specification.new do |s|
  s.name     = 'ruseragent'
  s.version  = '0.0.1'
  s.date     = '2009-04-01'
  s.summary  = 'ruby web user agent library'
  s.email    = 'matthewm@boedicker.org'
  s.homepage = 'http://github.com/mmb/ruseragent'
  s.description = 'Store of web user agent strings used for generating fake user agents or extracting metadata from user agent strings.'
  s.has_rdoc = false
  s.authors  = ['Matthew M. Boedicker']
  s.files    = [
    'lib/ruseragent.rb',
    'README.textile',
    'ruseragent.gemspec',
    ]
  s.test_files = [
    'test/ruseragent_test.rb',
    ]
end
