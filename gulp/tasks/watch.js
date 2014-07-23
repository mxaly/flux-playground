var gulp       = require('gulp');
var livereload = require('gulp-livereload');

gulp.task('watch', function() {
	var server = livereload();

	var reload = function(file) {
		server.changed(file.path);
	};

	gulp.watch('src/javascript/**', ['browserify']);
	gulp.watch('src/scss/**', ['sass']);
	gulp.watch('src/images/**', ['images']);
	gulp.watch(['build/**']).on('change', reload);
});
