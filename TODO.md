# TODO

- [ ] Ensure that <C-s> saves the buffer in all modes. Currently when in `i`, I am forced to replay command.
- [ ] Create a configuration for quickly editing website files.
- [ ] Create a permanent solution for tracking the technical questions I have throughout the day. For now it will be appended to the bottom of this document.

- [ ] Create and save tmux layouts like an editor/terminal split.

## Notes

- Generate markdown `pandoc input.md -o output.html`.
- surround-replacements: "hello" `ysWfprint<CR>` -> print("hello")


## Technical Questions I have during the day

2023-12-31

- A directory is empty in my git-tracked project, and I want to use git to show me what files used to be in this now empty directory.
    - There's a file in `/nvim/.config/nvim/plugin` that was deleted in a commit. The folder remains in the project on my machine but no longer shows in GitHub. This is probably because git doesn't track empty folders. 
    - Git doesn't have per-file history either.
    - While there isn't first-class support for this feature we can get close. `git log --diff-filter=D --summary | grep /nvim/.config/nvim/plugin`.
    - `git log --diff-filter=D --oneline --compact-summary -- nvim/.config/nvim/after/plugin/` shows condensed but helpful information about file deletions for the provided path. The path is an argument and comes after the "end-of-options" delimiter `-- <path>`. Note that this wont work for directories that are empty.
    - Find the file you want to get from the output, and use the path to find the commits involved. `git log --all -- some/path/to/deleted.file`. You can then bring the file back by taking the sha of the parent commit of the deletion `git checkout <commit_sha>^ -- some/path/to/deleted.file`.
- I'm in the subfolder of a git repository and I want to know the relative path to the git root.
    - It isn't quite relative but we can run `git rev-parse --show-prefix`.
    - There's also `git rev-parse --show-toplevel` that will return the absolute path to the git root.

2024-01-01

- I'd like to select bulleted text and wrap only the sentence in backtics. E.g.,

    ```text
    - The duck may sit on the lake.
    - `The duck may sit on the lake.`
    ```

    - Visually select the desired text `v$` and then activate surround mode with `S (shift + s)`.
- `fd` outputs results in color and I'd like to preserve that when piping its output to `fzf`.
    - `fd --color=always | fzf --ansi` `--color=always` tells `fd` to always output colored results and `--ansi` tells `fzf` to expect and preserve ANSI color codes. Note that this has an impact to performance.
- Multi-line editing, placing `#` on multiple lines
    1. Enter VISUAL BLOCK mode `<C-v>`
    2. Select desired lines
    3. Press `I`, placing the editor into INSERT mode and press `#`to add the char to the first line.
    4. Press `Esc`, and it will insert a `#` character on all other selected lines. (Or use regex `: s/^/#`)
- When typing the command `ysiw` in vim it changes to `g@iw`, why?
    - Additionally, is it even correct to call `ysiw` a command when in normal mode? What's the terminology? (Yup, that's correct)
    - `g@` is the operator for calling a custom function defined by the vim-surround plugin.
- View pending/unsaved changes in the vim buffer.
    
