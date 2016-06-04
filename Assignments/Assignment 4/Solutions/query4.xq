for $i in distinct-values(//product[comments]/@ID)
return

	<product>
		<id>
			{$i}
		</id>
		<total>
			{count(//book[@IDREF=$i]) + count(//journal[@IDREF=$i]) + count(//musicCD[@IDREF=$i])}
		</total>
	</product>
