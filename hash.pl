#!/usr/bin/perl

# 关联数组, hash, 哈希, 散列
# 元素内容与位置相关.
# 元素内容-数组值, 位置由下标换成任意简单变量, 实现通过简单变量访问元素值.

# 原理: 分散存储.
# 分散方法, 通过一个函数(散列函数)把位置值简单变量转换成分散的值, 按值存储.

# 特点:
# 有的位置可能无值为空. 但也要留出空间. 浪费空间, 换取时间.
# 数组内容没有顺序.
# 对查找单个值, 比数组通过索引立即找到值慢, 多了函数计算, 但比链表块, 不用从头到尾查一遍.

# 关联数组的形式: %h=('a', 1, 'b', 2);
# 以%开头, 与$h是不同的变量. ()为空散列.
# 关联数组的下标称为关键字key, 由key得到的为值value.
# %h=('a'=>1, 'b'=>2); 键和值间的逗号可为=>, 相当于逗号. 这样表示比较清楚. 

# 元素形式: $hash{'a'}
# 元素为简单变量, 用$. Key为简单变量类型.
# $h{2.5}, ${-1}, $h{$k}

# 关联数组的赋值 - 跟数组是一样的.
# 标准
# %a = ("key1", 1, "key2", 2);
# 数组与散列间赋值: %h=@a, 散列也是数组.
# @a=%h # 数组元素的顺序随机
# %h1=%h2
# ($a, %h)=@array;
# %h=(%first, %second); # 浪费内存
# %h1=(%h2, 'k', 'v'); # 增加一组键值, 必须成对出现.
# 函数返回: %h=split();
# 片断: @keys=('a', 'b', 'c');
# @hash{@keys} = @hash{reverse(@keys)};
# @不能改为$, 因$hash{}中key要求是简单变量, @keys=3, 成了$hash{3};

# 元素的赋值与操作
# 增加. 赋值$h{'a'} = 1, 不存在则创建, hash不存在也创建.
# 删除: delete $h{$k}
# 不要用push, pop, shift, splice等与顺序有关的函数, 否则结果不可知.
# 显示: 不能print "%hash"; 原样打印.
# print %hash显示无空格.
# 用遍历的方法来逐一显示.
# 当$a=%h时, 显示的不是长度, 形如x/y. 表示散列长度为y, 已经有值的元素是x个.

%h=(a=>1, b=>3);
print "%h\n";
print %h;

$a=%h;
print "\n$a\n";

# 关联数组的复合结构
# 散列的数组

$aoh=[{'k11'=>'v11', 'k12'=>'v12'}, {'k21'=>'v21', 'k22'=>'v22'}];
# 访问元素: $aoh->[0]{'k11'}
# 访问整行: $h=$aoh->[0]; %hash=%h; 不能显示散列结构.
# @{[%$h]}把散列改为数组显示.
# 某键的全部名: map($_->{'k'}, @$aoh);
# 片断: @{$aoh->[0]}{('a', 'b')}形成一个两元素的数组.
# $hashref=$aoh->[0]; ($a, $b)=($hashref->{k1}, $hashref->{k2});
$hash=$aoh->[0];
print "@{[%$hash]}\n";

$hoh={
	k1=>{key1=>'value1', key2=>'value2'},
	k2=>{key1=>'val1', key2=>'val2'}
};
print "$hoh->{k1}{key1}\n";

# 散列的散列
$hoh={
	level1key1=>{level2key1=>'value1', level2key2=>'value2'},
	level1key1=>{level2key1=>'value1', level2key2=>'value2'}
}
# 访问元素: $hoh->{level1key1}{level2key1}
# 访问行: $hoh->{level1key1}是一个散列
# keys(%$hoh)只是第一级散列的关键字.

# 数组的散列
$hoa = {
	key1=>[$a1, $b1, $c1],
	key2=>[$a2, $b2, $c2]
}
# 访问元素: $hoa->{key1}[0];
# 访问行: $hoa->{key}是数组
# 不要对键进行引用, 否则在散列中还原为字符串.

# 关联数组操作函数

# keys(%h): 返回键列表
# values(%h): 返回值列表
# 返回的元素无顺序

# each(%h)循环
# ($key, $value)=each(%hash); # 取出键值对
# 不要先keys返回键, 再$hash($k)返回值, 效率不高.
# 循环中不要增加或删除元素, 因为散列是无序的, 最后返回undef.

# exists关键字是否存在: exists $h{'key'};

# undef(%h): 删除散列, 相当于%=();

# delete

# 关联数组的顺序
# foreach $word(keys(%list)) {
#	last if ($word == "second");
# }
# 循环次数可能1, 2, 3次.

# 如果要保持顺序, 用sort keys(%h); 按字符串排序, 如果按数字排序,
# 用sort{$a<=>$b} keys(%h);
# 或用Tie::lxHash模块.
# 从值找键: 1=>'first'. %hash=reverse %h

# 关联数组模拟数据结构
# 1. 链表
# 每项含内容和指向下一元素的指针, 头指针指向第一个元素.
%list=(
	"a","b",
	"b","c",
	"c","");
$header="a";

# 2. 结构
# struct{int i, int j}s;
# s.i = 1; 
# =>
%s=("i", "j", "");
$s{"i"} = 1;

# 3. 树
# 每项含一个值, 多个指针指向下一层
$root="parent";
%tree=(
	"parentleft", "child1",
	"parentright", "child2",
	"child1left", "grandchild1",
	"child1right", "grandchild2",
	"child2left", "grandchild3",
	"child2right", "grandchild4");
# left, right通过字符连接生成.

# 4. 二维表(database): 要含索引字段
# index f2 f3 ---> 字段名列表
# 1     a  b
# 2     x  y  ---> 值二维列表

# 建立字段名数组, 索引字段值数组为纵横二维的坐标.
# 二者字符连接为关键字, 值为二者交叉处的值.
# 读入每一行时, 按索引字段的值建立一个数组, 此行的每一个
# 值建立另一个数组, 放入以索引+字段名为key的散列中.
# 显示时按索引字段值+字段名找出值, 如下
# "1index", "1f2", "1f3"得出1, a, b.
# "2index", "2f2", "2f3"得出2, x, y.
