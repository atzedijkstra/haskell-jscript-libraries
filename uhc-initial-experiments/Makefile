default:
	make js
	
js: JScript.mjs

%.mjs : %.hs
	uhc $< -tjscript --gen-trace=1

clean:
	find . -iname "*.hi" -o -iname "*.mjs" -o -iname "*.c" -o -iname "*.grin" -o -iname "*.core" | xargs rm
