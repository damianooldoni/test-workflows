echo off
set arg1=%1
net use w: "https://int-web.vmm.be/ratten" %arg1% /user:INBO
w:
copy *.csv c:\
c:
net use w: /delete
