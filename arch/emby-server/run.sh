#!/bin/bash


# emby-server env
export MONO="/usr/bin/mono"
export PROGRAM_DATA="/config"
export FFMPEG="/usr/bin/ffmpeg"
export FFPROBE="/usr/bin/ffprobe"


# run emby-server
exec "/usr/bin/emby-server"
