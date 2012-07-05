namespace :git do
  desc "Clones the Git repository to the release path."
  task :clone do
    settings.revision ||= `git rev-parse HEAD`.strip

    if settings.revision.empty?
      error "Git revision is empty. Check if you are in git tree."
      exit 1
    end

    queue %{
      echo "-----> Cloning the Git repository"
      #{echo_cmd %[git clone "#{repository!}" . -n --recursive]} &&
      echo "-----> Using revision #{revision}" &&
      #{echo_cmd %[git checkout -q "#{revision}" -b current_release 1>/dev/null]} &&
      #{echo_cmd %[rm -rf .git]}
    }
  end

  desc "Clones the Git repository to the release path."
  task :shared_clone do
    queue %{
      echo "-----> Cloning the Git repository"
      #{echo_cmd %[git clone --bare "#{repository!}" #{git_dir!}]}
    }
  end

  desc "Update the cached repository"
  task :update do
    queue %[
      echo "-----> Updating the Git repository"
      #{echo_cmd %{git --git-dir=#{git_dir!} fetch}}
    ]
  end

  desc "Create a copy of the cached repository"
  task :copy do
    queue %[
      echo "-----> Extracting from the Git repository"
      #{echo_cmd %{git --git-dir=#{git_dir!} archive --format=tar #{revision} | tar -xf- #{excludes.map{|e| "--exclude=#{e}" }.join(' ')}}}
    ]
  end
end
