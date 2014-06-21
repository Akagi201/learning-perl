#!/usr/bin/perl

# 4种变量(用不同特殊符号开头)
# scalar: $ 纯变量, 标量(简单变量)
# 数组: @
# hash: %
# 文件: 大写

$_a="undercore";
print "var is $_a\n";

# 区分大小写
$Var="upcase";
$var="lowercase";

print "var is $var\n";

# 没有关键字, 但是不要和内置变量重复

$if="key";
print "key var is $if\n";
