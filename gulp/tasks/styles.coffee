gulp = require 'gulp'
config = require '../config'
sass = require('gulp-ruby-sass')
$ = (require 'gulp-load-plugins')()

# Compile and Automatically Prefix Stylesheets
gulp.task 'styles', () ->
    # For best performance, don't add Sass partials to `gulp.src`
    return gulp.src([
        config.path.scss + '*.scss'
    ])
        .pipe($.plumber())
        .pipe($.changed('styles', { extension: '.scss' }))
        .pipe(sass({
            style: 'expanded',
            precision: 10,
            sourcemap: false
        }))
        .on('error', console.error.bind(console))
        .pipe($.autoprefixer({ browsers: config.autoprefixer }))
        .pipe(gulp.dest(config.path.css))
        .pipe($.size({ title: 'styles' }))

