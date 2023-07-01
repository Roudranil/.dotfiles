# TODO: packages

[https://github.com/akinsho/bufferline.nvim](bufferline)

         *treesitter-highlight-groups*
The capture names, with `@` included, are directly usable as highlight groups.
For many commonly used captures, the corresponding highlight groups are linked
to Nvim's standard |highlight-groups| by default but can be overridden in
colorschemes.

A fallback system is implemented, so that more specific groups fallback to
more generic ones. For instance, in a language that has separate doc comments,
`@comment.doc` could be used. If this group is not defined, the highlighting
for an ordinary `@comment` is used. This way, existing color schemes already
work out of the box, but it is possible to add more specific variants for
queries that make them available.

As an additional rule, capture highlights can always be specialized by
language, by appending the language name after an additional dot. For
instance, to highlight comments differently per language: >vim

    hi @comment.c guifg=Blue
    hi @comment.lua guifg=DarkBlue
    hi link @comment.doc.java String
<
The following captures are linked by default to standard |group-name|s:
>
    @text.literal      Comment
    @text.reference    Identifier
    @text.title        Title
    @text.uri          Underlined
    @text.underline    Underlined
    @text.todo         Todo

    @comment           Comment
    @punctuation       Delimiter

    @constant          Constant
    @constant.builtin  Special
    @constant.macro    Define
    @define            Define
    @macro             Macro
    @string            String
    @string.escape     SpecialChar
    @string.special    SpecialChar
    @character         Character
    @character.special SpecialChar
    @number            Number
    @boolean           Boolean
    @float             Float

    @function          Function
    @function.builtin  Special
    @function.macro    Macro
    @parameter         Identifier
    @method            Function
    @field             Identifier
    @property          Identifier
    @constructor       Special

    @conditional       Conditional
    @repeat            Repeat
    @label             Label
    @operator          Operator
    @keyword           Keyword
    @exception         Exception

    @variable          Identifier
    @type              Type
    @type.definition   Typedef
    @storageclass      StorageClass
    @structure         Structure
    @namespace         Identifier
    @include           Include
    @preproc           PreProc
    @debug             Debug
    @tag               Tag


some trials
