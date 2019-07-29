#!/usr/bin/env python
import re

filename = "hello.asm"

with open(filename) as f:
    content = [word for line in f for word in line.split()]

labels = []
print(content)

for word in content:
    label = re.search('.+:', word)
    if label != None:
        labels.append(label.string)

print(labels)
