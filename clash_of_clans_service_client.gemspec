# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clash_of_clans_service_client/version'

Gem::Specification.new do |spec|
  spec.name          = "clash_of_clans_service_client"
  spec.version       = ClashOfClansServiceClient::VERSION
  spec.authors       = ["Alex Bezek"]
  spec.email         = ["alex.liam.bezek@gmail.com"]

  spec.summary       = 'A gem to wrap the clash of clan api service'
  spec.description   = 'Wraps the clash of clans api service, automatically initializing via a railtie in a rails app, 
                        and desearilaizing json into usable ruby models'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'her', '~> 0.8'
end
