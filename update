#!/usr/bin/env python

import os
from urllib import parse

HEADER = """# 
# 알고리즘 문제 풀이 목록
"""

def main():
    with open("README.md", "w") as fd:
        fd.write(HEADER)

        for root, _, files in os.walk(".", topdown=True):
            files.sort()
            category = os.path.basename(root)
            parent_directory = os.path.basename(os.path.dirname(root))

            if parent_directory in (".git", ".github", "images"):
                continue

            fd.write(f"### 🚀 {category}\n")
            fd.write("| 문제번호 | 링크 |\n")
            fd.write("| ----- | ----- |\n")

            for file in files:
                link = parse.quote(os.path.join(root, file))
                fd.write(f"|{category}|[링크]({link})|\n")

if __name__ == "__main__":
    main()
  
