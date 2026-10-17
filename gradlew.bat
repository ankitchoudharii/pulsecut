@rem Gradle startup script for Windows
@if "%DEBUG%"=="" @echo off
where gradle >nul 2>nul
if %ERRORLEVEL% equ 0 (
    gradle %*
    exit /b %ERRORLEVEL%
)
java -classpath "%~dp0\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
