# LazyVim workflow cheatsheet

Leader = `<space>`. `<C-x>` = hold Ctrl, press x. `<leader>gh` etc. below are two
separate keystrokes (leader, release, then the rest), not a chord.

## Files / buffers

| Key | Action |
| --- | --- |
| `<leader><space>` / `<leader>ff` | Find files |
| `<leader>fg` | Find files (git-tracked only) |
| `<leader>fb` | Switch buffers (picker) |
| `<leader>,` | Recent buffers (picker) |
| `<leader>e` | Toggle file tree |
| `[b` / `]b` or `<S-h>` / `<S-l>` | Prev / next buffer (tab) |
| `<leader>bj` | Pick buffer by letter |
| `<leader>bp` | Pin buffer |
| `<leader>fr` | Reopen a recently closed/opened file (picker) |
| `<leader>bd` | Close current buffer (window stays open) |
| `<leader>bo` | Close all *other* buffers |
| `<C-w>q` | Close the window/split itself |

Tab bar (bufferline) is always visible now, even with one file open.

## Search

| Key | Scope |
| --- | --- |
| `/pattern<CR>`, `n`/`N` | Plain search, current file, no picker |
| `*` / `#` | Search word under cursor, fwd / back |
| `<leader>sb` | Fuzzy search **current file only** |
| `<leader>/` or `<leader>sg` | Grep **whole project** |
| `<leader>sB` | Grep across open buffers |

## LSP navigation (tracing code)

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Find references (all call sites) |
| `gI` | Go to implementation |
| `K` | Hover docs / type info |
| `<C-o>` / `<C-i>` | Jump back / forward through jump history |
| `<leader>ss` | Symbols in current file (outline) |
| `<leader>cs` / `<leader>ws` | Symbol search: file / workspace |

## Window navigation

| Key | Action |
| --- | --- |
| `<C-w>h/j/k/l` | Move focus left/down/up/right |
| `<C-h>/<C-j>/<C-k>/<C-l>` | Same, one keystroke (try these first) |
| `<C-w>w` | Cycle to next window |
| `<C-w>p` | Jump to previously-focused window |

## Diffview (branch diff, PR-style)

| Key | Action |
| --- | --- |
| `<leader>gd` | Open diff vs merge target (`master...HEAD`, three-dot = committed only) |
| `<leader>gD` | Close diff view |
| `<leader>dh` | File history — current file |
| `<leader>dH` | File history — whole repo |

Inside the file panel (left column):
- `<CR>` / `o` / `l` — open diff for the selected file (must have focus in the panel — `<C-w>h` to get there)
- `gf` — open the file directly in a split, skip the diff wrapper
- `<Tab>` / `<S-Tab>` — next / prev file
- `]c` / `[c` — next / prev hunk once a diff is open

## Git (everything else: add/commit/push)

| Key | Action |
| --- | --- |
| `<leader>gg` | Open lazygit (full TUI: stage `a`/`<space>`, commit `c`, push `P`, pull `p`) |
| `<leader>gG` | Lazygit at cwd instead of git root |
| `<leader>gh` (prefix) | Hunk ops: `ghs` stage, `ghr` reset, `ghp` preview, `ghd` diffthis, `ghb` blame line |
| `<leader>gb` | Git blame line (picker) |
| `<leader>gf` | Git log for current file (picker) — not diffview, that's `<leader>dh` |
| `<leader>gl` | Git log |

## Colorscheme

`ace-palenight` — custom port of the VS Code "Ace Palenight" theme, lives at
`~/.config/nvim/colors/ace-palenight.lua`. Set as default in
`lua/plugins/colorscheme.lua`.
