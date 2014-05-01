<Books>
{
let $nl:="
"
let $x:= doc("booksales.xml")/booksales/Books/Book
let $y:= doc("booksales.xml")/booksales/Authors/Author
let $z:= doc("booksales.xml")/booksales/SalesInfo/OneSalesInfo
let $minmsrp:= min(($x/MSRP))
let $bookauthors:=doc("booksales.xml")/booksales/Books/Book[Formats/MSRP=$minmsrp]/Author
for $distinct in distinct-values($x/ISBN[not(.=$z/Book)])
let $par:=$x[ISBN=$distinct]/ISBN/..
return (<notretail><ISBN>{$distinct}</ISBN><Title>{data($par/Title)}</Title>
{
	for $auth in $par/Author
	return (<Author>{data($y[ID=data($auth)]/Name)}</Author>),

	for $formats in $par/Formats
	return <Format>{data($formats/Format)}</Format>

}
</notretail>)
}
</Books>
