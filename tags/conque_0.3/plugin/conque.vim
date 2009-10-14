" FILE:     plugin/conque.vim
" AUTHOR:   Nico Raffo <nicoraffo@gmail.com>
" MODIFIED: 2009-10-13
" VERSION:  0.3, for Vim 7.0
" LICENSE: {{{
" Conque - pty interaction in Vim
" Copyright (C) 2009 Nico Raffo 
"
" MIT License
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
" }}}

if exists('g:Loaded_Conque') || v:version < 700
  finish
endif

" Configuration globals {{{
""""""""""""""""""""""""""""""""""""""""""
" Use '...' filler characters while waiting for output
" Using the filler functionality will prevent commands from piling up while you wait, but it diverges from typical shell behavior
if !exists('g:Conque_Use_Filler')
    let g:Conque_Use_Filler  = 1
endif
" Default read timeout for running a command, in seconds.
" Decreasing this value will make Conque seem more responsive, but you will get more '...' read timeouts
if !exists('g:Conque_Read_Timeout')
    let g:Conque_Read_Timeout = 40
endif
" Default read timeout for tab completion
" Since tab completion is typically nearly instant, this value can be very, very small before timeouts occur
if !exists('g:Conque_Tab_Timeout')
    let g:Conque_Tab_Timeout = 3
endif
" Syntax for your buffer
if !exists('g:Conque_Syntax')
    let g:Conque_Syntax = 'conque'
endif
" Enable command folding
if !exists('g:Conque_Folding')
    let g:Conque_Folding = 0 
endif
""""""""""""""""""""""""""""""""""""""""""
" }}}

command! -nargs=+ -complete=shellcmd Conque call conque#open(<q-args>)
command! -nargs=+ -complete=shellcmd ConqueSplit call conque#open(<q-args>, ['split'])
command! -nargs=+ -complete=shellcmd ConqueVSplit call conque#open(<q-args>, ['vsplit'])

let g:Loaded_Conque = 1

" vim: foldmethod=marker
