"avoid source twice
if exists('b:did_ftplugin_load')
  finish
endif
let b:did_ftplugin_load = 1

:match Error /\s\+$/

let b:ale_linters = ['clangtidy', 'cpplint']
let b:ale_c_clangtidy_checks = ['*', '-fuchsia-*', '-llvm*', '-modernize-use-trailing-return-type' ]

let b:ale_fixers = ['clangtidy']
let b:ale_cpp_clangtidy_checks = ['*', '-fuchsia-*', '-llvm*', '-modernize-use-trailing-return-type' ]
