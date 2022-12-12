# frozen_string_literal: true

require_relative "lib/aoc2022ruby/version"

Gem::Specification.new do |spec|
  spec.name = "aoc2022ruby"
  spec.version = Aoc2022ruby::VERSION
  spec.authors = ["mdotz"]
  spec.email = ["marcin.x.zielinski@gmail.com"]

  spec.summary = "Advent of Code 2022, Ruby"
  spec.description = "Advent of Code 2022, Ruby"
  spec.required_ruby_version = "3.0.4"
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry", "~> 0.13.1"
end
