<Books>
{
let $nl:="
"
let $x:= doc("booksales.xml")/booksales/Books/Book
let $y:= doc("booksales.xml")/booksales/Authors/Author
let $z:= doc("booksales.xml")/booksales/SalesInfo/OneSalesInfo
let $minmsrp:= min(($x/MSRP))
let $bookauthors:=doc("booksales.xml")/booksales/Books/Book[Formats/MSRP=$minmsrp]/Author

for $sale in $z
let $title:=$x[ISBN=data($sale/Book)]/Title
let $unit:=0
return ($nl,<bookunit>{$nl}<title>{data($title)}</title>{$nl}<unitsum>{sum(data($sale//Sales/Sale/UnitsSold))}</unitsum>{$nl}</bookunit>,$nl
)
}
</Books>
