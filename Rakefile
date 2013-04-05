GITHUB_REPONAME = "Ramblurr/quechua"
require 'rubygems'
require 'jekyll'
require 'tmpdir'

version = ">= 0"
#gem 'jekyll', version
#load Gem.bin_path('jekyll', 'jekyll', version)

namespace :site do
  desc "Generate blog files"
  task :generate do
    Jekyll::Site.new(Jekyll.configuration({
      "source"      => ".",
      "destination" => "_site"
    })).process
  end


  desc "Init gh temp repo"
  task :init do
      system "mkdir _site_gh"
      Dir.chdir "_site_gh"
      system "git init ."
      system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
      system "git checkout -b gh-pages"
  end

  desc "Generate and publish blog to gh-pages"
  task :publish => [:generate] do
    Dir.mktmpdir do |tmp|
      Dir.chdir('_site_gh') do
        system "git pull --rebase origin gh-pages"
      end
      system "rsync --exclude='site:publish' -az --delete _site/* _site_gh/"
      Dir.chdir "_site_gh"
      system "git rm $(git ls-files --deleted)"
      system "git add ."
      message = "Site updated at #{Time.now.utc}"
      system "git commit -m #{message.shellescape}"
      system "git push origin gh-pages"
    end
  end
end
