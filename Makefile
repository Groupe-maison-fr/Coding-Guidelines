clean:
	rm -rf _site;

dev-watch: clean
	docker pull jekyll/jekyll:pages
	docker run -v `pwd`:/srv/jekyll -p 4000:4000 -p 35729:35729 jekyll/jekyll:pages jekyll server --livereload
