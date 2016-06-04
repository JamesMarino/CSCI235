for $i in //book
	return

	if (count($i/authors/author) >= 2) then (

		<book>
			{$i/title}
			{$i/authors}
		</book>

	) else ()
