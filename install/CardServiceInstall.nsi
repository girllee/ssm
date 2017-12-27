; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "CardService"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "������"
!define PRODUCT_WEB_SITE "http://www.365020.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\CardService.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "pkg\f\LICENSE.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\CardService.exe"
;!define MUI_FINISHPAGE_RUN_PARAMETERS "%CD%/python.exe %CD%/CardService.pyc"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\CardService"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
BrandingText "�������룺��������Ӣ�� (Raindy)"
RequestExecutionLevel admin
Function .onInit 
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  
  File "pkg\CardService\_ctypes.pyd"
  File "pkg\CardService\_hashlib.pyd"
  File "pkg\CardService\_socket.pyd"
  File "pkg\CardService\_ssl.pyd"
  File "pkg\CardService\bz2.pyd"
  File "pkg\CardService\CardService.exe"
  File "pkg\CardService\CardService.exe.manifest"
  File "pkg\CardService\Microsoft.VC90.CRT.manifest"
  File "pkg\CardService\msvcm90.dll"
  File "pkg\CardService\msvcp90.dll"
  File "pkg\CardService\msvcr90.dll"
  File "pkg\CardService\python27.dll"
  File "pkg\CardService\select.pyd"
  File "pkg\CardService\unicodedata.pyd"
SectionEnd
  
Section "f" SEC02
  File "pkg\f\function.dll" 
  File "pkg\f\USB.dll"  
  CreateDirectory "$SMPROGRAMS\CardService"
  CreateShortCut "$SMPROGRAMS\CardService\CardService.lnk" "$INSTDIR\CardService.exe"
  CreateShortCut "$DESKTOP\CardService.lnk" "$INSTDIR\CardService.exe"
  
  CreateShortCut "$STARTMENU.lnk" "$INSTDIR\CardService.exe"
  ;CreateShortCut "$SMPROGRAMS.lnk" "$INSTDIR\CardService.exe"
SectionEnd
  

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\CardService\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\CardService\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  
  SetRegView 32
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "MyApp" "$INSTDIR\CardService.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\CardService.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name)���估���е������" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
 
  
  Delete "$INSTDIR\USB.dll"
  Delete "$INSTDIR\function.dll" 
  
  Delete "$INSTDIR\_ssl.pyd"
  Delete "$INSTDIR\_socket.pyd"
  Delete "$INSTDIR\_hashlib.pyd"
  Delete "$INSTDIR\_ctypes.pyd"
  Delete "$INSTDIR\unicodedata.pyd"
  Delete "$INSTDIR\select.pyd" 
  Delete "$INSTDIR\python27.dll"
  Delete "$INSTDIR\msvcr90.dll"
  Delete "$INSTDIR\msvcp90.dll"
  Delete "$INSTDIR\msvcm90.dll"
  Delete "$INSTDIR\Microsoft.VC90.CRT.manifest"
  Delete "$INSTDIR\CardService.exe.manifest"
  Delete "$INSTDIR\CardService.exe"
  Delete "$INSTDIR\bz2.pyd"

  Delete "$SMPROGRAMS\CardService\Uninstall.lnk"
  Delete "$SMPROGRAMS\CardService\Website.lnk"
  Delete "$DESKTOP\CardService.lnk"
  Delete "$SMPROGRAMS\CardService\CardService.lnk"
  ;Delete "$SMPROGRAMS.lnk"
  Delete "$STARTMENU.lnk" 

  RMDir "$SMPROGRAMS\CardService"
  RMDir "$INSTDIR"
  RMDir ""
  
  

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd