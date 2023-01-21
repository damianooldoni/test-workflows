echo off
set arg1=%1
echo %arg1%
net use w: "https://int-web.vmm.be/ratten" %arg1% /user:INBO
w:
copy *.csv d:\a\test-workflows\test-workflows
d:
net use w: /delete
