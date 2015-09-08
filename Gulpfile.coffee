gulp  = require 'gulp'
shell = require 'gulp-shell'
del   = require 'del'

tasks = ['preRender','prepareMeta','render','clean']
gulp.task 'default', ->
    gulp.start ['preRender']
    gulp.watch '**/*.tex', tasks

gulp.task 'prepareMeta', ['preRender'], ->
    gulp.src('')
        .pipe shell 'bibtex projektarbeit.aux'
        .pipe shell 'makeglossaries projektarbeit'
        .on 'error' , -> gulp.start 'render'


gulp.task 'preRender', ->
    gulp.src('')
        .pipe shell 'xelatex projektarbeit.tex'
        .on 'error' , -> gulp.start 'prepareMeta'

gulp.task 'render', ['prepareMeta'], ->
    gulp.src('')
        .pipe shell 'echo | xelatex projektarbeit.tex'
        .on 'error' , -> gulp.start 'clean'

gulp.task 'clean', ['render'], ->
    del [
         '*.blg',
         '*.out',
         '*.log',
         '*.toc',
         '*.bbl',
         "*.aux",
         "content/*.aux",
         '*.bib'
	 '*.acr'
    ]
     projektarbeit.acn
