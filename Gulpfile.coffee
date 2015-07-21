gulp  = require 'gulp'
shell = require 'gulp-shell'
del   = require 'del'

gulp.task 'default', ->
    gulp.start ['prepareBibtex', 'renderDoc','clean']
    gulp.watch '*.tex', ['prepareBibtex', 'renderDoc','clean']

gulp.task 'prepareBibtex', ->
    gulp.src('')
        .pipe shell 'bibtex projektarbeit.aux'

gulp.task 'renderDoc', ['prepareBibtex'], ->
    gulp.src('')
        .pipe shell 'arara projektarbeit.tex'
        .on 'error' , -> gulp.start 'renderDocVerbosely'

gulp.task 'renderDocVerbosely', ->
    gulp.src ''
        .pipe shell 'arara projektarbeit.tex -v'
        .on 'error' , -> gulp.start 'clean'
gulp.task 'clean', ['renderDoc'], ->
    del [
         '*.blg',
         '*.out',
         '*.log',
         '*.toc',
         '*.bbl',
         "*.aux",
         '*.bib'
    ]
