for $p in distinct-values(//publisher)
where count(//book[publisher=$p]) > 1
return
<result>
	<publisher>{$p}</publisher>
	<count>{count(//book[publisher=$p])}</count>
</result>