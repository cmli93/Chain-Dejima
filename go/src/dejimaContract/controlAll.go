对任何一个user而言，（以下操作全由Go完成）
    1. 操作本地数据更新(update source and use get to generate view)

	  2. Send transaction to contract
		(contract 中设一个bool的tag，即为grantPermission，
			用于标记contract是否授予权限给通过Go发起的一次交互。)
	     contract首先验证sender的身份，检查身份是当前contract中记录的共享的peer，再检查是可以对某一
           Attribute进行存取（我们系统的亮点），若两次检查都通过，则将grantPermission置true，（返回给contract
           的caller，这点那不一定可能实现，contract是自封闭的，所以通过查看contract中的grantPermission变量值判断是否授权），
           总控Go可以通过判断从contract返回的grantPermission的值为true或者false决定是否同意user的
           此次对sharedtable的update，
           同时发起一个transaction通知other sharing peers，或者其他的sharing peers查看grantPermission的值发现共享数据的更改
