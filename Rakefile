require "bundler/gem_tasks"
require "time"

namespace :release do
  desc "Bump version (specify VERSION=x.x.x)"
  task :bump_version do
    new_version = ENV["VERSION"]
    raise "Please specify VERSION=x.x.x" unless new_version

    # Update version.rb
    version_file = "lib/phlexy_ui/version.rb"
    content = File.read(version_file)
    content.gsub!(/VERSION = "[^"]+"/, %(VERSION = "#{new_version}"))
    File.write(version_file, content)

    puts "Bumped version to #{new_version}"
  end

  desc "Update the UPDATED_AT timestamp"
  task :update_timestamp do
    timestamp = Time.now.utc.strftime("%Y-%m-%d %H:%M:%S UTC")
    file_path = "lib/phlexy_ui/updated_at.rb"

    content = <<~RUBY
      # frozen_string_literal: true

      module PhlexyUI
        # This timestamp is automatically updated when releasing a new version
        # Format: YYYY-MM-DD HH:MM:SS UTC
        UPDATED_AT = "#{timestamp}".freeze
      end
    RUBY

    File.write(file_path, content)
    puts "Updated timestamp to #{timestamp}"
  end

  desc "Build, tag, and push gem without creating GitHub release"
  task publish: [:bump_version, :update_timestamp] do
    # Read version directly from the file
    version_content = File.read("lib/phlexy_ui/version.rb")
    version = version_content.match(/VERSION = "([^"]+)"/)[1]
    tag = "v#{version}"

    # Build the gem first
    sh "gem build phlexy_ui.gemspec"

    # Update Gemfile.lock
    sh "bundle install"

    # Single commit for all changes
    sh "git add lib/phlexy_ui/version.rb lib/phlexy_ui/updated_at.rb Gemfile.lock"
    sh %(git commit -m "Release version #{version}")

    # Create and push git tag
    sh "git tag -s #{tag} -m 'Version #{version}'"
    sh "git push origin main"  # Push the commits
    sh "git push origin #{tag}" # Push the tag

    # Prompt for OTP
    print "Enter your RubyGems OTP code: "
    otp = $stdin.gets.chomp

    # Push to RubyGems with OTP
    sh "gem push phlexy_ui-#{version}.gem --otp #{otp}"

    # Clean up the generated gem file
    sh "rm phlexy_ui-#{version}.gem"

    puts "Successfully:"
    puts "- Released version #{version}"
    puts "- Built and pushed gem"
    puts "- Created and pushed tag #{tag}"
    puts "- Cleaned up generated gem file"
  end
end

Rake::Task["release"].enhance [
  "release:update_timestamp",
  "release:ensure_committed"
]
