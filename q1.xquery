<xquery1>
{
	let $newline := "
	"
	for $x in doc("booksales.xml")/booksales/Books/Book
	order by $x/WeeksBSL descending 
	return (
		<Book>{$newline}<ISBN>{data($x/ISBN)}</ISBN>{$newline}
		<Title>{data($x/Title)}</Title>{$newline}
		{
		for $y in $x/Author, $z in doc("booksales.xml")/booksales/Authors/Author
		where $y=$z/ID
		return (<Author>{data($z/Name)}</Author>,$newline)
		}</Book>
		,$newline
   	)
}
</xquery1>

