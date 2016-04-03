## setup log
```
  $ mkdir project_dir
  $ git init
  $ touch .keep
  $ git add .keep
  $ git commit 'create repos'
  $ rm .keep
  $ rbenv local 2.2.3
  $ bundle init
  $ vi Gemfile
    - gem "rails"
    + gem "middleman"
    + gem "slim"
  $ bundle install --path vendor/bundle
  $ bundle exec middleman init . -T yterajima/middleman-slim
  $ Overwrite /Users/hikaru/Dropbox/Home/work/hxh_mg_ps1/.gitignore? (enter "h" for help) [Ynaqdh] y
  $ Overwrite /Users/hikaru/Dropbox/Home/work/hxh_mg_ps1/Gemfile? (enter "h" for help) [Ynaqdh] y
  $ Do you want to use the Asset Pipeline? y
  $ Do you want to use Compass? n
  $ Do you want to use LiveReload? y
  $ Do you want a Rack-compatible config.ru file? n
  $ bundle install --path vendor/bundle --binstubs bin
  $ vi config.rb
    - # configure :development do
    - #   activate :livereload
    - # end
    + configure :development do
    +   activate :livereload
    + end
  $ rm source/stylesheets/_normalize.scss
  $ rm source/stylesheets/site.css.scss
  $ vi source/stylesheets/site.css.sass
    + @charset "utf-8"
  $ rm source/images/middleman-logo.svg
  $ vi Gemfile
    + gem "jquery-middleman"
  $ bundle install
```
