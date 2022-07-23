if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux CARGO_TARGET_DIR '~/.cargo/builds'
set -Ux XCURSOR_THEME 'oreo_nord_snow_1_cursors'

starship init fish | source
