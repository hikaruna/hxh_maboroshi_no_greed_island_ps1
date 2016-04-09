require 'slim'
require "active_record"
require "active_record/fixtures"

###
# Page options, layouts, aliases and proxies
###

configure :build do
  ignore 'templates/*'
end

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

$doit_count = 3
def doit message
  $doit_count += 1
  puts "#{"="*$doit_count} #{message.to_s} start =========="
  yield
  puts "#{"="*$doit_count} #{message.to_s} finish =========="
  $doit_count -= 1
end

ready do
  doit :initialize_database do
    doit :database_create do
      #DB_FILE = ':memory:'
      DB_FILE = 'data.sqlite3'
      File.delete DB_FILE if File.exists? DB_FILE
      ActiveRecord::Base.establish_connection(
        adapter:   'sqlite3',
        database:  DB_FILE,
      )
    end

    doit :tables_create do
      require './data/migration.rb'
      Migration.migrate(:up)
    end

    Dir['data/models/**/*.rb'].each{|i| require i }

    doit :fixtures_load do
      ActiveRecord::FixtureSet.create_fixtures(
        "data/fixtures",
        Dir['data/fixtures/*.yml'].map{|i|
          File.basename(i, '.yml')
        },
      )
    end
  end

  doit :Generate_model_pages do
    Dir['./data/models/**/*.rb'].map{|name| Object.const_get(File.basename(name, '.rb').classify) }.each do |model_class|
      puts model_class.name

      proxy(
        "/#{model_class.name.tableize}.html",
        '/templates/index',
        locals: { model_class: model_class, names: model_class.pluck(:name) },
      )

      model_class.includes(model_class.reflect_on_all_associations.map(&:name)).each do |model|
        model.class.reflect_on_all_associations().each do |asso|
          model.send(asso.name)
        end
        proxy(
          "/#{model_class.name.tableize}/#{model.name}.html",
          '/templates/show',
          locals: { model: model },
        )
      end
    end
  end
end


###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  set :http_prefix, '/hxh_maboroshi_no_greed_island_ps1'
end

# デプロイの設定
# 今回は gh-pages を使用するので branch に 'gh-pages' を設定する
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'gh-pages'
end
