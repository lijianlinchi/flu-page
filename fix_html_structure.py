#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
修复 index首页.html 文件结构
"""

with open('index首页.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. 提取head部分（第1-8行）
head_start = content.find('<!DOCTYPE html>')
head_end = content.find('<style>')
head_part = content[head_start:head_end]

# 2. 提取HTML内容（在style标签内的，第10-595行）
style_start = content.find('<style>')
# 找到第一个</script>之后的内容，那就是HTML内容
script_start = content.find('<script>', style_start)
html_content = content[style_start + 7:script_start].strip()

# 3. 提取JavaScript代码（第597-1479行）
script_end = content.find('</script>', script_start)
js_code = content[script_start:script_end + 9]

# 4. 提取CSS代码（在</html>之后的，第1482-2847行）
html_end = content.find('</html>')
css_start = content.find('    margin: 0;', html_end)
css_end = content.rfind('</style>')
css_code = content[css_start:css_end].strip()

# 5. 重新组装文件
new_content = head_part
new_content += '    <style>\n'
new_content += css_code + '\n'
new_content += '    </style>\n'
new_content += '</head>\n'
new_content += '<body>\n'
new_content += '    <div class="container">\n'
new_content += html_content + '\n'
new_content += '    </div>\n'
new_content += js_code + '\n'
new_content += '</body>\n'
new_content += '</html>\n'

# 6. 保存修复后的文件
with open('index首页.html', 'w', encoding='utf-8') as f:
    f.write(new_content)

print('文件结构修复完成！')

