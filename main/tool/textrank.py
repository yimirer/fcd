import jieba.analyse


def textrank(text):
    a = jieba.analyse.textrank(text, topK=10, withWeight=False, allowPOS=('n','a', 'ad'))
    return a





