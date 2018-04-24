#!/usr/bin/env perl

$pdflatex                    = 'lualatex %O -synctex=1 -halt-on-error %S';
$bibtex                      = 'upbibtex %O %B';
$makeindex                   = 'mendex -U %O -o %D %S';
$max_repeat                  = 5;
$pdf_mode                    = 1; 

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -a /Applications/Skim.app";
