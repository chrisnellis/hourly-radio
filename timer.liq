# Written to work with Liquidsoap 1.11

# Use a log file instead of outputting to the terminal
set("log.file", true)

# Define a path to the log file
set("log.file.path", "/home/chris/logs/liquidsoap/liquidsoap.log")

# Running in daemon mode requires a PID file. This config sets that
set("init.daemon.pidfile.path","/home/chris/liquidsoap.pid")

# Set up a source for each hour's audio file that will continuously loop
source1am = single("/media/icecast-disk/audio/1am.wav")

source2am = single("/media/icecast-disk/audio/2am.wav")

source3am = single("/media/icecast-disk/audio/3am.wav")

source4am = single("/media/icecast-disk/audio/4am.wav")

source5am = single("/media/icecast-disk/audio/5am.wav")

source6am = single("/media/icecast-disk/audio/6am.wav")

source7am = single("/media/icecast-disk/audio/7am.wav")

source8am = single("/media/icecast-disk/audio/8am.wav")

source9am = single("/media/icecast-disk/audio/9am.wav")

source10am = single("/media/icecast-disk/audio/10am.wav")

source11am = single("/media/icecast-disk/audio/11am.wav")

source12am = single("/media/icecast-disk/audio/12am.wav")

source1pm = single("/media/icecast-disk/audio/1pm.wav")

source2pm = single("/media/icecast-disk/audio/2pm.wav")

source3pm = single("/media/icecast-disk/audio/3pm.wav")

source4pm = single("/media/icecast-disk/audio/4pm.wav")

source5pm = single("/media/icecast-disk/audio/5pm.wav")

source6pm = single("/media/icecast-disk/audio/6pm.wav")

source7pm = single("/media/icecast-disk/audio/7pm.wav")

source8pm = single("/media/icecast-disk/audio/8pm.wav")

source9pm = single("/media/icecast-disk/audio/9pm.wav")

source10pm = single("/media/icecast-disk/audio/10pm.wav")

source11pm = single("/media/icecast-disk/audio/11pm.wav")

source12pm = single("/media/icecast-disk/audio/12pm.wav")

# Use Liquidsoap's "switch" to change tracks based on the hour
switchSource = switch(
# this param doesn't wait until the current track ends to switch
track_sensitive=false,
[
({ 0h00-0h59 }, source12am),
({ 1h00-1h59 }, source1am),
({ 2h00-2h59 }, source2am),
({ 3h00-3h59 }, source3am),
({ 4h00-4h59 }, source4am),
({ 5h00-5h59 }, source5am),
({ 6h00-6h59 }, source6am),
({ 7h00-7h59 }, source7am),
({ 8h00-8h59 }, source8am),
({ 9h00-9h59 }, source9am),
({ 10h00-10h59 }, source10am),
({ 11h00-11h59 }, source11am),
({ 12h00-12h59 }, source12pm),
({ 13h00-13h59 }, source1pm),
({ 14h00-14h59 }, source2pm),
({ 15h00-15h59 }, source3pm),
({ 16h00-16h59 }, source4pm),
({ 17h00-17h59 }, source5pm),
({ 18h00-18h59 }, source6pm),
({ 19h00-19h59 }, source7pm),
({ 20h00-20h59 }, source8pm),
({ 21h00-21h59 }, source9pm),
({ 22h00-22h59 }, source10pm),
({ 23h00-23h59 }, source11pm)]
)

player = mksafe(switchSource)

# Define an output of the switch to the icecast server running locally
output.icecast(%mp3, host="localhost",port=8000,password="hackme", mount="player", player)
