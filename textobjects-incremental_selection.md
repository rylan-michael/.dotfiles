## Incremental Selection

Intelligently select code segments in a single key press. This feature leverages TreeSitter to make context-aware selections that make it easier to work within functions, classes, and other code structures.

- `grn` inital node selection and then retype to continuously increment the scope.
- `grm` decrement the node selection scope and retype to continuously decrement to scope. 
- `grc` select the scope

## Textobjects

Example Scenarios:

- **Deleting around a function** you can use the keymap `daf` to delete around a function.

### Selection

Selecting and manipulating code regions efficiently.

- `aa` Selects the outer parameter of a function.
- `ia` Selects the inner parameter of a function.
- `af` Selects the outer region of a function.
- `if` Selects the inner region of a function.
- `ac` Selects the outer region of a class.
- `ic` Selects the inner region of a class.

### Movement

Jumps in the jumplist are automatically set when you use textobject movement.

- `]m` Go to the next start of a function.
- `]]` Go to the next start of a class.
- `]M` Go to the next end of a function.
- `][` Go to the next end of a class.
- `[m` Go to the previous start of a function.
- `[[` Go to the previous start of a class.
- `[M` Go to the previous end of a function.
- `[]` Go to the previous end of a class.
