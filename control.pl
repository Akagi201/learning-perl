#!/usr/bin/perl

# 表达式真假总结
# 表达式不一定是逻辑表达式, 但一定要得出真假值.
# 假值
# 逻辑值为假
# 值为0
# 字符串为空''
# 列表为空
# undef

# 其他情况为真值

# foreach $w(列表或数组){语句}
# ()内为数组@a, 或列表(1,2,3).
# $w可以是新变量, 也可以是已使用的变量. 在循环结束后变量值恢复.
# 每次循环把列表或数组中的值一次赋与$w, 直到列表为空. 可以不必关心数组长度.
# 如果在循环体中修改$w的值, 则相应的数组元素值也改变.
# 当列表中是常量时, $w的值不能修改.
# $w和@a可以相同, 如$a(@a).
# for和foreach可以互换, 通用.

# foreach的形式
# foreach $a(@a){} 一般形式.
# foreach $a(1,2,3,4){} 列表.
# foreach $k(keys%h){} 散列形式.
# foreach $a(@a[1,2,3]){} 只对数组的部分元素.
# foreach (@a){} 省略循环变量, 缺省为$_
# $_缺省变量. print; 为打印$_变量.
# grep, map函数相当于foreach对每个元素进行操作.

print "\$a的值在循环后恢复:\n";
$a = 1;
print $a;
foreach $a(2,3,4) {print $a;}
print $a;

print "\n改变循环变量的值引起数组元素值改变:";
@a=(1,2,3);
print @a;
foreach $c(@a) {$c=4 if $c==2;}
print @a;

print "\n可以循环访问数组的部分元素:";
@a=(1,2,3);
print @a;
foreach $c(@a[1,2]) {print $c;}

print "\n循环变量的缺省值是\$_:";
@a=(1,2,3);
foreach (@a) {print "$_";}

print "\nfor和foreach通用:";
foreach ($i=1; $i < 5; $i++) {print $i;}

<>;
print "使用标签:";
LABEL:for($i=1; $i<5; $i++) {
	for($j=1; $j<5; $j++) {
		print "$j";
		last LABEL if $i == 3;
	}
}
print "\$i=$i";

<>;
print "continue:";
$a=0;
while ($a++ < 10) {
	($f = 1, next) if $a == 5;
	print "$a ";
}

continue{
	(print (":$a in continue: "), $f = 0) if ($f == 1);
}

# 循环控制
# last: 退出循环
# next: 执行下一循环. 循环中Next下的语句本次不执行. 对于for要执行变量自增.
# redo: 重新执行本次循环, 对于for不执行变量自增. 在do语句中无效.
# goto: 跳转. 不能跳转到循环或子程序内, 不建议使用.

# 标记语句块
# 标记只能由字母和下划线组成, 一般为大写, 由:分隔后面的语句
# 标记定义: 定义在循环语句前或普通语句前(goto), 如: while, for
# 跳转到标记: last|next|redo|goto LABEL;
# 一般用到嵌套循环的内层跳到最外层时. 其中, last是退出最外层循环, 程序继续向下走, 不是跳转到最外层再执行.

#OUT:while(){
#	while (){
#		..last OUT;
#	}
#}

# continue语句
# continue{语句}
# 紧跟在循环语句后, 在循环体执行完, 下一次条件判断之前执行.
# 也可用于由{}标识的语句块之后.
# 从last跳出后不执行. 但next执行.

# 单行条件语句
# 语句在前, 条件在后. print $a if $a == 0; 但是先测试条件再执行语句.
# 同理:
# unless: print $a unless ($a == 0);
# while: print $a while ($a-- == 0);
# until: print $a until ($a-- == 0 );
# 注意循环语句不要丢失控制变量, 造成死循环.

# 用||, &&的条件语句:
# $a == 0 && print $a;
# open(F, 'file') || die "can't open";

# die函数: 在控制台标准错误输出信息后退出程序.
# warn: 输出信息后不退出程序, 只起警报作用.
# $!: 内部变量包含错误代码.
# $@: 内部变量包含错误信息.
