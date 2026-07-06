import os
import re

tex_file = "finstad_analysis.tex"
out_dir = "../reports/sections"

with open(tex_file, 'r', encoding='utf-8') as f:
    content = f.read()

# We look for \subsubsection{Appendix A1: SQL Question 1} up to the next \subsubsection or end of document
pattern = r'\\subsubsection\{Appendix A(\d+): (.*?)\}(.*?)(?=\\subsubsection\{|\\section\{|\\end\{document\})'
matches = re.finditer(pattern, content, re.DOTALL)

for m in matches:
    q_num = m.group(1)
    title = m.group(2)
    snippet = m.group(3).strip()
    
    # Write to a file
    out_path = os.path.join(out_dir, f"q{q_num}_snippet.tex")
    with open(out_path, 'w', encoding='utf-8') as out_f:
        # Wrap it in something? No, just the raw latex snippet is fine
        out_f.write(snippet)

print("Extracted snippets successfully.")
