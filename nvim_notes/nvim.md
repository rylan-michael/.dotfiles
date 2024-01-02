# NVIM

## TODO

- [ ] Document and integrate Quickfix into the workflow

## Docs Navigation

`C-]`   - jump to the tag's location
`C-0`   - will return to the tag

## Windows

Navigation
`C-w`       - window commands that obey motions

Management
`C-w s`     - split window horizontally
`C-w v`     - split window vertically
`C-w n`     - new window with empty file.
`C-w q`     - close window
`C-w o`     - make the current window the only one on the screen. All other windows are closed.
`:f {name}` - change buffer name

Reorganizing
`C-w J`     - move current window to be at very bottom.

Resizing
You can also resize by dragging status line using mouse.

`C-w =`         - make all windows equally high and wide
`C-w -`/`C-w +` - decrease/increase current window size by N. E.g., `C-w 15+` Increase current window height by 15.
`C-w <`/`C-w >` - decrease/increate current window width by N.

## Buffer

A buffer is the in-memory text of a file. A window is a viewport onto a buffer. It can be in one of three states:

- active: The buffer is displayed in a window. A file has been read into the buffer. The buffer may have been modified since then and different from the file.
- hidden: The buffer is not displayed. A file has been read into the buffer.
- inactive: The buffer is not displayed and doesn't contain anything.

`:new`      - new buffer
`:ls`       - list buffers

`:b {num}`  - switch to a specific buffer
`:bp`/`:bn` - switch previous/next buffer

`:bd`       - delete current buffer (prompt save)
`:bw`       - wipeout current buffer (no prompt)
`:bd {num}` - delete specific buffer

`:w`        - save current buffer
`:wa`       - save all buffers
`:w {path}` - save current buffer to specific file.

`:set filetype={filetype}`  - Specify the filetype of a buffer. Useful for enabling syntax highlighting in scratch buffers

When listing buffers, there will be Indicators
- `u`   an unlisted buffer
- `%`   the buffer in the current window
- `#`   the alternate buffer for `:e #`
- `a`   an active buffer: it is loaded an visible
- `h`   a hidden buffer: It is loaded, but currently not display in a window
- `=`   a readonly buffer
- `+`   a modified buffer
- `x`   a buffer with read errors

``
## Editing

`=` - auto-indentation if supported by treesitter configuration
`=ap`   - auto-indentation `ap` text object which specifies the range of lines to apply indentation, which in this case stands for a paragraph.

### Basics

`:help formatting`
`:ce`                       - Center-align line
`:ri`                       - Right-align line
`[range]ce[nter] [width]`   - Center lines in [range] between [width] columns
                              E.g., `5,9ce 40` centers lines 5-9 between cols 0-40

### Registers

Registers allow you to copy, cut, and paste text. They can store text and commands. There are numbered registers (0-9). There are also named registers (a-zA-Z). Specify lowercase letters to replace their previous contents or as uppercase letters to append to their previous contents. The unnamed register ("") contains the most recent text you've yanked or deleted. It's often used for immediate pasting. The black hole register ("_) is used to discard text. If you delete or yank text and specify this register, it's deleted without storage to register. There is also the last search pattern register (`"/`) that contains the most recent search-pattern and is used for `n`. You can write to it with `:let` but you can't yank or delete into this register. `"+` is the system clipboard register.

-   `:reg`  lists all registers and their content.

Examples

-   `"/p`   paste from search pattern register.
-   `"ayy`  yank the current line into the `"a` register.
-   `"+yy`  yank current line into clipboard register.
-   `"+p`   paste from clipboard register.

## File Exploration

### Netrw

`:Explore`  - Open's netrw file explorer
`:Hexplore` - Horizontal split & explore

Pressing `X` while the cursor is over an executable file will open a prompt asking for arguments.

`mf`        - mark files. For globbing and multi-file support use `:MF <glob>`. E.g., `:MF *.c`. Then there are a number of commands for operating on marked files/dirs.
