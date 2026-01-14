@echo off
setlocal enabledelayedexpansion

:: Sync skills from non-claude marketplace plugins to current directory

set "MARKETPLACES_DIR=%USERPROFILE%\.claude\plugins\marketplaces"
set "TARGET_BASE_DIR=.\skills"

:: Ensure base directory exists
if not exist "%TARGET_BASE_DIR%" mkdir "%TARGET_BASE_DIR%"

:: Loop through all directories in marketplaces
for /d %%D in ("%MARKETPLACES_DIR%\*") do (
    set "plugin_name=%%~nxD"

    :: Check if starts with "claude"
    set "prefix=!plugin_name:~0,6!"
    if /i "!prefix!"=="claude" (
        echo Skipping: !plugin_name! ^(claude prefix^)
    ) else (
        if exist "%%D\skills" (
            set "target_dir=%TARGET_BASE_DIR%\!plugin_name!"
            echo Copying skills from: !plugin_name! -^> !target_dir!
            if not exist "!target_dir!" mkdir "!target_dir!"
            xcopy "%%D\skills\*" "!target_dir!\" /E /I /Y >nul 2>&1
        )
    )
)

echo Done!
endlocal
