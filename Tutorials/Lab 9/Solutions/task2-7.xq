for $b in //book
where $b/publisher = //book[title="Maeve Ascendant"]/publisher and $b/title != "Maeve Ascendant"
return 
<book>
	{$b/title}
	{$b/publisher}
</book>