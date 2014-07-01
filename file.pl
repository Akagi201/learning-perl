#!/usr/bin/perl

# 文件句柄与文件描述符
# 文件句柄 => 文件描述符: fileno(F); 返回文件描述符.
# 文件描述符 => 文件句柄: open(F, ">&n);

# open(HANDLE, ">filename")||die $!; 成功返回非零, 失败返回0.
# die($errorstr); 向STDERR输出指示错误信息的串, 然后退出程序.
# warn($errstr); 向STDERR输出信息, 不退出程序.
# $!最后一次错误的信息, 与dir, warn结合使用.
# HANDLE: 文件句柄, 文件变量. 用来代表操作的文件. 以字母开头, 字母, 数字, 下划线组成, 不以$, @, %类的符号开头,
# 可能与关键字if等重名, 故一般用大写字母.

# 缺省打开的句柄STDIN, STDOUT, STDERR, 文件描述符为0, 1, 2. 不用调用open就可以直接访问.

# 访问模式, 在第二个参数前的位置
# 只读: <或省略, 文件不存在则打开失败
# 只写: >, 文件不存在则创建
# 追加: >>, 文件不存在则创建
# 读写: +<
# 读写: +>
# 读写: +>>
# 管道: |

# 文件名
# 复制文件句柄: open(F, ">STDOUT); 写入F文件的内容都变成写入屏幕STDOUT.
# 使用文件描述符: open(F, ">&3); 把文件描述符复制成句柄. 或者">&=3"
# open()打开成功返回非0, 失败返回0.

# open() || die "error $!"; 成功时不执行die, 失败时执行.
# die($errstr); 向STDERR输出只是错误信息的串, 然后退出程序.
# warn($errstr); 想STDERR输出信息, 不退出程序.
# $!最后一次错误的信息. 与die, warn结合使用.

# die($str)中最后不是\n时, 输出自动添加at程序名line行号.
# 如die("can't open"); 输出can't open at myprog line 13.
# 加上\n如: die("can't open\n"); 时没有添加的信息.

# 文件缓冲
# close(F); 最后要关闭文件. 隐含关闭文件, 重打开已打开的, 先关闭再打开, 程序退出自动关闭, 真正写文件.
# 文件缓冲: 通常为带缓冲的文件写. 写文件时, 系统先写到称为文件缓冲区的内存中, 缓冲满再真正写入磁盘. 
# 一般在关闭时缓冲内容才开始写入磁盘. 称为刷新. 结果是用tail -f是看不到不断地输出内容的.

# 无文件缓冲: 每次写都真正写入磁盘中, 不经过内存, 频繁写入可能影响性能.

# 设置$|变量决定是否有文件缓冲, $|=1无缓冲. 但只对当前输出文件有效. 如STDOUT. 设置另外的文件要先用select(F).
# select(F)设置当前文件, 返回原文件句柄. 设置完再select(OLD)返回原文件.

#         缓冲 无缓冲
# 打开   open, sysopen   sysopen
# 关闭   close
# 读     <>, readline    sysread
# 写     print           syswrite
# 定位   tell, seek       sysseek

# 间接文件变量: 用简单变量表示文件变量, 代表文件变量名.
# $a="F"; open($a, "mode", "path");

# sysopen(H, name, m|o|d|e, priv);

# 文件句柄, 文件名, 读写模式, 权限, 权限类似0755的数字, 模式有:
# O_RDONLY, O_WRONLY, O_RDWR, O_CREAT, O_EXCL(文件存在则失败), O_APPEND, O_TRUNC, O_NONBLOCK
# O_SHLOCK, O_EXLOCK, O_BINARY, O_NOCTTY, O_SYNC


#$fh=IO::File->new(">$f");
#new($f, O_WRONLY);
#new($f, "r+");

#<   RDONLY                  "r"
#>   WRONLY | TRUNC | CREAT  "w"
#>>  WRONLY | APPEND | CREAT "a"
#+<  RDWR                    "r+"
#+>  RDWR | TRUNC | CREAT    "w+"
#+>> RDWR | APPEND | CREAT   "a+"

# 读文件
# $line=<file> 读一行到line, 指针后移一行. 缺省读到$_中.
# $/='\n', 为行分隔符, 遇到它则为一行结束, 行包含$/.
# 可用chomp($s); 去除此标志, 行尾不含$/则不去除字符.
# 可设置$/为其他字符串, 遇到$/为行结束, chomp去除此字符串.

# @array=<file>文件内容全部读出, 每行为一个元素, 含回车.
# 当从STDIN中读时, 可省略为<>. 原理见后.
# read(F, $in, len[,$offset]); 读入$in
# sysread(F, $in, len[,$offset]);
# getc(F); 读一个字符

# @ARGV: 全局, $ARGV[0]是第一个参数, 不是程序名.
# <>是对$ARGV的引用, @ARGV一旦赋值, 原值丢失.
# 1. 第一次看到<>是, 打开以$ARGV[0]中的文件. 无参数则打开STDIN读, 所以可以省略.
# 2. shift(@ARGV), 元素数量减少一个.
# 3. <>读打开的文件中的所有行.
# 4. 再读第二个参数表示的文件.

# 文件尾检测: eof和eof(). 文件结束返回真.
# @ARGV=("file1", "file2");
# while ($line=<>){if(eof){print 'eof';}}
# 读取file1到末尾时, 下一循环打开下一文件. 每次读完一个文件输出eof.
# if(eof()){print 'eof';} 所有文件都读完才输出eof.

# print F ("str");
# F文件句柄, 后面为空格, 省略F为STDOUT.
# str输出内容, 可用单引号', 不进行变量替换, 不加引号, 计算出变量的值再输出.
# ()可省略, 这是函数的特点.
# printf("format str", $a, $b...); 同C语言中的printf, 格式化串包含%m.nf的
# 格式指示, 后面一次是相应的值列表.
# write用于格式化输出. 不是read的相应操作.
# syswrite(F, $data, length, $offset);同sysread.

open (F, "+<t.txt") or die $@;
$a=<F>;
print "line 1=$a";
# print tell(F);
# print f "a".$/;
# seek(F, 3, 0);
# $a = <F>;
# print "line 2 = $a";
print F "a".$/;
close(F);

# +< 读两行后末尾追加读出内容及新值. 或一行也不读或定位则在首位, 原位覆盖.
# +> 文件内容先清除.
# +>> 追加, 读写指针在末尾. 读不出. 定位后可读出, 但写都在末尾.


























