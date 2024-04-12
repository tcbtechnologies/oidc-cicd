.PHONY: upload

presentation.html: presentation.md
	npx @marp-team/marp-cli --html presentation.md

presentation.pdf: presentation.md
	npx @marp-team/marp-cli --html presentation.md --allow-local-files -o presentation.pdf

upload: presentation.html
	scp presentation.html ted@tcbtech.com:/home/mark/public_html/tcbtech.com/wp01/presentations/oidc-cicd/bsides.html
