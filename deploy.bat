@echo off

SET ROOT=%~d0%~p0%
SET BINARYDIR="%ROOT%build_output"
SET DEPLOYDIR="%ROOT%ReleaseBinaries"
SET SRC="%DIR%src"

IF EXIST %BINARYDIR% (
  rmdir /Q /S %BINARYDIR%
)
mkdir %BINARYDIR%

IF EXIST %DEPLOYDIR% (
  rmdir /Q /S %DEPLOYDIR%
)
mkdir %DEPLOYDIR%
mkdir %DEPLOYDIR%\plugins

%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe %SOURCEDIR%EditorEngine.sln  /property:OutDir=%BINARYDIR%\;Configuration=Release /target:rebuild

xcopy /I %BINARYDIR%\Castle.* %DEPLOYDIR%\
xcopy %BINARYDIR%\Mono.Cecil.dll %DEPLOYDIR%\
xcopy %BINARYDIR%\EditorClient.exe %DEPLOYDIR%\
xcopy %BINARYDIR%\EditorEngine.exe %DEPLOYDIR%\
xcopy %BINARYDIR%\EditorEngine.Core.dll %DEPLOYDIR%\
xcopy %BINARYDIR%\gedit.dll %DEPLOYDIR%\plugins\
xcopy %BINARYDIR%\vim.dll %DEPLOYDIR%\plugins\
xcopy %SRC%\Plugins\vim\vim.executable %DEPLOYDIR%\plugins\
xcopy %SRC%\Plugins\vim\vim.parameters %DEPLOYDIR%\plugins\
xcopy %BINARYDIR%\configured.dll %DEPLOYDIR%\plugins\
xcopy %SRC%\Plugins\configured\configured.editor %DEPLOYDIR%\plugins\