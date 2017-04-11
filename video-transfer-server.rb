require 'rubygems'
require 'awesome_print'
require 'handbrake'
require 'fileutils'

videos = Dir["/mnt/SOLMACOS/needs-convertion/2017-01/*.mov"]
# require 'debug'
videos.each do |video|
  FileUtils.cp(video, "/home/marknatera/Videos/.")
  file_name = File.basename(video,File.extname(video))
  video = "/home/marknatera/Videos/" + file_name + ".mov"
  mp4 = file_name + ".mp4"
  convert_folder = "/home/marknatera/Videos/converted/"
  # Checking if file exist in convertion folder
  file_exist = "#{convert_folder}#{mp4}"
  unless File.exist?(file_exist)
    vconvert = HandBrake::CLI.new(trace: true).input(video)
    vconvert.preset('High Profile').output("#{convert_folder}#{mp4}")
  end
  File.delete(video)
end
