for $b in //book

where count($b/keywords/keyword) >= 3
	return

<book>
	{$b/title}
	{$b/issue}
</book>
