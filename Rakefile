require 'bundler'
Bundler.require :default

require 'fileutils'

def rsync(options)
  system "rsync -avz -e ssh #{options}"
end

task :upload do
  system 'middleman build'
  rsync "--delete #{File.join(Middleman::Application.root, 'build/*')} ajincitti@william-samuel.dreamhost.com:site/current"
end

namespace :data do
  task :pull do
    rsync '--delete ajincitti@william-samuel.dreamhost.com:site/data/* data/'
  end
  
  task :push do
    rsync '--delete data/* ajincitti@william-samuel.dreamhost.com:site/data/'
  end
end

GALLERY_SRC_DIR = "data/galleries"
GALLERY_DST_DIR = "source/images/galleries"

namespace :pictures do
  task all: [:galleries, :scholarships, :current_board, :past_board, :lecture_series]
  
  task :galleries do
    FileUtils.rm_rf GALLERY_DST_DIR
    
    Dir.foreach(GALLERY_SRC_DIR).with_index do |dir|
      next if dir == '.' or dir == '..'
      
      dst = "#{GALLERY_DST_DIR}/#{dir}"
      FileUtils.mkdir_p dst
      FileUtils.mkdir_p "#{dst}-th"
      
      src_dir = "#{GALLERY_SRC_DIR}/#{dir}"
      
      Dir.foreach(src_dir).with_index do |pic, i|
        next if pic == '.' or pic == '..'
        
        dst_dir = "#{GALLERY_DST_DIR}/#{dir}"  

        begin
          img = Magick::Image::read("#{src_dir}/#{pic}").first
            
          full = img.resize_to_fit 100000000000000000, 600
          full.write "#{dst}/#{pic}"
          full.destroy!
          
          thnl = img.resize_to_fit 100000000000000000, 90
          thnl.write "#{dst}-th/#{pic}"
          thnl.destroy!
          
          img.destroy!
          
          puts "Exported #{pic}..."
        rescue Magick::ImageMagickError
          puts "Error converting #{pic}!"
        end
      end
    end
  end
  
  task :scholarships do
    src_dir = "data/scholarships"
    dst_dir = "source/images/scholarships"
    
    FileUtils.rm_rf dst_dir
    FileUtils.mkdir_p dst_dir
    
    Dir.foreach(src_dir) do |url|
      next if url == '.' or url == '..'
      begin
        img = Magick::Image::read("#{src_dir}/#{url}").first
        pic = img.resize_to_fit 100000000000000000, 200
        pic.write "#{dst_dir}/#{url}"
        pic.destroy!
        img.destroy!
        
        puts "Exported #{url}"
      rescue Magick::ImageMagickError => e
        puts "Error converting #{url}! (#{e})"
      end
    end    
  end
  
  task :current_board do
    src_dir = "data/current_board"
    dst_dir = "source/images/current_board"
    
    FileUtils.rm_rf dst_dir
    FileUtils.mkdir_p dst_dir
    
    Dir.foreach(src_dir) do |url|
      next if url == '.' or url == '..'
      begin
        img = Magick::Image::read("#{src_dir}/#{url}").first
        pic = img.resize_to_fit 100000000000000000, 200
        pic.write "#{dst_dir}/#{url}"
        pic.destroy!
        img.destroy!
        
        puts "Exported #{url}"
      rescue Magick::ImageMagickError => e
        puts "Error converting #{url}! (#{e})"
      end
    end    
  end  
  
  task :past_board do
    src_dir = "data/past_board"
    dst_dir = "source/images/past_board"
    
    FileUtils.rm_rf dst_dir
    FileUtils.mkdir_p dst_dir
    
    Dir.foreach(src_dir) do |url|
      next if url == '.' or url == '..'
      begin
        img = Magick::Image::read("#{src_dir}/#{url}").first
        pic = img.resize_to_fit 100000000000000000, 200
        pic.write "#{dst_dir}/#{url}"
        pic.destroy!
        img.destroy!
        
        puts "Exported #{url}"
      rescue Magick::ImageMagickError => e
        puts "Error converting #{url}! (#{e})"
      end
    end    
  end
  
  task :lecture_series do
    src_dir = "data/lecture_series"
    dst_dir = "source/images/lecture_series"
    
    FileUtils.rm_rf dst_dir
    FileUtils.mkdir_p dst_dir
    
    Dir.foreach(src_dir) do |url|
      next if url == '.' or url == '..'
      begin
        img = Magick::Image::read("#{src_dir}/#{url}").first
        pic = img.resize_to_fit 100000000000000000, 200
        pic.write "#{dst_dir}/#{url}"
        pic.destroy!
        img.destroy!
        
        puts "Exported #{url}"
      rescue Magick::ImageMagickError => e
        puts "Error converting #{url}! (#{e})"
      end
    end    
  end  
end

