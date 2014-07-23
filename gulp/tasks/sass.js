var gulp = require('gulp');
var compass = require('gulp-compass');
var minifyCSS = require('gulp-minify-css');

gulp.task('sass', function () {
  return gulp.src('./src/scss/app.scss')
    .pipe(compass({
      config_file: './config.rb',
      css: './build',
      sass: './src/scss',
      style: 'nested',
    }))
    .pipe(minifyCSS({processImport: true, keepBreaks: true}))
    .pipe(gulp.dest('./build'));
});

