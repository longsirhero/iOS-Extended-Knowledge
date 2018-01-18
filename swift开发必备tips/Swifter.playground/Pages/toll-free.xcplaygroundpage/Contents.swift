
import Foundation
import AudioToolbox

let fileURL = NSURL(string: "SomeURL")
var theSoundID: SystemSoundID = 0
AudioServicesCreateSystemSoundID(fileURL!, &theSoundID)
