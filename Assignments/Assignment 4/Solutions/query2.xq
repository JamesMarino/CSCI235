for $t in distinct-values(//journal/title)
	return

<journal>
	{t}
	{
		for $j in //journal[title=$t]
		return

		<pair>
			{$j/volume}
			{$j/issue}
		</pair>
	}
</journal>
