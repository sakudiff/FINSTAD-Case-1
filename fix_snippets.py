import os
import glob
import re

for snippet in glob.glob("reports/sections/q*_snippet.tex"):
    with open(snippet, 'r') as f:
        content = f.read()
    
    # Remove \pandocbounded{\includegraphics...}
    content = re.sub(r'\\pandocbounded\{.*?\}', '', content, flags=re.DOTALL)
    
    with open(snippet, 'w') as f:
        f.write(content)

print("Snippets fixed.")
