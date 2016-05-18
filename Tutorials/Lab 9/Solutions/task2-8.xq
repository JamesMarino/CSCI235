for $b in //book
let $y := count($b/author)
return 
<book>
	{$b/title}
	<count>{$y}</count>
</book>