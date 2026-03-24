if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal iskeyword+='
setlocal commentstring=//\ %s
setlocal formatoptions-=t formatoptions+=croql

let b:undo_ftplugin = "setlocal iskeyword< commentstring< formatoptions<"
