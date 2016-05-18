for $book in //book
where $book/author/first = "James" and $book/author/last = "Bond"
return 
<book>
	{$book/title}
	{$book/publish_date}
</book>