-- an implementation of vim-searchindex

A = {}

A.echohl_search_status = function ()
    local match = A.get_match_count()
    return string.format("%s[%d/%d]",
        vim.fn.getreg("/"),
        match.before,
        match.total
    )
end

A.get_match_count = function ()
    local win_view = vim.fn.winsaveview()
    vim.opt.foldenable = false -- folds affect the range of ex commands

    local in_line = A.match_in_line()
    local matches_before = (vim.fn.line(".") == 1) and 0
        or A.match_in_range('1,-1')
    local matches_total = matches_before + A.match_in_range(',$')

    vim.opt.foldenable = true
    vim.fn.winrestview(win_view)

    return {
        before = matches_before + in_line,
        total = matches_total
    }
end

A.match_in_line = function ()
    local line = vim.fn.line(".")
    local prev_search = vim.fn.getreg("/")
    local matches = vim.fn.str2nr(
        vim.fn.matchstr(
            -- search in range before (\%<.c) and on (\%.c) the current column
            -- nvim_exec2 prevents the command from printing to stdout, and captures the output
            vim.api.nvim_exec2(
                line.."s/\\(\\%<.c\\|\\%.c\\)"..prev_search.."/~/gen",
                { output = true })
            .output,
            "\\d\\+" -- one or more digits
        )
    )

    vim.fn.setreg("/", prev_search)
    return matches
end

A.match_in_range = function (range)
    local output = vim.api.nvim_exec2(range.."s//~/gen", { output = true })

    return vim.fn.str2nr(vim.fn.matchstr(output.output, "\\d\\+"))
end

return A
