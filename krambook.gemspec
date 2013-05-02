#!/usr/bin/env gem build
# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = 'krambook'
  s.rubyforge_project         = 'krambook'
  s.authors                   = ["K-2052"]
  s.email                     = 'k@2052.me'
  s.summary                   = 'Kraft your ebooks with Kramdown.'
  s.homepage                  = 'http://github.com/bookworm/krambook'
  s.description               = 'Kraft your ebooks with Kramdown. Intended as a collection 
                                 of helpers for working with Markdown based ebooks. 
                                 Currently operates like a local version of LeanPub.'
  s.required_rubygems_version = '>= 1.3.6'
  s.version                   = '0.0.1'
  s.date                      = Time.now.strftime("%Y-%m-%d")

  s.files            = `git ls-files`.split("\n") | Dir.glob("{lib}/**/*")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths    = ['lib']
  s.rdoc_options     = ['--charset=UTF-8']

  s.add_dependency('kramdown')
  s.add_dependency('bundler', '~> 1.0')
  s.add_dependency('thor')
  s.add_dependency('active_support')
end
