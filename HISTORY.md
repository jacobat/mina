v0.1.2.pre2 - Jul 3, 2012
-------------------------

### Added:
  * Add bundle_bin option
  * Add ssh port option

### Fixed:
  * Fix deploy:link_shared_paths to use absolute paths
  * Fix console logs for task init

v0.1.2.pre1 - Jun 12, 2012
--------------------------

### Fixed:
  * Fixed JRuby support.
  * Respect .bashrc. (#5)

### Changed:
  * Implement `ssh("..", return: true)`.
  * Rename simulate_mode to simulate_mode?. Same with verbose_mode?.
  * Show the SSH command in the simulation output.

### Misc:
  * Prepare for Tomdoc.
  * Stop invoking bash needlessly to prettify things.

v0.1.1 - Jun 07, 2012
---------------------

### Added:
  * Check for releases_path directory in deploy script.
  * mina deploy:cleanup
  * Support for -f option.

### Changed:
  * Gem description.

### Fixed:
  * deploy.rb template (domain, user, git:clone).
  * Handle empty Git repository.
  * Add pkg to gitignore.

v0.1.0 - Jun 06, 2012
---------------------

Renamed to Mina from Van Helsing.


v0.0.1.pre7 - Jun 06, 2012
--------------------------

### Added:
  * __`vh rails[command]` and `vh rake[command]` tasks.__
  * __Add `vh run`.__
  * `-S` as an alias for `--simulate`.
  * the `#set_default` helper.
  * the `bundle_prefix` setting.
  * New `term_mode` setting.

### Changed:
  * `--simulate` show things without the `ssh` command or shellescaping.

v0.0.1.pre6 - Jun 06, 2012
--------------------------

Thanks to @sosedoff for his contributions that made it to this release.

### Added:
  * __Rubinius support.__
  * __Ruby 1.8 support.__
  * Prelimenary JRuby support.
  * MIT license.
  * Highlight errors as red in deploy.
  * Use popen4 instead of popen3. Support JRuby via IO.popen4.

### Changed:
  * __Rename `to :restart` to `to :launch`.__
  * __Make deploys fail if renaming the build (eg, not setup properly) fails.__

### Tests:
  * Added `rake spec` (aliased as just `rake`) task. It tests with Rake 0.8 and 0.9 both.
  * Integrate with [Travis CI](http://travis-ci.org).
  * Make the SSH test more portable.
  * Removed `rake spec:verbose`.

v0.0.1.pre5 - Jun 05, 2012
--------------------------

### Added:
  * Add `--trace` to the `vh help` screen.
  * Rake 0.8 compatibility.
  * Ruby 1.8.7 compatibility.

### Changed:
  * Use `:domain` instead of `:host`.

### Misc:
  * Allow rake 0.8 testing using `rake=0.8 rspec`.
  * Add more README examples.

v0.0.1.pre4 - Jun 05, 2012
--------------------------

### Added:
  * `--simulate` switch.
  * `--verbose` switch.
  * The help screen now shows command line switches (like `--verbose`).
  * Build in `tmp/` instead of in `releases/`.
  * Use `verbose_mode` and `simulate_mode` instead. Using 'verbose' causes
    problems.
  * New `#deploy_script` helper, to make things more transparent.

### Misc:
  * Added a test for an actual deployment.
  * Make the `test_env` runnable even without a net connection.
  * New tests for actual deployment. Just do `rspec -t ssh`.
  * Cleanup `git:clone` code.
  * A buncha code cleanups.

v0.0.1.pre3 - Jun 04, 2012
--------------------------

### Added:
  * A help screen. You can see it with `vh --help`, `vh -h` or just plain `vh`.
  * Implemented `vh --version`.
  * Sequential release versions. Yay!
  * Added the `build_path` setting, which supercedes the now-removed `release_path`.

### Removed:
  * `release_path` has been deprecated.

### Fixed:
  * Stupid critical bug fix: fix `vh:setup` giving the world access to deploy_to.
  * Ensure that SSH stderr output is shown properly.
  * Make `#invoke` work with tasks with arguments (eg, :'site:scrape[ensogo]')

### Changed:
  * Edit the default deploy.rb to have a description for the deploy task.
  * Make `vh -T` show `vh` instead of `rake`.
  * Make `vh setup` ensure ownership of the `deploy_to` path.
  * Make deploy steps more explicit by echoing more statuses.
  * When deploys fail, you now don't see the default Ruby backtrace. It now
    behaves like Rake where you need to add `--trace` to see the trace.

### Misc:
  * Fixed the error that sometimes happens when invoking `vh` without a deploy.rb.
  * Update the sample deploy.rb file to be more readable.
  * The *test_env/* project can now be deployed without problems, so you can try
    things out.
  * Lots of new tests.
  * rspec test order is now randomized.
  * rspec output is colored (thanks to .rspec).
  * Better script indentation when running in simulation mode.
  * In symlinking `./current/`, use `ln -nfs` instead of `rm -f && ln -s`.

v0.0.1.pre2 - Jun 03, 2012
--------------------------

### Added:
  * Implement `vh init` which creates a sample *deploy.rb*.
  * Implement 'vh setup'.
  * Added the configurable `:releases_path` setting, so you may change where to keep releases.
  * Added documentation via Reacco.
  * Allow settings to throw errors on missing settings by adding a bang (e.g.,
    `bundle_path!` or `settings.bundle_path!`)

### Changed:
  * Allow `bundle:install` to skip having shared bundle paths if `:bundle_path` is set to nil.
  * Rename `force_unlock` to `deploy:force_unlock`.
  * Rename `vh:link_shared_paths` to `deploy:link_shared_paths`.
  * Invoking `deploy:force_unlock` now shows the command it uses.

### Fixed:
  * The `bundle:install` task now honors the `bundle_path` setting.
  * Fixed `deploy:force_unlock` always throwing an error.
  * The `deploy:force_unlock` task now honors the `lock_file`
    setting, so the user may change the location of the lock file.
  * Fixed `rails:assets_precompile` not compiling if no older assets found.

### Removed:
  * Deprecate `#validate_set`.

### Other things:
  * Move deploy settings to deploy.rb.
  * Rename the `default` addon to `deploy`.

v0.0.1.pre1 - Jun 02, 2012
--------------------------

Initial version.
