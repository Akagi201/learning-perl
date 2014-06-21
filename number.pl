#!/usr/bin/perl

# 整数
# 12
# 12e2 (1200) e不分大小写
# -12
# 1_200_00
# 012 八进制
# 0x1f 十六进制, ABCDEF不区分大小写

# 浮点数
# 11.4
# -0.3
# .3
# 3.
# 5.4e2 e或E, +或-, 1到3位数字

$val=999_9999_9999_9999;
print "value is $val\n";

$val=1000_0000_0000_0000;
print "value is $val\n";

$val=9876_5432_1012_3451;
print "value is $val\n";

$val=2.23e999;
print "max float is $val\n";

$val=2.23e-999;
print "min float is $val\n";

$val=9.01e+21 + 0.01 -9.01e+21;
print "first value is $val\n";

$val=9.01e+21 - 9.01e+21 + 0.01;
print "second value is $val\n";
