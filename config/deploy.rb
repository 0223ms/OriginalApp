# アプリ名、GitHubリポジトリ、ユーザーを設定  
set :application, 'OriginalApp'  
set :repo_url, 'git@github.com:0223ms/OriginalApp.git'  
set :user, 'deploy'  

# デプロイ先ディレクトリを指定  
set :deploy_to, "/srv/#{fetch(:application)}"  

# sudoコマンドを使うために必要  
set :pty, true  

# リンクファイルとリンクディレクトリの設定  
append :linked_files, 'config/credentials/production.key'  

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/packs', 'node_modules'  

# リモートにキャッシュを残して、二回目以降は差分だけ更新する  
set :deploy_via, :remote_cache  

# マイグレートファイルに変更がある時だけマイグレートする  
set :conditionally_migrate, true  

# linked_filesに記述してあるものを全てリモートサーバにコピー（今回はproduction.keyだけ）  
namespace :safe_deploy_to do  
  task :push_config do  
    next unless any? :linked_files  
    on roles(:app) do  
      fetch(:linked_files).each do |file|  
        unless test "[ -f #{shared_path.join file} ]"  
          execute :mkdir, '-p', shared_path.join(File.dirname(file))  
          upload! file, "#{shared_path.join file}"  
        end  
      end  
    end  
  end  
  after 'safe_deploy_to:ensure', 'safe_deploy_to:push_config'  
end  

# rbenvの設定  
set :rbenv_type, :user  
set :rbenv_custom_path, '/home/deploy/.anyenv/envs/rbenv'  
set :rbenv_ruby, File.read('.ruby-version').strip  
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"  
set :rbenv_map_bins, %w[rake gem bundle ruby rails]  
set :rbenv_roles, :all  

# nodeの設定  
set :default_env, { NODE_ENV: 'production' }  

# bundlerの設定  
append :linked_dirs, '.bundle'  
set :bundle_jobs, 1  

# # pumaコマンドをbundle execで実行  
# append :rbenv_map_bins, 'puma', 'pumactl'  