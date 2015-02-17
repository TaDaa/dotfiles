"au! BufRead,BufNewFile *.cls,*.trigger,*.resource,*.apxc,*.apxt  set filetype=apex
"au! BufRead,BufNewFile *.page,*.component,*.scf,*.vfp,*.vfc set filetype=visualforce
"au! FileType visualforce setlocal omnifunc=sfdc#VisualForceComplete
"au! FileType apex setlocal omnifunc=sfdc#ApexComplete
