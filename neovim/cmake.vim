if exists('b:did_ftplugin_load')
    finish
endif

let b:did_ftplugin_load = 1

let b:ale_fixers = ['cmakeformat']
