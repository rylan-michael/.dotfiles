# TODO

- [ ] Ensure that <C-s> saves the buffer in all modes. Currently when in `i`, I am forced to replay command.
- [ ] Create a configuration for quickly editing website files.
- [ ] Create a permanent solution for tracking the technical questions I have throughout the day. For now it will be appended to the bottom of this document.

- [ ] Create and save tmux layouts like an editor/terminal split.

- [ ] Document Hapoon key mappings.
- [ ] Remap `:NvimTreeFocus` (open tree if closed, and focus), `:NvimTreeToggle`
- [ ] Figure out how `<Leader>fg` functions with grep and rg and verify functionality. Any kind of project searching going on?

- [ ] Understand `telescope.builtin.lsp_document_symbol` and `<C-l>` to show autompletion menu? Lists LSP document symbols in the current buffer.
- [ ] Set wrap automatically for markdown files. (`:set wrap!`)
- [ ] Figure difference between `git clone --bare` vs `git clone --mirror` and the doucmentation on hosting repo in multiple places?
- [ ] Git worktree?
- [ ] Document wrapping multiline code block in brackets (`{}`)
- [ ] Finalize LSP keymaps because they won't set unless explicit. Things like `gr` and `ds` don't work. `gr` is also supposed to look for function references w/ fzf & telescope which sounds awesome but don't know whether that is an OOTB feature.


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

- `apt` is intended for interactive use and subject to change. For scripts it's recommended to use `apt-get` or `dpkg`.
- ZSH has the concept of named directories so instead of just `~` you could also create `~work ~dev ~down ~cloud ~sync` named directories.
- `chsh` changes login shell which is a command-line interpreter (CLI) that is auto-started when the user logs in.
- List available shells with `cat /etc/shells`.
- `ls -l /bin`

    `lrwxrwxrwx 1 root root 7 Dev 11 02:04 /bin -> /usr/bin`

    - unified binaries directory is common for modern linux. Single dir for essential and non-essential user binaries.
    - `l` signifies `/bin` is a symbolic link
    - since `/bin` is linked to `/usr/bin`, any command run from `/bin` is actually being run from `/usr/bin`
- `%` to jump to matching pairs
- `f` to jump to character in the line and `;` to repeat
- `:mks ! session.vim` `!` is the overwrite symbol. Then to load a session `vim -S session.vim`
- `:vnew` `:new` buffers

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
    
2024-01-02

- How do you find conflicting keymaps in neovim? I want to see all conflicts and not just when I know there's an issue.
    - Doesn't seem like there's first-party support for that. However, if there's an issue you suspect run `:verbose map <key>`
- How do you perform regex search through commit messages?
    - `git log --grep="<pattern>"`

2024-01-04

- What happens when you have a directory full of lua files that each only return a table and you import that module into a variable?
    - First, a module is typically a single file and a package is a collection of modules.
    - Second, a module is some code that creates and returns a table. "Everything that the module exports, such as functions or constants, it defines inside this table, which works as a kind of namespace."

2024-01-09

Coolest replace patterns. So there is a list of items

- *aaa*: some description
- *aa*: some description
- *bb*: some description

And what I want to do is transform each keymap from `*aa*:` to `` `aa` ``. So I use the replace pattern

`` %s/\*\v(..|...)\*/`\1` ``

- `%s` starts a find and replace on the entire file
- `\v` enables very magic mode, which simplifies regex
- `(..|...)` capture group with regex pattern that matches any 2-3 characters
- `\1` is the replacement string. Uses the capture group.

2024-01-10

- I want to see a list (blame?) of changes made in a file with Git

2024-10-11

- I'm using 1password SSH agent to authenticate with my work's gitlab instance but I'm getting an error stating "Too many authentication failures". Why does this happen, what's this 6 key limit, how does ssh-agent work, and how can you address this? What are my misconceptions because I would just assume 1password would match the public key and try to authenticate. Why does the ssh-agent take a dump approach to this?
    - https://developer.1password.com/docs/ssh/agent/advanced/#ssh-server-six-key-limit
