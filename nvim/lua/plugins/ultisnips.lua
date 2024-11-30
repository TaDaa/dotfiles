return {{
  'SirVer/UltiSnips',
  config = function()
    vim.g.UltiSnipsExpandSnippetOrJump = "UltiSnips#ExpandSnippetOrJump"
    vim.g.UltiSnipsExpandTrigger="<c-h>"
    vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
    vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"
    vim.cmd.inoremap('/ <C-R>=SnippetsUltiSnips#ExpandOrJump()<CR>')
    vim.cmd.inoremap(', <C-R>=SnippetsUltiSnips#CommaSnip()<CR>')
  end
},{
  'TaDaa/snippets-ultisnips'
}}
