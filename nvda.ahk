/*
You can either copy and paste these lines in your script or use the #Include command
https://www.autohotkey.com/docs/commands/_Include.htm :
  
#include nvda.ahk

Place nvdaControllerClient64.dll and nvdaControllerClient32.dll in the same folder as you script
*/

nvdaSpeak(text)
	{
	 return DllCall("nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_speakText", "wstr", text)
	}

nvdaCancel()
	{
	 return DllCall("nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_cancelSpeech")
	}

nvdaBrailleMessage(text)
	{
	 return DllCall("nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_brailleMessage", "wstr", text)
	}

nvdaRunning() ; returns 0 if running
	{
	 return DllCall("nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_testIfRunning")
	}
