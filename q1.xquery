<xquery1>
{
for $x in doc("booksales.xml")/booksales/Authors/Author/ID
order by $x
return <li>{data($x)}</li>
}
</xquery1>
