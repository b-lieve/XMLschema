<Authors>
{
let $nl:="
"
let $x:= doc("booksales.xml")/booksales/Books/Book/Formats
let $y:= doc("booksales.xml")/booksales/Authors/Author
let $minmsrp:= min(($x/MSRP))
let $bookauthors:=doc("booksales.xml")/booksales/Books/Book[Formats/MSRP=$minmsrp]/Author

for $author in $bookauthors
let $authorinfo:=$y[ID=data($author)]
return ($nl,<author>{$nl}<id>{data($authorinfo/ID)}</id>{$nl}<name>{data($authorinfo/Name)}</name>{$nl}<phone>{data($authorinfo/Phone)}</phone>{$nl}<email>{data($authorinfo/Email)}</email>{$nl}</author>,$nl)
}
</Authors>
