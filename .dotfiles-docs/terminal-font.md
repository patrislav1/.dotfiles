# [Using Powerline fonts in the Linux text console](https://phoikoi.io/2016/11/09/powerline-console.html)

## Install Powerline for text mode console

```bash
$ git clone https://github.com/powerline/fonts powerline-fonts
$ sudo cp -r powerline-fonts/Terminus/PSF/*.psf.gz /usr/share/consolefonts
$ sudo nano /etc/default/console-setup 
# CONFIGURATION FILE FOR SETUPCON
# Consult the console-setup(5) manual page.

ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"

VIDEOMODE=
FONT="ter-powerline-v16n.psf.gz"

$ diff -urN /bin/setupcon.orig /bin/setupcon
--- /bin/setupcon.orig 2020-07-29 08:57:20.792643590 +0200
+++ /bin/setupcon 2020-07-29 09:11:24.295472896 +0200
@@ -684,10 +684,11 @@
             fdec="${f%.gz}"
             RES=`findfile $fontdir $fdec`
         fi
-        FONTFILES="$FONTFILES $RES"
+        FONTFILES="$RES"
     done
 fi
 FONTFILES=`echo $FONTFILES` # remove extra spaces
+
 if [ -n "$FONTFACE" -a -z "$FONTFILES" ]; then
     case "$kernel" in
         linux)
```
