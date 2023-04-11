import docx

def docx_to_txt(n):
    # 打开文件
    path = './article-doc/'
    file = os.path.join(path, n)
    file = docx.opendocx(file)
    # 读取文本内容
    text = docx.getdocumenttext(file)
    # 打印输出到屏幕
    path = './article-txt/'
    n = n.replace('.docx', '.txt')
    with open(path + n, 'w') as item:
        for i in text:
            item.write(i+'\n')

import os
def change():
    path = './article-doc/'
    name = os.listdir(path)
    for i in name:
        docx_to_txt(i)

# 调用函数
change()

