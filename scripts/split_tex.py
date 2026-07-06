import re
import os

tex_file = "reports/finstad_report.tex"
out_dir = "reports/sections"
os.makedirs(out_dir, exist_ok=True)

with open(tex_file, 'r', encoding='utf-8') as f:
    content = f.read()

# restore from backup if needed
if "01_introduction.tex" in content:
    with open("reports/finstad_report.tex.bak", 'r', encoding='utf-8') as f:
        content = f.read()

exec_summary_idx = content.find(r'\textbf{\Large Executive Summary}')
preamble_end = content.rfind(r'\newpage', 0, exec_summary_idx)

preamble = content[:preamble_end]
rest = content[preamble_end:]

sections = [
    ("00_executive_summary", r'\textbf{\Large Executive Summary}'),
    ("01_introduction", r'\section{Introduction}'),
    ("02_data_sources", r'\section{Data Sources}'),
    ("03_data_acquisition", r'\section{Data Acquisition}'),
    ("04_data_cleaning", r'\section{Data Cleaning}'),
    ("05_database_integration", r'\section{Database Integration}'),
    ("06_sql_investigation", r'\section{SQL-Based Financial Investigation}'),
    ("07_descriptive_statistics", r'\section{Descriptive Statistical Analysis}'),
    ("09_exploratory_analysis", r'\section{Exploratory Financial Analysis}'),
    ("10_investment_recommendation", r'\section{Investment Recommendation}'),
    ("11_executive_dashboard", r'\section{Executive Dashboard}'),
    ("12_conclusion", r'\section{Conclusion}'),
    ("99_references", r'\printbibliography')
]

indices = []
for sec_name, sec_str in sections:
    idx = rest.find(sec_str)
    if idx != -1:
        if sec_name == "00_executive_summary":
            idx = rest.rfind(r'\newpage', 0, idx)
        elif sec_name == "99_references":
            idx = rest.rfind(r'\newpage', 0, idx)
        indices.append((idx, sec_name))

indices.sort(key=lambda x: x[0])
end_idx = rest.find(r'\end{document}')
if rest.rfind(r'\appendix', 0, end_idx) != -1:
    end_idx = rest.rfind(r'\newpage', 0, rest.find(r'\appendix'))
indices.append((end_idx, "end_document"))

new_main = preamble

for i in range(len(indices)-1):
    start_idx, name = indices[i]
    next_idx, _ = indices[i+1]
    
    section_content = rest[start_idx:next_idx].strip() + "\n"
    
    with open(f"{out_dir}/{name}.tex", 'w', encoding='utf-8') as f:
        f.write(section_content)
        
    new_main += f"\\input{{sections/{name}.tex}}\n"
    
    if name == "07_descriptive_statistics":
        # inject missing section
        with open(f"{out_dir}/08_data_visualization.tex", 'w', encoding='utf-8') as f:
            f.write("\\section{Data Visualization}\n{} [Present at least EIGHT (8) professional-quality figures with interpretations.]\n")
        new_main += f"\\input{{sections/08_data_visualization.tex}}\n"

new_main += "\n" + rest[end_idx:]

new_main = new_main.replace(r'\graphicspath{{.}}', r'\graphicspath{{., figures/}}')

with open(tex_file, 'w', encoding='utf-8') as f:
    f.write(new_main)

print("Split completed successfully.")
