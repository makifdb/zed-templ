; From https://github.com/zed-industries/zed/blob/49c53bc0ec85c38f579efbbcda9a1a84fb54e51f/extensions/html/languages/html/indents.scm
 
(tag_start ">" @end) @indent
(self_closing_tag "/>" @end) @indent

(element
  (tag_start) @start
  (tag_end)? @end) @indent
