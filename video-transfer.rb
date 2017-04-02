require 'rubygems'
require 'awesome_print'
require 'handbrake'
require 'fileutils'

### For Testing
videos = Dir["/Volumes/Media/LIVE\ Recordings/*"]
# videos = Dir["*.mov"]
### SOL Server Path
# videos = Dir["/mnt/SOLNAS/LIVE\ Recordings/*.mov"]

videos.each do |video|
  file = File.basename(video,File.extname(video)) + ".mp4"
  file_folder = "/mnt/SOLNAS/LIVE\ Recordings/converted/#{file}"
  unless File.exist?(file_folder)
    # require 'debug'
    vconvert = HandBrake::CLI.new(trace: true).input(video)
    vconvert.preset('High Profile').output("/mnt/SOLNAS/LIVE\ Recordings/converted/#{file}")
  end
  # FileUtils.cp(video, ".")
  # video = file + ".mov"
  # require 'debug'
  # FileUtils.rm_rf(video, ".")
  # File.delete(video)
end
