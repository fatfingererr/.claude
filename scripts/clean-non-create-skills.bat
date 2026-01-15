@echo off
setlocal enabledelayedexpansion

:: Remove all skill directories that don't start with "create"

:: Change to .claude directory
cd .claude

set "SKILLS_DIR=.\skills"

if not exist "%SKILLS_DIR%" (
    echo Skills directory not found: %SKILLS_DIR%
    cd ..
    exit /b 1
)

echo Cleaning non-create skills from: %SKILLS_DIR%

:: Loop through all directories in skills/
for /d %%D in ("%SKILLS_DIR%\*") do (
    set "skill_name=%%~nxD"

    :: Check if starts with "create"
    set "prefix=!skill_name:~0,6!"
    if /i "!prefix!"=="create" (
        echo Keeping: !skill_name!
    ) else (
        echo Removing: !skill_name!
        rd /s /q "%%D"
    )
)

echo Done!

:: Change back to original directory
cd ..

endlocal
