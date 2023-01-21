echo off
set arg1=%1
net use w: "https://int-web.vmm.be/ratten" %arg1% /user:INBO
w:
copy *.csv c:\Users\damiano_oldoni\Documents\GitHub\test-workflows\src
c:
net use w: /delete
