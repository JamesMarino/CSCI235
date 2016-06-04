for $i in distinct-values(//product[comments]/@ID)
return

	if (not(empty(//book[@IDREF=$i])) or not(empty(//journal[@IDREF=$i]))) then (
		<product>
			{distinct-values(//book[@IDREF=$i]/title | //journal[@IDREF=$i]/title)}
		</product>
	) else ()
