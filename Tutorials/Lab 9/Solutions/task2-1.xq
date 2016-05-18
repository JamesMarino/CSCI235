for $book in //book
let $y := $book/title
let $p := $book/price
order by $y ascending
return 
<book>
	{$book/title}
	{$book/price}
</book>