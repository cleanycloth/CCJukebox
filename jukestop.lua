speaker = peripheral.find("speaker")
monitor = peripheral.find("monitor")
drive = peripheral.find("drive")
print("Stopping playback...")
speaker.stop()
if monitor ~= nil then
  monitor.clear()
  monitor.setCursorPos(1,1)
end
if drive ~= nil then
  drive.stopAudio()
end
