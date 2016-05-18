for $b in //book
where $b/publisher = //book[title="Maeve Ascendant"]/publisher
return 
<book>
	{$b/title}
	{$b/publisher}
</book>