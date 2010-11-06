default:
	uhc JScript.js -tjscript --gen-trace=1
	
notrace:
	uhc JScript.js -tjscript

clean:
	find . -iname "*.hi" -o -iname "*.mjs" -o -iname "*.c" -o -iname "*.grin" -o -iname "*.core" | xargs rm
