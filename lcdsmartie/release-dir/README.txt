

Please see our website for instructions and the latest information:
		http://lcdsmartie.sourceforge.net/

USB Palm users please visit: 
  http://sourceforge.net/forum/forum.php?thread_id=1184430&forum_id=416971

Alpha builds
============
These builds are believed to be stable but the developer(s) do not have access
to all supported LCD types and/or use all the features of LCD Smartie.

Increased error checking has been compiled in this build - so this build may
'fail' where the problem would have gone unnoticed in previous builds. By
reporting these bugs will increased LCD Smartie's stability.

BUGS KNOWN
==========
See: http://sourceforge.net/tracker/?func=browse&group_id=122330&atid=693136


Changes
=======
5.3Alpha3
	- Actions moved from action.cfg to config.ini.
	- Fixed bug where some Crystalfontz display weren't working.
	- Fixed bug [1069517] Total downloaded limit at 4gb.
	- Fixed bug [1071793] Exception: Cannot focus a disabled or
	  invisible window.
	- Fixed bug [1070868] Minimise whilst in setup is broken.
	- Added config option to improve contrast fade; MinFadeContrast -
	  this defines the lowest point of the fade. LCDs often go blank
	  long before a contrast of 0 is reached and the fade can appear to
	  be doing nothing.
	- Support more USB Palms - needs PalmOrb 1.1a2 or above.
5.3Alpha2
	- Fixed 'Unable to locate the "Processor" performance object'
	  exception. [Also added FAQ entry for problem.]
	- Fixed hang when a screen has a syntax error.
5.3Alpha1
	- Fixed some Rss bugs also improved error reporting.
	- Fixed bug in contrast fade.
	- CPU speed is now live rather than fixed. [For speedstep, etc]
	- Fixed $PageU% - was always 0.
	- Fixed MO keypads.
	- USB Palms can now send keys.
5.3pAlpha4
	- Supports very large pagefiles and memory.
	- config.cfg/servers.cfg files replaced with config.ini file.
	  [actions.cfg is yet to be converted.]
	- fixed range error when selecting email account #10.
	- fixed -hide and -totalhide options.
	- support all network devices not just ethernet.
5.3pAlpha3
	- Added experimental USB Palm support (when used with PalmOrb)
	  [Serial Palm Support already existed.]
	- Fix range error with large pagefiles and/or memory; needs
          further work for memory/pagefiles over 4GB.
5.3pAlpha2
	- experimental support for Resuming after being in standby.
5.3pAlpha1
	- large internal code changes, to help make it more maintainable.
	- increased stability.
	- added Rss feed support.
	- added email last subject/from field.
	- fixed Seti/fold support.
	- added support for bug reports to be emailed.


ALPHA/Beta Releases
===================
It is advised that you backup your data before trying these builds.


FEEDBACK
========
The only way this program will get better is if you provide feedback. Tell
us if you find bugs - or find it to be bug free. Also tell us if there's a
feature you want, or if there's an existing feature that you don't like. 
Submit your feedback to the forums available on our website:
                      http://lcdsmartie.sourceforge.net/

Disclaimer
==========
We exclude ourselves from any liability howsoever arising for direct, indirect,
consequential, incidental, special or punitive damages of any kind or for loss
of revenue or profits, loss of business, loss of information or data or other
financial loss arising out of or in connection with use of LCD Smartie. Use of
LCD Smartie is expressly at users own risk.
