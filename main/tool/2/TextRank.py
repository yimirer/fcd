import os

import jieba.analyse

def dele(path):
    text = ''
    with open(path, 'r') as item:
        for i in item:
            text += i.strip()
    return text

def key(n):
    path1 = './key-words/'
    path2 = './article-txt/'
    path3 = n
    path = os.path.join(path1, path3)
    path4 = os.path.join(path2, path3)
    path = path.replace('.txt', '')
    if not os.path.exists(path):
        os.makedirs(path)
    text = dele(path4)
    k = '名词.txt'
    pathm = os.path.join(path, k)
    a = jieba.analyse.textrank(text, topK=10, withWeight=False, allowPOS=('n'))
    with open(pathm, 'w', encoding="utf-8") as item2:
        for i in a:
            item2.write(i + '\n')
    k = '形容词.txt'
    pathm = os.path.join(path, k)
    a = jieba.analyse.textrank(text, topK=10, withWeight=False, allowPOS=('a', 'ad'))
    with open(pathm, 'w', encoding="utf-8") as item2:
        for i in a:
            item2.write(i + '\n')
    k = '动词.txt'
    pathm = os.path.join(path, k)
    a = jieba.analyse.textrank(text, topK=10, withWeight=False, allowPOS=('v'))
    with open(pathm, 'w', encoding="utf-8") as item2:
        for i in a:
            item2.write(i + '\n')




name = os.listdir('./article-txt/')
for i in name:
    key(i)



