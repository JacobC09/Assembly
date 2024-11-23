@echo off

if not exist main.asm (
    echo [Error] main.asm not found in the current directory.
    exit /b 1
)


echo [Assembling]

nasm -f win64 main.asm -o output.obj

if %errorlevel% neq 0 (
    echo [Error] NASM failed to assemble the file.
    exit /b %errorlevel%
)

echo [Linking]

gcc output.obj -o program.exe 

if %errorlevel% neq 0 (
    echo [Error] Linking failed.
    exit /b %errorlevel%
)

echo [Running]

program.exe

if %errorlevel% neq 0 (
    echo [Error] Program exited with error code %errorlevel%
    exit /b %errorlevel%`
)