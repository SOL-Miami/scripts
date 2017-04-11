require 'rubygems'
require 'awesome_print'
require 'handbrake'
require 'fileutils'

### For Testing
# videos = Dir["/Volumes/Media/LIVE\ Recordings/*.mov"]
videos = Dir["/Volumes/OS/needs-convertion/2017-02/*.mov"]
# videos = Dir["*.mov"]
### SOL Server Path
# videos = Dir["/mnt/SOLNAS/LIVE\ Recordings/*.mov"]
videos.each do |video|
  # Please change according to environment
  file = File.basename(video,File.extname(video)) + ".mp4"

  # convert_folder = "/mnt/SOLNAS/LIVE\ Recordings/converted/#{file}"
  # convert_folder = "/Volumes/Media/LIVE\ Recordings/converted/#{file}"
  convert_folder = "/Volumes/OS/converted/2017-02\ February/"

  # Checking if file exist in convertion folder
  file_exist = "#{convert_folder}#{file}"
  unless File.exist?(file_exist)
    vconvert = HandBrake::CLI.new(trace: true).input(video)
    vconvert.preset('High Profile').output("#{convert_folder}#{file}")
  end
  # FileUtils.cp(video, ".")
  # video = file + ".mov"
  # require 'debug'
  # FileUtils.rm_rf(video, ".")
  # File.delete(video)
end
