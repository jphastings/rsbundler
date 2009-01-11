spec = Gem::Specification.new do |s| 
  s.name = "RSBundler"
  s.version = "0.0.1"
  s.author = "JP Hastings-Spital"
  s.email = "contact@projects.kedakai.co.uk"
  s.homepage = "http://projectrs.kedakai.co.uk/rsbundler"
  s.platform = Gem::Platform::RUBY
  s.summary = "Parser for the rsbundle container format, which can hold all the parts of a multipart archive uploaded to rapidshare (includeing password)"
  s.files = ["rsbundler.rb"]
  s.require_path = "."
  s.has_rdoc = false
end