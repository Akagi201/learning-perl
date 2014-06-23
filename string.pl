#!/usr/bin/perl

# 一般由双引号或单引号标识的一组字符组成.
#最少0个字符""为空串, 最多可以占满内存, 末尾不含null('\0')

# "" 双引号
## 变量替换

$var="str";
print "this is $var";

## z最长匹配
# $str, $string都存在时, 匹配$string.
# 要匹配$str时, 用${str}ing.
# sh中用$(ls)

$str="short";
$string="long";

print "match longest $string\n";
print "match longest ${str}ing\n";

# 转义字符
print "bell ring:\a\n";
print "back#\bspace\n";
print "copy\rabc\n";
print "abc\tdef\n";

# \的作用

# 转义字符

# 取消字符含义
# 取消$的变量标识
print "the \$var\n";
# 取消"
print "a quote \" in string\n";
# 取消\
print "a quote \\ in string\n";

# \nnn 八进制表示的ASCII码
print "\045";

# \xnn 十六进制表示的ASCII码
print "\x25";

# '单引号
# 不进行变量替换
print 'this is $var';
# 不进行转义
print 'this is $var\n';
# 字符串可以跨行
print 'this is first line
		this is second line';

# \的作用
# 字符串中含有单引号时
print 'A quote \' in a string';
# 字符串中含有\时
print 'A quote \\ in a string';

# 字符串的特殊表示
# qq(string in qq): 相当于"string in qq"
# q(string in q): 相当于'string in q'
# ()可以换位<>, {}, []等配对字符, qq{string in qq}
# 字符串中也可出现: qq[string [in] qq];
# 一般换为其他字符 qq[string <in> qq];
# 也可换为任意//, ;;, 等相同字符对, qq/string in qq/

$var=1;
print q(the $var\n);
print qq(is $var\n);
print qq<string "str" (var) in qq>;
