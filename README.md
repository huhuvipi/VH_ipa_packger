# VH_ipa_packger
This script packages adding SwiftSupport folder with libswiftCore*.dylib in to ipa file. This is needed to deploy an app made with Swift into the AppStore
## Usage : 
### Run the script:
 `path/to/package_ipa.sh /path/to/ipafile`
### Requirements
OSX Mavericks or Yosemite
Xcode 6
Xcode command line tools

### How to it work
Create a temp folder

Unzip ipa file to temp folder

Create SwiftSupport folder inside temp folder

Copy swift libs from Payload/*app/framworks to SwiftSupport folder

Package ipa file from contains inside temp folder (we have Payload and SwiftSupport folders), and save to output directory