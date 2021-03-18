-- symbols for autocomplete
--require('lspkind').init({
--    with_text = false,
--    symbol_map = {
--      Text = '  ',
--      Method = '  ',
--      Function = '  ',
--      Constructor = '  ',
--      Variable = '[]',
--      Class = '  ',
--      Interface = ' 蘒',
--      Module = '  ',
--      Property = '  ',
--      Unit = ' 塞 ',
--      Value = '  ',
--      Enum = ' 練',
--      Keyword = '  ',
--      Snippet = '  ',
--      Color = '',
--      File = '',
--      Folder = ' ﱮ ',
--      EnumMember = '  ',
--      Constant = '  ',
--      Struct = '  '
--   },
--})

require('lspkind').init({
   with_text = true,
   symbol_map = {
     Keyword = '',
     Variable = '',
     Text = '',
     Method = '',
     Function = 'ƒ',
     Constructor = '',
     Class = '',
     Interface = '',
     Module = '',
     Property = '',
     Unit = '',
     Value = '',
     Enum = '',
     Snippet = '',
     Color = '',
     File = '',
     Folder = '',
     EnumMember = '',
     Constant = '',
     Struct = 'פּ',
     Operator= 'Ψ',
     Reference= '渚',
     Field= '料',
     Event= '鬒',
     TypeParameter= '',
     Default= ''
   },
})