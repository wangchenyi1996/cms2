<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main</title>
		<link rel="stylesheet" type="text/css" href="../style/admin.css"/>
		<script src="../js/admin_link.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body id="main">
		<div class="map">
			管理首页 &gt;&gt; 内容管理&gt;&gt; <strong id="title">{$title}</strong>
		</div>
		<ol>
			<li><a href="link.php?action=show" class="selected">友情链接列表</a></li>
			<li><a href="link.php?action=add">新增友情链接</a></li>
			{if $update}
				<li><a href="link.php?action=update&id={$id}">修改友情链接</a></li>
			{/if}
		</ol>
		
		{if $show}
		<table cellspacing="0">
			<tr><th>编号</th><th>网站名称</th><th>网站地址</th><th>网站logo地址</th><th>站长名称</th><th>类型</th><th>状态</th><th>操作</th></tr>
			{foreach $AllLink(key,value)}
			<tr>
				<td>{@value->id}</td>
				<td>{@value->webname}</td>
				<td title="{@value->fullweburl}">{@value->weburl}</td>
				<td title="{@value->fulllogourl}">{@value->logourl}</td>
				<td>{@value->user}</td>
				<td>{@value->type}</td>
				<td>{@value->state}</td>
				<td><a href="link.php?action=update&id={@value->id}">修改</a> | 
					<a href="link.php?action=delete&id={@value->id}" onclick="return confirm('你确定要删除吗')?true:false">删除</a></td>
			</tr>
			{/foreach}
		</table>
		<div id="page">{$page}</div>
		{/if}	
		
		{if $add}
		<form method="post" name="friendlink">
			<input type="hidden" name="state" value="1" />
			<table>
			<tr><dd>　　　类　　型：<input type="radio" name="type" checked="checked" value="1" onclick="link(1)"/> 文字链接
						<input type="radio" name="type" value="2" onclick="link(2)"/> logo链接
			</dd></tr>
			<tr><dd>　　　网站名称：<input type="text" class="text" name="webname" />　<span style="color: red;">[必填]</span>（*网站名称不大于20位）</dd></tr>
			<tr><dd>　　　网站地址：<input type="text" class="text" name="weburl" />　<span style="color: red;">[必填]</span>（*网站地址不得大于100位）</dd></tr>
			<tr><dd style="display: none;" id="logo">　　　logo地址：<input type="text" class="text" name="logourl" />　<span style="color: red;">[必填]</span>（*LOGO地址不得大于100位）</dd></tr>
			<tr><dd>　　　站长名称：<input type="text" class="text" name="user" /></dd></tr>
			<tr><dd>　　　　<input type="submit" class="submit" name="send" value="新增友情链接" onclick="return checkLink();"/></dd></tr>
			</table>	
		</form>
		{/if}
		
		{if $update}
		<form method="post" name="friendlink">
			<input type="hidden" name="id" value="{$id}" />
			<input type="hidden" name="state" value="{$state}" />
			<table>
			<tr><dd>　　　类　　型：<input type="radio" name="type" checked="checked" value="1" onclick="link(1)"/> 文字链接
						<input type="radio" name="type" value="2" onclick="link(2)"/> logo链接
			</dd></tr>
			<tr><dd>　　　网站名称：<input type="text" value="{$webname}" class="text" name="webname" />　<span style="color: red;">[必填]</span>（*网站名称不大于20位）</dd></tr>
			<tr><dd>　　　网站地址：<input type="text" value="{$weburl}"  class="text" name="weburl" />　<span style="color: red;">[必填]</span>（*网站地址不得大于100位）</dd></tr>
			<tr><dd style="display: none;" id="logo">　　　logo地址：<input type="text" class="text" name="logourl" value="{$logourl}"/>　<span style="color: red;">[必填]</span>（*LOGO地址不得大于100位）</dd></tr>
			<tr><dd>　　　站长名称：<input type="text" class="text" name="user" value="{$user}" /></dd></tr>
			<tr><dd>　　　　<input type="submit" class="submit" name="send" value="修改友情链接" onclick="return checkLink();"/></dd></tr>
			</table>	
		</form>	
		
		{/if}
		
	</body>
</html>