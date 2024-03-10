@echo off

echo %~dp0

cd /d %~dp0

call npm run clean

call npm run build

call npm run deploy

git add *

git commit -m "auto push"

git push

pause

exit

