require_relative "lib/noticed/web_push/version"

Gem::Specification.new do |spec|
  spec.name        = "noticed-web_push"
  spec.version     = Noticed::WebPush::VERSION
  spec.authors     = ["Jonathan Bennett"]
  spec.email       = ["jonathan@jbennett.me"]
  spec.homepage    = "https://github.com/jbennett/noticed-web_push"
  spec.summary     = "Web Push delivery support for noticed."
  spec.description = spec.summary
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "noticed", "~> 1.0"
  spec.add_dependency "web-push", "~> 3.0"
end
