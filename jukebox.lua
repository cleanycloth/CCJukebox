-- Jukebox Playback Program
-- cleanycloth 2022

-- Find speaker to play back to.
-- If no speaker is installed, quit.
speaker = peripheral.find("speaker")
if speaker == nil then
  print("Speaker not found. Install one and try again.")
  return false
end

-- Print list of available records.
-- TODO: Replace with array, allow for playback of mod records if possible
print("Available options are:\nCD audio from installed drive\n11\n13\nBlocks\nCat\nChirp\nFar\nMall\nMellohi\nOtherside\nPigstep\nStal\nStrad\nWait\nWard")
print("Enter a disc to play:")
-- Get the user's input, set to lowercase, then remove all spaces
disc = string.lower(io.read("*l"))
disc = string.gsub(disc, "%s+", "")

-- If the input is not empty, attempt to play disc.
if string.len(disc) > 0 then
  print("Attempting to play: "..disc)
  print("To stop playback, type \"jukestop\"")
-- Play back disc - discs that don't exist will simply not play.
  if not disc == "cd" then
    speaker.playSound("minecraft:music_disc."..disc)
  else
    cdplayer = peripheral.find("drive")
    if cdplayer == nil then
      print("Disk drive not found. Install one and try again.")
      return false
    end
    if cdplayer.hasAudio() == false then
    print("Disk not inserted or not audio CD. Insert one and try again.")
    return false
    end
    print("Playing from CD...")
    cdplayer.playAudio()
    disc = cdplayer.getAudioTitle()
  end
-- Attempt to output info to monitor. If not found, skip
  monitor = peripheral.find("monitor")
  if monitor ~= nil then
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.setTextScale(3)
    monitor.write("Now playing:")
    monitor.setCursorPos(1,2)
    monitor.write(disc)
  end
else
-- Quit if a disc is not specified
  print("Disc not specified, exiting...")
  return false
end
