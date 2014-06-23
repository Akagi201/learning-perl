#!/usr/bin/perl

# 未创建时状态为undef, 到达文件尾也为undef
# 说明变量为未定义: undef $a;
# 用在条件判断中: if(undef $a)
# 代替不关心的变量: $s="a:b:c:d";($a1, undef, undef, $d1)=split(/:/,$s);
# 如果有undef变量又不知在哪, 可加-w参数进行提示.
# #!/usr/bin/perl -w

# 创建后状态为defined, 一般用在条件判断中 if(defined $a)
# 整数初值为-, 字符串初值为空串"".
# $result = $undefined + 2;

$r=$und+2;
print $r;
