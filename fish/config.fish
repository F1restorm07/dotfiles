if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux CARGO_TARGET_DIR '~/.cargo/builds'

starship init fish | source
