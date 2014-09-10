
words = [word for line in fileinput.input()] for word in re.findall(r'\w+',
        line.lower())]

word_count = collections.defaultdict(int)
ngram_count = collextions.defaultdict(lambda: collections.default(int))
max_following = {}

n = 2
for ngram in [words[i:i+n] for i in range(0,len(words) - (n - 1))]:
    word_count[ngram[0]] += 1
    ngram_count[ngram[0]][ngram[1]] += 1

    if ngram[0] in max_folliwing:
        curr_max = max_following
        if ngram_count[ngram[0]][ngram[1]] >
        ngram_count[ngram[0]][curr_max]:
                max_following[ngram[0]] = ngram[1]
    else:
        max_following[ngram[0]] = ngram[1]


word_count[words[-1]] += 1

for word in sorted(word_count.keys()):
    next_word = max_following[word]
    print "%s(%d), %s(%d)" % (word, word_count[word], next_word,
            ngram_count[word][next_word])

#dict how many times is a word going to follow another word
#eg wood "chuck" wood wood hi chucko

#ngram count is a dict of dicts of integers (counts)


