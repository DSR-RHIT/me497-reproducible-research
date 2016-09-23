
library(knitr)
# for some reason, include_graphics does not honor
# the knitr ../ option root-directpory option, thus each argument below
# starts with the file directory

# creates var-names for icons
text_icon <- include_graphics("../resources/images/text-icon.png")
code_icon <- include_graphics("../resources/images/code-icon.png")
knit_icon <- include_graphics("../resources/images/knit-icon.png")
knit_html <- include_graphics("../resources/images/knit-html.png")
knit_pdf  <- include_graphics("../resources/images/knit-pdf.png")
knit_word <- include_graphics("../resources/images/knit-word.png")
install_icon <- include_graphics("../resources/images/install-package.png")
