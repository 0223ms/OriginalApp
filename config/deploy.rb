# # capistranoのバージョン明記・固定
# lock '3.14.1'

# # Capistranoのログの表示に利用する
# set :application, 'OriginalApp'

# # どのリポジトリからアプリをpullするかを指定する
# set :repo_url,  'git@github.com:0223ms/OriginalApp.git'

# # バージョンが変わっても共通で参照するディレクトリを指定
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# set :rbenv_type, :user
# set :rbenv_ruby, '2.5.1'

# # どの公開鍵を利用してデプロイするか
# set :ssh_options, auth_methods: ['publickey'],
#                   keys: ['~/.ssh/OriginalApp.pem']

# # プロセス番号を記載したファイルの場所
# set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# # Unicornの設定ファイルの場所
# set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
# set :keep_releases, 5

# # set :linked_files, fetch(:linked_files, []).push("config/master.key")



# # デプロイ処理が終わった後、Unicornを再起動するための記述
# after 'deploy:publishing', 'deploy:restart'
# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:restart'
#   end

#   desc 'upload credentials.yml.enc'
#   task :upload do
#     on roles(:app) do |host|
#       if test "[ ! -d #{shared_path}/config ]"
#         execute "mkdir -p #{shared_path}/config"
#       end
#       upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
#     end
#   end
#   before :starting, 'deploy:upload'
#   after :finishing, 'deploy:cleanup'
# end

lock "~> 3.14.1"

set :application, "OriginalApp"
set :repo_url, "git@github.com:0223ms/OriginalApp.git"


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

# chat-spaceで使ったpemを指定
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/OriginalApp.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :linked_files, %w{ config/master.key }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end

  desc 'upload master.key'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/master.key', "#{shared_path}/config/master.key")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end
