require 'rubygems'
require 'awesome_print'
require 'handbrake'
require 'fileutils'

### For Testing
# videos = Dir["/Volumes/Media/LIVE\ Recordings/*"]
# videos = Dir["*.mov"]
### SOL Server Path
videos = Dir["/mnt/SOLNAS/LIVE\ Recordings/*.mov"]

videos.each do |video|
  # require 'debug'
  file = File.basename(video,File.extname(video))
  FileUtils.cp(video, ".")
  video = file + ".mov"
  vconvert = HandBrake::CLI.new(trace: true).input(video)
  vconvert.preset('High Profile').output("converted/#{file}.mp4")
  # FileUtils.rm_rf(video, ".")
  File.delete(video)
end
