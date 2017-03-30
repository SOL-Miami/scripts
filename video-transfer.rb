require 'rubygems'
require 'awesome_print'
require 'handbrake'
require 'fileutils'

# For Testing
# videos = Dir["/Volumes/Media/LIVE\ Recordings/*"]
# videos = Dir["*.mov"]

# SOL Server Path
videos = Dir["/mnt/SOLNAS/LIVE Recordings*"]

videos.each do |video|
  require 'debug'
  file = File.basename(video,File.extname(video))
  FileUtils.cp(video, "~/Videos/.")
  video = "~/Videos/" + file + ".mov"
  vconvert = HandBrake::CLI.new(trace: true).input(video)
  vconvert.preset('High Profile').output("~/Videos/converted/#{file}.mp4")
end
# video = HandBrake::CLI.new.input('/Users/Mark/OneDriveBusiness/Playa/Images/1.mp4')
# For iPhone
# video.preset('iPhone & iPod Touch').output('/Users/Mark/Desktop/project-phone.m4v')
