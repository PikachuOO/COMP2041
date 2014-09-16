

import sys
import re

for filename in sys.argv[1:]:
    with open(filename) as f:
        lines = f.readlines()
        with open(filename, 'w') as f:
            for line in lines:
                if not re.match("r'^\S...
