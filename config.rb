require 'slim'

helpers do
  def label(text)
    "<span class='label secondary'>#{text}</span>"
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

sprockets.append_path File.join(Middleman::Application.root, 'foundation', 'js', 'foundation')
sprockets.append_path File.join(Middleman::Application.root, 'foundation', 'js', 'vendor')
sprockets.append_path File.join(Middleman::Application.root, 'foundation', 'scss')

set :sass_assets_paths, [File.join(Middleman::Application.root, 'foundation', 'scss')]

set :markdown_engine, :redcarpet
set :frontmatter_extensions, %w(.html .slim)

activate :directory_indexes

configure :development do
  set :debug_assets, true
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  set :http_prefix, "/"
end
