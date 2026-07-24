-- tpope/vim-abolish: case coercion + abbreviation/subversion.
-- Coerce a motion or visual selection to a case with `cr{key}`:
--   crc = camelCase, crm = MixedCase, cr_ = snake_case,
--   cru = UPPER_CASE, crk = kebab-case, crt = Title Case, cr. = dot.case
-- Examples: `crciw` (inner word -> camel), `cr_` on a visual selection -> snake.
return {
  { "tpope/vim-abolish", event = "VeryLazy" },
}
