function! filescompl#complete (findstart,base)
    if a:findstart
        " column to begin searching from (first non-whitespace column):
        " vimscript doesn't have function for the index of the *last*
        " occurence of pattern
        let reverse_line = join(reverse(split(getline("."), '.\zs')), '')
        return len(reverse_line) - match(reverse_line, "[ \%xa0]")
    else
        " grep the file and build list of results:
        let path = "/usr/include/gtk-3.0/gtk/*.h" 
        let cmd = "grep -ohE '\\b" . a:base . "\\S*\\b' " . path
        let words = uniq(sort(systemlist(cmd)))
        call setqflist([])
        return words
    endif
endfunction
