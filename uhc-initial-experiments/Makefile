default:
	uhc Main.js -tjscript --no-recomp
	
trace:
	uhc Main.js -tjscript --gen-trace=1 --no-recomp

clean:
	find . -iname "*.hi" -o -iname "*.mjs" -o -iname "*.c" -o -iname "*.grin" -o -iname "*.core" -o -iname "Main.js" | xargs rm
