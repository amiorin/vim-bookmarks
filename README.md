## Introduction
This plugin change the behaviour of `` ` `` from.

```text
                                                'A '0 `A `0
           `{A-Z0-9}    To the mark {A-Z0-9} in the file where it was set (not
                        a motion command when in another file).  {not in Vi}
```

to

```text
                                                'A '0 `A `0
           `{A-Z0-9}    Edit the file containing the mark {A-Z0-9} if in another file
                        or
                        jump to the mark {A-Z0-9} in the file where it was set if
                        in the same file.
```

`` ' `` is remapped to `` ` ``.

## Explanation
I use marks to bookmark files that I use often and I don't care about the
position inside the file. Usually I prefer to keep the cursor in the last
position when I use the mark.

```text
`V .vimrc
`G .gvimrc
```

Using this plugin `` `V`` reopens the ``.vimrc`` with the cursor in the last
position and not in the position of the mark. If I also want to move the
cursor I can use again `` `V`` or use only time `` 'V``.

## How to start to use marks
I think most vimmers don't use marks, because they are difficult to use.

I use [vim-signature][1] to make marks user-friendly and this ``autocmd``:

```vim
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
```

## Self-Promotion
Like this plugin?
* Star the repository on [GitHub](https://github.com/amiorin/vim-fenced-code-blocks)
* Follow me on
  * [Twitter](http://twitter.com/amiorin)
  * [GitHub](https://github.com/amiorin)
  * [Blog](http://albertomiorin.com)

[1]: https://github.com/kshenoy/vim-signature
