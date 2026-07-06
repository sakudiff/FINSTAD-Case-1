import os
import glob
import re

tex_file = "finstad_analysis.tex"
out_dir = "../reports/sections"

with open(tex_file, 'r', encoding='utf-8') as f:
    content = f.read()

pattern = r'\\subsubsection\{Appendix A(\d+): (.*?)\}(.*?)(?=\\subsubsection\{|\\section\{|\\end\{document\})'
matches = re.finditer(pattern, content, re.DOTALL)

for m in matches:
    q_num = m.group(1)
    title = m.group(2)
    snippet = m.group(3).strip()
    
    # Correctly remove \pandocbounded{...} taking into account nested braces
    # Quarto graphics inclusion is typically exactly: \pandocbounded{\includegraphics[...]{...}}
    # A simple regex that matches \pandocbounded{...} up to the matching closing brace:
    # Actually, we can just remove \pandocbounded{\includegraphics[keepaspectratio]{...}}
    snippet = re.sub(r'\\pandocbounded\{\\includegraphics.*?\}\}', '', snippet)
    
    out_path = os.path.join(out_dir, f"q{q_num}_snippet.tex")
    with open(out_path, 'w', encoding='utf-8') as out_f:
        out_f.write(snippet)

print("Snippets regenerated and fixed.")
