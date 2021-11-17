#!/usr/bin/python3
import sys
args = eval(sys.argv[1])
def set_args(args):
    f1 = open('AXSoftVM01TBCfg.tcl','r+',encoding="utf-8")  # 以读写方式打开，可读可写
    lines = f1.readlines()
    #print(f1.tell()) # 4574 tell() 方法返回文件的当前位置，即文件指针当前位置。
    f1.seek(0) # seek() 方法用于移动文件读取指针到指定位置。
    lines_b = []
    for line in lines:
        if " " in line:
            for key in args.keys():
                strs = line.split(" ")
                if key == strs[1]:
                    strs[2] = args[key]
                    line = " ".join(strs)+"\n"
                    #f1.write(line + "\n") # 向文件中写入内容（data）,默认是utf-8
                    print(line)
                    break
            lines_b.append(line)
    print(lines_b)
    f1.writelines(lines_b) # 向文件中写入内容（data）,默认是utf-8
    f1.truncate()  # 用于截断文件，如果指定了可选参数 size，则表示截断文件为 size 个字符。 如果没有指定 size，则从当前位置起截断；截断之后 size 后面的所有字符被删除。
    f1.close()  # 关闭文件

# replace("10.12.1.157","111111")
set_args(args)
