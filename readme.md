# NVDA and AutoHotkey

This repository was prepared as there wasn't much information available on how to use AutoHotkey with NVDA.

You need:

* NVDA, the free and open source Screen Reader for Microsoft Windows, more information at https://www.nvaccess.org/ and https://github.com/nvaccess/nvda
* NVDA Controller DLL files: http://www.nvda-project.org/nvdaControllerClient/nvdaControllerClient_20100219.7z if they are not available on the NVDA website you can download them below as well.
* AutoHotkey, the free and open source automation scripting language for Windows, more information at https://www.autohotkey.com/ (downloads and forum). 
* [nvda.ahk](https://raw.githubusercontent.com/hi5/nvda-autohotkey/master/nvda.ahk)

Tested with nvda_2019.2.1 and AutoHotkey version 1.1.32 (both 32 and 64 bit).

# Usage

You can either copy and paste the code from nvda.ahk in your script or use the #Include command
https://www.autohotkey.com/docs/commands/_Include.htm

```autohotkey
#include nvda.ahk
```

Place nvdaControllerClient64.dll and nvdaControllerClient32.dll in the same folder as your script.

# Notes - Tips

1. NVDA itself may interrupt nvdaSpeak() so you may need to accommodate for this in your script by using a Sleep command, nvdaCancel() or a combination of both - see [Tip: nvdaSpeak() may be interrupted by nvda speaking window title, problem and solution proposed](https://github.com/hi5/nvda-autohotkey/issues/2)
2. If NVDA can't see a programs buttons or menus, perhaps you can try using a number of AutoHotkey commands such as MouseClick, Send {Appskey} or {Rbutton} to bring up context menus or preparing a AutoHotkey Menu or Inputbox to get simple user feedback. NVDA can see AutoHotkey Menus and GUIs so that might help - an example using MouseClick, InputBox and Menu here https://www.autohotkey.com/boards/viewtopic.php?p=307440#p307440

# Functions

* nvdaSpeak(text) - speak the text 
* nvdaCancel() - cancel speak or braille message
* nvdaBrailleMessage(text) - send braille message, untested
* nvdaRunning() - check if NVDA is running, returns 0 if so

# Example

```autohotkey
nvdaSpeak("Your accessibility script has been started.")

; Note that NVDA itself may interrupt nvdaSpeak() - if that causes a problem try to solve it with a Sleep or nvdaCancel() - see Notes-Tips

variable:="This is a test"
nvdaSpeak(variable)

; The clipboard is a special variable, see https://www.autohotkey.com/docs/misc/Clipboard.htm
nvdaSpeak(clipboard)

; The hotkey syntax can be found here https://www.autohotkey.com/docs/Hotkeys.htm
^1:: ; ctrl+1
nvdaSpeak("You pressed control + 1")
Return

; press Alt+S to cancel speak/braille
!s::nvdaCancel() 

#include nvda.ahk
```

# NVDA Controller Client (DLL files)

The NVDA Controller Client API allows an application to communicate to NVDA, in order to do such things as speak text or braille a message. 

The client API is implemented as a dll (dynamic link library). The functions in this dll can be called from any programming language that supports looking up and calling of any symbol in a dll (such as ctypes in Python), or by linking to it, for languages like C and C++.

License LGPLv2.1 - see license.txt in the 7z file.

Download from this repository:

* [nvdaControllerClient_20100219.7z](https://github.com/hi5/nvda-autohotkey/blob/master/nvdaControllerClient_20100219.7z?raw=true)
