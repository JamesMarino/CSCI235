for $p in distinct-values(//publisher)
return
<result>
	<publisher>{$p}</publisher>
	<count>{count(//book[publisher=$p])}</count>
</result>