for $b in //book
where $b/keywords/keyword!="Java"
return 
<book>
	{$b/@id}
</book>