# Presentation for 24Bsides Seattle 2024 

https://www.bsidesseattle.com/

# Presentation Detail

tHE presentation is formatted in plain markdown, with
[Marp](https://github.com/marp-team/marp-cli) being our tool of choice
for rendering output. See:

* https://marp.app/
* https://marpit.marp.app/
* https://github.com/marp-team/marp

# Operation

For updates from edits in realtime use marp in server:
```
npx @marp-team/marp-cli --html -s . 
```

When complete use in batch mode (vai makefile) to create
a static html and then use the browser:
```
make
open presentation.html

make presentation.pdf
open presentation.pdf

```

The `Makefile` contains the details to build the presentation
HTML. Then the HTML can be viewed in your favorite browser.
