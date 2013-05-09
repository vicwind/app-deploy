require "capistrano/recipes/deploy/scm"
require "capistrano/recipes/deploy/strategy"
require 'capistrano/recipes/deploy/strategy/remote'
require 'capistrano/recipes/deploy/strategy/base'
require 'pry'

binding.pry

module Capistrano
  module Deploy
    module Strategy

      # Implements the deployment strategy which does an SCM checkout on each
      # target host. This is the default deployment strategy for Capistrano.
      class BuildAndCopy < Remote
        protected
          # Returns the SCM's checkout command for the revision to deploy.
          def command
            # @command ||= source.checkout(revision, configuration[:release_path])
            @command ||= source.checkout(revision, '/tmp/pkgs/source')
          end
      end

    end
  end
end

