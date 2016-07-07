# HandBrakeCLI -i /Volumes/media/LIVE\ Recordings/2016-06-15_Pastor\ Joaquin\ 1\ \(PGM\).mpg -o ~/Desktop/testing-video/pastor.mp4 --preset="High Profile"
# Preset List for conversontions
# HandBrakeCLI --preset-list
require 'rubygems'
require 'awesome_print'
require 'handbrake'

# require 'debug'

# Input
video = HandBrake::CLI.new.input('/Users/Mark/Desktop/testing-video/video.mp4')

# For iPhone
video.preset('iPhone & iPod Touch').output('/Users/Mark/Desktop/project-phone.m4v')

# TV
# video.preset('High Profile').output('project-tv.mp4')
