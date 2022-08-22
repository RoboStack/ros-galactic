:: Generated by vinca http://github.com/RoboStack/vinca.
:: DO NOT EDIT!
setlocal

:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

set "SP_DIR_FORWARDSLASHES=%SP_DIR:\=/%"

colcon build ^
    --event-handlers console_cohesion+ ^
    --merge-install ^
    --install-base %LIBRARY_PREFIX% ^
    --cmake-args ^
     -G Ninja ^
     -DCMAKE_BUILD_TYPE=Release ^
     -DBUILD_TESTING=OFF ^
     -DPYTHON_INSTALL_DIR=%SP_DIR_FORWARDSLASHES% ^
     -DPYTHON_EXECUTABLE=%PYTHON%
if errorlevel 1 exit 1

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
)
