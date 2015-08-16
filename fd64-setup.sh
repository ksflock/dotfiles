#!/bin/sh

[ -e libflashplayer.so ] && rm -f /usr/lib64/mozilla/plugins/libflashplayer.so
[ -e libflashplayer.so ] && cp libflashplayer.so /usr/lib64/mozilla/plugins
[ -e /usr/bin/ccache ]  && ln -s -r /usr/bin/ccache /usr/local/bin/gcc
[ -e /usr/bin/ccache ]  && ln -s -r /usr/bin/ccache /usr/local/bin/cc
[ -e /usr/bin/ccache ]  && ln -s -r /usr/bin/ccache /usr/local/bin/g++

write_pwget_update() {
	cat << 'EOF' > /usr/local/pwget/pwget
#! /bin/bash

# Pwget created by Lobster with thanks to Zigbert, Aragon
# modified by uten
# for Puppy and Linux Tmxxine
# Feb 2009 GPL v3 License
# http://tmxxine.com

cd /root

export Pwget='
<window title="Pwget - File downloader utility">
<vbox>
 <hbox>
  <text><label>Copy and Paste URL location of required file into "Address". Add destination and click "OK"</label></text>
 </hbox>
 <hbox>
  <text><label>Address</label></text>
  <entry accept="directory"><variable>SOURCE</variable><input>/tmp/pm_source_dir</input></entry>
 </hbox>
 <checkbox>
 <label>Download Website</label>
 <variable>WEBSITE</variable>
 </checkbox>
 <checkbox>
 <label>Download only this level down</label>
 <variable>WEBSITE_SUB</variable>
 </checkbox> 
 <hbox>
  <text><label>Destination Dir</label></text>
  <entry accept="directory"><variable>DEST</variable><input>/tmp/pm_mirror_dir</input></entry>
  <button>
   <input file icon="gtk-open"></input>
   <action type="fileselect">DEST</action>
   <action>refresh:DEST</action>
  </button>
 </hbox>
 <hbox>
  <button help>
   <action>`Xdialog --wrap --screencenter --left --title "Pwget - HELP" --msgbox "Pwget is a simple front end to the wget utility. Wget is used for downloading larger files from the internet such as ISOs. The files are verified during the download procedure. As ISO and other files are checked and downloads resumed, they do not require a md5sum check. Copy and paste the source file you wish to download. Use the file selector to choose the destination. You can now download a complete website for offline reading by clicking the Download Website checkbox. \n\n Lobster, Feb 2009" 600x0`</action>
  </button>
  <button cancel></button>
  <text><label>Download</label></text>
  <button ok></button>
 </hbox>
</vbox>
</window>'

I=$IFS; IFS=""
for STATEMENTS in  $(gtkdialog3 --program=Pwget --center); do
   eval $STATEMENTS
done
IFS=$I
if [ $EXIT = OK ]
 then
  if [ $WEBSITE_SUB = true ]; then
	wget_options=" --no-check-certificate --relative -r --convert-links -P $DEST $SOURCE"
	
  elif [ $WEBSITE = true ]; then
	wget_options=" --no-check-certificate -r --convert-links -P $DEST $SOURCE"
  else
	  wget_options=' --no-check-certificate -c -P "'$DEST'" '$SOURCE
  fi
  rxvt -geometry 72x8 -name "pwget $SOURCE" -bg "#FAEBD7" -fg "#000000" -e wget $wget_options
  rox -d "$DEST"
fi 
	
EOF
}; write_pwget_update

write_synergys_conf() {
	cat << 'EOF' > /etc/synergys.conf
section: screens
	myserver:
	myclient:
	acer4000:
end
section: aliases
	myserver:
		fatdog64-141
	myclient:
		fatdog64-f1f
	acer4000:
		puppypc001
end
section: links
	myserver:
		up = myclient
		right = puppypc001
	myclient:
		down = myserver
	acer4000:
		left = myserver
		up = myclient
end
section: options
	screenSaverSync = false
end

EOF
	
}; write_synergys_conf
