# #サーバ上でのアプリケーションコードが設置されているディレクトリを変数に入れておく
# app_path = File.expand_path('../../', __FILE__)

# #アプリケーションサーバの性能を決定する
# worker_processes 1

# #アプリケーションの設置されているディレクトリを指定
# working_directory "#{app_path}/current"

# #Unicornの起動に必要なファイルの設置場所を指定
# pid "#{app_path}/shared/tmp/pids/unicorn.pid"

# #ポート番号を指定
# listen "#{app_path}/shared/tmp/sockets/unicorn.sock"

# #エラーのログを記録するファイルを指定
# stderr_path "#{app_path}/shared/log/unicorn.stderr.log"

# #通常のログを記録するファイルを指定
# stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

# #Railsアプリケーションの応答を待つ上限時間を設定
# timeout 60

# #以下は応用的な設定なので説明は割愛

# preload_app true
# GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

# check_client_connection false

# run_once = true

# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) &&
#     ActiveRecord::Base.connection.disconnect!

#   if run_once
#     run_once = false # prevent from firing again
#   end

#   old_pid = "#{server.config[:pid]}.oldbin"
#   if File.exist?(old_pid) && server.pid != old_pid
#     begin
#       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#       Process.kill(sig, File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH => e
#       logger.error e
#     end
#   end
# end

# after_fork do |_server, _worker|
#   defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
# end









# Rails のルートパスを設定（RAILS_ROOT/config/unicorn.rbに配置している場合）
rails_root = File.expand_path('../../', __FILE__)

# RAILS_ENV を設定(RAILS_ENVごとに挙動を変えたい場合に使用。)
# rails_env = ENV['RAILS_ENV'] || 'development'

# capistrano の unicorn restart のエラー解消
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{rails_root}/Gemfile"
end

# ワーカー数の定義
worker_processes 2

# Unicornの起動コマンドを実行するディレクトリを指定
working_directory rails_root

# 接続タイムアウト時間
timeout 30

# Unicornのエラーログと通常ログの吐き出しファイルを指定
stderr_path File.expand_path('../../log/unicorn_stderr.log', __FILE__)
stdout_path File.expand_path('../../log/unicorn_stdout.log', __FILE__)

# Nginxで使用する場合はこちらの設定
# listen File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)
# ひとまずローカルで8080
listen 8080

# プロセス停止などに必要なPIDファイルの保存先を指定
pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

# Unicorn再起動時にダウンタイムなしで再起動を設定
preload_app true

# USR2シグナルを受けると古いプロセスを止める
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end