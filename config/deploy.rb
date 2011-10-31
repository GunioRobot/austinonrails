set :domain, "twelvelabs.com"
set :user, "austinonrails"
set :application, "austinonrails.twelvelabs.com"
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

set :repository, "git@github.com:twelvelabs/austinonrails.git"
set :repository_cache, "git_cache"
set :scm, :git
set :ssh_options, { :forward_agent => true }

set :use_sudo, false
set :deploy_to, applicationdir
set :deploy_via, :remote_cache

default_run_options[:pty] = true

set :chmod755, "app config db lib public vendor script script/* public/disp*"

set :rails_env, "production"

role :app, domain
role :web, domain
role :db,  domain, :primary => true


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end


set :bundle_path, "/home/#{user}/.gems/bin/bundle"

namespace :bundler do
  task :create_symlink, :roles => :app, :except => { :no_release => true } do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run "mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}"
  end

  task :bundle_new_release, :roles => :app, :except => { :no_release => true } do
    bundler.create_symlink
    run "cd #{release_path} && #{bundle_path} install --without test"
  end

  task :lock, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_release} && #{bundle_path} lock;"
  end

  task :unlock, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_release} && #{bundle_path} unlock;"
  end
end

# HOOKS
after "deploy:update_code" do
  bundler.bundle_new_release
end
