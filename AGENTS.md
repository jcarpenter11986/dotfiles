# Repository guidance

- Keep `link.sh` safe to run repeatedly.
- Never overwrite an existing user file or unrelated configuration.
- Shell dependencies should be installed automatically by `link.sh`.
- Validate changes with `bash -n link.sh`, `zsh -n zshrc`, and `git diff --check`.
- Preserve existing uncommitted changes.
