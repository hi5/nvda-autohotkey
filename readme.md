# NVDA and AutoHotkey

This repository was prepared as there wasn't much information available on how to use AutoHotkey with NVDA.

You need:

* NVDA, the free and open source Screen Reader for Microsoft Windows,  
  more information at https://www.nvaccess.org/ and https://github.com/nvaccess/nvda
* NVDA Controller DLL files: http://www.nvda-project.org/nvdaControllerClient/nvdaControllerClient_20100219.7z  
  if they are not available on the NVDA website you can download them below as well.
* AutoHotkey, the free and open source automation scripting language for Windows,
  more information at https://www.autohotkey.com/ (downloads and forum). 
* [nvda.ahk](nvda.ahk)

Tested with nvda_2019.2.1 and AutoHotkey version 1.1.32 (both 32 and 64 bit).

# Usage

You can either copy and paste the code from nvda.ahk in your script or use the #Include command
https://www.autohotkey.com/docs/commands/_Include.htm

```autohotkey
#include nvda.ahk
```

Place nvdaControllerClient64.dll and nvdaControllerClient32.dll in the same folder as your script.

# Functions

* nvdaSpeak(text) - speak the text 
* nvdaCancel() - cancel speak or braille message
* nvdaBrailleMessage(text) - send braille message, untested
* nvdaRunning() - check if NVDA is running, returns 0 if so

# Example

```autohotkey
nvdaSpeak("Your accessibility script has been started.")

^1:: ; ctrl+1
nvdaSpeak("You pressed control + 1")
Return

!s::nvdaCancel() ; press Alt+S to cancel speak/braille

#include nvda.ahk
```

# NVDA Controller Client (DLL files)

The NVDA Controller Client API allows an application to communicate to NVDA, in order to do such things as speak text or braille a message. 

The client API is implemented as a dll (dynamic link library). The functions in this dll can be called from any programming language that supports looking up and calling of any symbol in a dll (such as ctypes in Python), or by linking to it, for languages like C and C++.

License LGPLv2.1 - see license.txt in the 7z file.

Download from this repository:

* [nvdaControllerClient_20100219.7z](nvdaControllerClient_20100219.7z)   

