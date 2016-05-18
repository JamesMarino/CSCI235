for $b in //book
where count($b/author)>1
return 
<book>
	{$b/title}
	{$b/author}
</book>