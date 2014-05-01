<q5xquery_retailers>
{
let $nl:="
"
let $tab:="    "
let $x:= doc("booksales.xml")/booksales/Books/Book
let $y:= doc("booksales.xml")/booksales/Authors/Author
let $z:= doc("booksales.xml")/booksales/SalesInfo/OneSalesInfo

let $salesinfo:=doc("booksales.xml")/booksales/SalesInfo

let $retailers:=$salesinfo//Retailer


let $minmsrp:= min(($x/MSRP))
let $bookauthors:=doc("booksales.xml")/booksales/Books/Book[Formats/MSRP=$minmsrp]/Author
for $retailer in distinct-values($retailers)
let $booksaleofthatretailer:=$salesinfo//Sale[Retailer=data($retailer)]/../..

return ($nl,<retailer>{$nl}<retailername>{data($retailer)}</retailername><count>{count($booksaleofthatretailer)}</count>{$nl}
	{
	for $booksale in $booksaleofthatretailer
	let $price:=data($booksale/Sales/Sale[Retailer=data($retailer)]/Price)
	let $booksaleinfo:=$booksale/../..
	let $book:=$x[ISBN=data($booksaleinfo/Book)]
	where 2*number($price)<=number(data($book/Formats[Format=data($booksale/Format)]/MSRP))
	return (<format>{$nl}{$tab}<formatname>{data($booksale/Format)}</formatname><msrp>{data($book/Formats[Format=data($booksale/Format)]/MSRP)}</msrp><price>{data($booksale/Sales/Sale[Retailer=data($retailer)]/Price)}</price><bookname>{data($book/Title)}</bookname><bookisbn>{data($book/ISBN)}</bookisbn>{$nl}</format>,$nl)
	}
</retailer>,$nl)
}
</q5xquery_retailers>

