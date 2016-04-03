## setup log
```
  # git の準備
  $ mkdir project_dir
  $ git init
  $ touch .keep
  $ git add .keep
  $ git commit 'create repos'
  $ rm .keep

  # ruby version 指定
  $ rbenv local 2.2.3

  # global install済みのbundlerで middlemanをinstall
  $ bundle init
  $ vi Gemfile
    - gem "rails"
    + gem "middleman"
    + gem "slim"
  $ bundle install --path vendor/bundle

  # middleman プロジェクト生成
  $ bundle exec middleman init . -T yterajima/middleman-slim
  $ Overwrite /Users/hikaru/Dropbox/Home/work/hxh_mg_ps1/.gitignore? (enter "h" for help) [Ynaqdh] y
  $ Overwrite /Users/hikaru/Dropbox/Home/work/hxh_mg_ps1/Gemfile? (enter "h" for help) [Ynaqdh] y
  $ Do you want to use the Asset Pipeline? y
  $ Do you want to use Compass? n
  $ Do you want to use LiveReload? y
  $ Do you want a Rack-compatible config.ru file? n
  $ bundle install --path vendor/bundle --binstubs bin

  # livereload の有効化
  $ vi config.rb
    - # configure :development do
    - #   activate :livereload
    - # end
    + configure :development do
    +   activate :livereload
    + end

  # bootstrap 導入
  $ vi Gemfile
    + gem "jquery-middleman"
    + gem "bootstrap-sass"
  $ bundle install
  $ vi source/stylesheets/site.css.sass
    + @charset "utf-8"
    + @import bootstrap-sprockets
    + @import bootstrap
  $ vi source/javascripts/all.js
    + //= require jquery
    + //= require bootstrap-sprockets
      //= require_tree .

  # 不要なdefault生成物を削除
  $ rm source/stylesheets/_normalize.scss
  $ rm source/stylesheets/site.css.scss
  $ rm source/images/middleman-logo.svg
 
  # .gitignore調整
  ls -d1 /vendor/bundle /bin >> .gitignore
```
