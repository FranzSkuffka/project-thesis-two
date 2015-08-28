gulp  = require 'gulp'
shell = require 'gulp-shell'
del   = require 'del'

tasks = ['prepareAux','prepareBibtex', 'renderDoc','clean']
gulp.task 'default', ->
    gulp.start tasks
    gulp.watch '**/*.tex', tasks

gulp.task 'prepareBibtex', ['prepareAux'], ->
    gulp.src('')
        .pipe shell 'bibtex projektarbeit.aux'

gulp.task 'prepareAux', ->
    gulp.src('')
        .pipe shell 'arara projektarbeit.tex'
        .on 'error' , -> gulp.start 'renderDocVerbosely'
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
         "content/*.aux",
         '*.bib'
    ]
