require "capistrano/recipes/deploy/strategy"
require 'capistrano/recipes/deploy/strategy/base'

module Capistrano
  module Deploy
    module Strategy

      # Implements the deployment strategy which does an SCM checkout on each
      # target host. This is the default deployment strategy for Capistrano.
      class BuildAndCopy < Capistrano::Deploy::Strategy::Base

        # Executes the SCM command for this strategy and writes the REVISION
        # mark file to each host.
        def deploy!
          scm_run "rm -rf /tmp/pkgs/#{configuration[:application]}/source/ && #{command} && rvm rvmrc trust /tmp/pkgs/TireFinder/source/.rvmrc"
          gzip_source
          deploy_pkg
        end

        def check!
          super.check do |d|
            d.remote.command(source.command)
          end
        end

        protected

        # Runs the given command, filtering output back through the
        # #handle_data filter of the SCM implementation.
        def scm_run(command)
          run(command, hosts: configuration[:build_server]) do |ch,stream,text|
            ch[:state] ||= { :channel => ch }
            output = source.handle_data(ch[:state], stream, text)
            ch.send_data(output) if output
          end
        end

        # An abstract method which must be overridden in subclasses, to
        # return the actual SCM command(s) which must be executed on each
        # target host in order to perform the deployment.
        # def command
          # raise NotImplementedError, "`command' is not implemented by #{self.class.name}"
        # end

        # Returns the command which will write the identifier of the
        # revision being deployed to the REVISION file on each host.
        def mark
          # "(echo #{revision} > #{configuration[:release_path]}/REVISION)"
          "(echo #{revision} > #{configuration[:release_path]}/REVISION)"
        end


        # Returns the SCM's checkout command for the revision to deploy.
        def command
          # @command ||= source.checkout(revision, configuration[:release_path])
          @command ||= source.checkout(revision, "/tmp/pkgs/#{configuration[:application]}/source")
        end

        def deploy_pkg

         configuration[:app_hosts].map do |host|
           if host != configuration[:build_server]
             command = "scp /tmp/#{configuration[:application]}_#{$$}.gz #{host}:/tmp"
             run(command, hosts: configuration[:build_server])
           end
           command = "mkdir -p #{configuration[:pkgs_path]} && tar -xzvf /tmp/#{configuration[:application]}_#{$$}.gz -C /tmp && mv /tmp/#{configuration[:application]}/source #{configuration[:pkgs_path]}/#{configuration[:release_name]} && rm -rf /tmp/#{configuration[:application]}"
           run(command, hosts: host)
           command = "mkdir -p #{configuration[:releases_path]} && cp -R #{configuration[:pkgs_path]}/#{configuration[:release_name]} #{configuration[:releases_path]}"
           run(command, hosts: host)
         end
        end

        def gzip_source
          command = "cd /tmp/pkgs && tar --exclude '.git' --exclude \"*.log\" -czvf /tmp/#{configuration[:application]}_#{$$}.gz #{configuration[:application]}"
          run(command, hosts: configuration[:build_server])
        end
      end

    end
  end
end


