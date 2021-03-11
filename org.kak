# Bastardized org-mode

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.org %{
    set-option buffer filetype org
}

hook global WinSetOption filetype=org %{
    # add-highlighter window/org-d1 regex '^(\*{1})([^*\n]+(\n {1} [^\n]*)*)' 1:rgb:a63303+bi 2:rgb:f17440+bi
    # add-highlighter window/org-d2 regex '^(\*{2})([^*\n]+(\n {2} [^\n]*)*)' 1:rgb:a3a90a+b 2:rgb:e8eb5c+b
    # add-highlighter window/org-d3 regex '^(\*{3})([^*\n]+(\n {3} [^\n]*)*)' 1:rgb:49ab0f 2:rgb:8eef5c
    # add-highlighter window/org-d4 regex '^(\*{4})([^*\n]+(\n {4} [^\n]*)*)' 1:rgb:1dafaa 2:rgb:74f3ed
    # add-highlighter window/org-d5 regex '^(\*{5})([^*\n]+(\n {5} [^\n]*)*)' 1:rgb:3e29b2 2:rgb:8663f8
    # add-highlighter window/org-d6 regex '^(\*{6})([^*\n]+(\n {6} [^\n]*)*)' 1:rgb:a731b5 2:rgb:ed76f9


    # hook -always -once window WinSetOption filetype=.* %{
    #     remove-highlighter window/org-d1
    #     remove-highlighter window/org-d2
    #     remove-highlighter window/org-d3
    #     remove-highlighter window/org-d4
    #     remove-highlighter window/org-d5
    #     remove-highlighter window/org-d6
    # }

    add-highlighter window/org regions
    add-highlighter window/org/d1 region '^\*{1} ' '^(?=\*)' regex '\S' 0:rgb:f17440+bi
    add-highlighter window/org/d2 region '^\*{2} ' '^(?=\*)' regex '\S' 0:rgb:e8eb5c+b
    add-highlighter window/org/d3 region '^\*{3} ' '^(?=\*)' regex '\S' 0:rgb:8eef5c
    add-highlighter window/org/d4 region '^\*{4} ' '^(?=\*)' regex '\S' 0:rgb:74f3ed
    add-highlighter window/org/d5 region '^\*{5} ' '^(?=\*)' regex '\S' 0:rgb:8663f8
    add-highlighter window/org/d6 region '^\*{6} ' '^(?=\*)' regex '\S' 0:rgb:ed76f9

    hook -always -once window WinSetOption filetype=.* %{
        # remove-highlighter window/org
    }

    define-command -hidden org-indent %{
        execute-keys -draft %{<a-s>gh<a-k>[ *]<ret>yp}
    }
    map window normal '>' ':org-indent<ret>'

    define-command -hidden org-dedent %{
        execute-keys -draft %{<a-s>gh<a-k>[ *]<ret>d}
    }
    map window normal '<' ':org-dedent<ret>'

    map window insert '<s-left>' '<a-;>:org-dedent<ret>'
    map window insert '<s-right>' '<a-;>:org-indent<ret>'

    # TODO: Doesn't work when breaking in indention

    # # Match indentation on new lines
    define-command -hidden org-newline %{
        try %{
            execute-keys -draft %{i<ret><esc>kghWyjgh<a-P>r }
        }
    }
    map window insert '<ret>' '<a-;>:org-newline<ret>'

    define-command -hidden org-new-section %{
        execute-keys -draft %{i<ret><esc>kghWyjgh<a-P>r Hr*}
    }
    map window insert '<a-ret>' '<a-;>:org-new-section<ret>'

}
